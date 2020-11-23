# QAC SFIA2 Project

## Brief

The application must:

- Be deployed to a **Virtual Machine for testing**
- Be deployed in a **managed Kubernetes Cluster for production**
- Make use of a **managed Database solution**

## Application

The application is a Flask application running in **2 micro-services** (*frontend* and *backend*).  

The database directory is available should you: 
  - want to use a MySQL container for your database at any point, *or*
  - want to make use of the `Create.sql` file to **set up and pre-populate your database**.

The application works by:
1. The frontend service making a GET request to the backend service. 
2. The backend service using a database connection to query the database and return a result.
3. The frontend service serving up a simple HTML (`index.html`) to display the result.

## Infrastructure

The **Minimum Viable Product** for this project should at least demonstrate the following infrastructure diagram:

![mvp-diagram](https://i.imgur.com/i5qfOas.png)

**Stretch goals** for this project include:

- Using **Terraform to configure the Kubernetes Cluster** for production 
- Using **Terraform and Ansible to configure the Test VM**

Completing the stretch goals should yield an infrastructure diagram similar to the following:

![stretch-digram](https://i.imgur.com/Q5zljVl.png)

---------------------
## Planning
A [Jira board](https://rohithan-carthigeya.atlassian.net/secure/RapidBoard.jspa?rapidView=4&projectKey=CNES&selectedIssue=CNES-2) was used in order to plan the tasks for the projects. The tasks were divided into the five constituent parts of the project- Terraform, Ansible, Jenkins, testing and Kubernetes.

## Risk Assessment
[Risk Assessment for the Project](https://docs.google.com/spreadsheets/d/1krJfi5wQVW0g3U0QM3nc_3Hxt0jpRJ4rrRjLNynY_XM/edit?usp=sharing)

## Process
- Terraform was used to spin up VMs for Jenkins and PyTest and Databases for Testing and Kubernetes Production.
- An Ansible playbook, with an inventory to store the hosts of the Jenkins VM, was created. Additional files with commands for installation are available for the playbook to call in order to download Jenkins/Docker/Docker-Compose in the Jenkins VM.
- A Continuous Integration Pipeline was configured in Jenkins
  - a webhook was attached to this github to ensure that whenever a change was committed to Github, the pipeline would run the Jenkinsfile automatically
  - a JenkinsFile was created to perform the processes
    - Clone the latest code
    - SSH into the VM and run the PyTests
    - upload the images to Docker
    - run the Kubernetes cluster for production
    The JenkinsFile was finished last in order to incorporate the Kubernetes Cluster.
- Kubernetes was used to create containerized applications and scale and deploy them
  - the Kubernetes was originally configured in GCP (Google Cloud Platform)
  - an AWS EKS cluster was created, with node groups.
    - In order to create a cluster, an EKS IAM Role with AmazonEKSClusterPolicy attached and an IAM User with console and programmatic access and permissions were needed.
    - The same IAM user makes the Node Group, with AmazonEKSWorkerNodePolicy, AmazonEC2ContainerRegistryReadOnly and AmazonEKS_CNI_Policy attached
    - AWS CLI and kubectl were installed

## Manual Development
Processes and Commands that needed to be performed manually
  - running Terraform and Ansible
  - ssh-keygen to create public keys for the VMs and insert them into other VMs in order to allow access
  - providing the Jenkins user with no password needed access by running ***sudo visudo*** and entering ***Jenkins ALL(ALL:ALL) NO PASSWD:ALL)
  - adding the environmental variables to the testing
  - logging into Jenkins
  - getting the External IP from ***kubectl get svc*** command and accessing it via the browser

## Testing
The tests were run with the Jenkins pipeline and took place in a PyTest VM specifically made in Terraform for conducting tests.

![Frontend Test Results](https://i.imgur.com/zGVqhRT)

![Backend Test Results](https://i.imgur.com/JHxJXSi)

## Results
![This is how the Jenkins Pipeline is running](https://i.imgur.com/QJIuQuD)

![This picture shows how to obtain the external IP address to access the app and what happens when you curl the address](https://imgur.com/a/6de2JHR)

![This picture shows what the app looks like in the browser](https://i.imgur.com/dwFeFmd)

## Issues Encountered
- There were often issues with ssh-ing into VMs.
- Whilst coding Kubernetes, curling the external IP would often reveal internal service errors
  - this was due to the environmental variables not being called correctly
- Configuring the Kubernetes commands in the pipeline was difficult as host key verification would fail or there were not enough permissions allowed to the User handling the AWS EKS cluster and AWS CLI
  - the solution used to solve this was SSH-ing into the original VM in order to run the Kubernetes cluster.
  
## Improvements and Ideas for Future Deployment Projects
- more focus on security
  - using more secrets and environmental variables
  - less hard-coding
- using Terraform to create a new environment for Kubernetes
- rewriting the Ansible playbook to incorporate roles so the playbook could act on more VMs
  - e.g. downloading Docker and Docker-compose on the testing VM beforehand instead of putting the download command in a script for the CI pipeline to run

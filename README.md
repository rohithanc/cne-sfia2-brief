# QAC SFIA2 Project

This application is a simple [Flask application](https://flask.palletsprojects.com/en/1.1.x/quickstart/#a-minimal-application), ready to be deployed, for your SFIA2 project.

The following information should be everything you need to complete the project.

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

### Database Connection

The database connection is handled in the `./backend/application/__init__.py` file.

A typical Database URI follows the form:

```
mysql+pymysql://[db-user]:[db-password]@[db-host]/[db-name]
```

An example of this would be:

```
mysql+pymysql://root:password@mysql:3306/orders
```

### Environment Variables

The application makes use of **2 environment variables**:

- `DATABASE_URI`: as described above
- `SECRET_KEY`: any *random string* will work here

### Running a Flask Application

Typically, to run a Flask application, you would:

1. Install the pip dependencies:

```
pip install -r requirements.txt
```

2. Run the application:

```
python3 app.py
```

![app-diagram](https://i.imgur.com/wnbDazy.png)

## Testing

Unit Tests have been included for both the frontend and backend services.

To test the backend service, you will need two things:

1. A database called `testdb`
2. A `TEST_DATABASE_URI` environment variable, which contains the database connection for the `testdb` database.

You can run the tests using the command:

```
pytest
```

To generate a coverage report, you will need to run:

```
pytest --cov application
```

## Infrastructure

The **Minimum Viable Product** for this project should at least demonstrate the following infrastructure diagram:

![mvp-diagram](https://i.imgur.com/i5qfOas.png)

**Stretch goals** for this project include:

- Using **Terraform to configure the Kubernetes Cluster** for production 
- Using **Terraform and Ansible to configure the Test VM**

Completing the stretch goals should yield an infrastructure diagram similar to the following:

![stretch-digram](https://i.imgur.com/Q5zljVl.png)

**Good luck!**
# cne-sfia2-brief

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

## Testing
The tests were run with the Jenkins pipeline and took place in a PyTest VM specifically made in Terraform for conducting tests.

![Frontend Test Results](https://imgur.com/a/zGVqhRT)

![Backend Test Results](https://imgur.com/a/JHxJXSi)

## Results
![This is how the Jenkins Pipeline is running](https://imgur.com/a/QJIuQuD)

![This picture shows how to obtain the external IP address to access the app and what happens when you curl the address](https://imgur.com/a/6de2JHR)

![This picture shows what the app looks like in the browser](https://imgur.com/a/dwFeFmd)

## Issues Encountered

## Improvements and Ideas for Future Deployment Projects

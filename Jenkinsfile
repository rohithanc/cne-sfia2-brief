pipeline {
  agent any
  stages {
    stage ('Check to see if there is Git folder already') {
      steps {
        sh "chmod +x ./scripts/git-check.sh"
        sh "./scripts/git-check.sh"
      }
    }
    stage('ssh into pytestVM') {
      steps {
        sh "chmod +x ./scripts/new-script.sh"
        sh "./scripts/new-script.sh"
      }
    }
    stage('Communicate'){
      steps {
        sh 'echo Hello World- I am communicating via Jenkins'
      }
    }
    stage('Build images and push to Dockerhub'){
      steps {
        sh "chmod +x ./scripts/docker-images.sh"
        sh "./scripts/docker-images.sh"
      }
    }
    stage('Kubernetes'){
      steps {
        sh "chmod  a+x ./kubernetes/kubernetes.sh"
        sh "./kubernetes/kubernetes.sh"
      }
    }
}
}

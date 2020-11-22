pipeline {
  agent any
  stages {
    stage ('Check to see if there is Git folder already') {
      steps {
        sh "chmod +x git-check.sh"
        sh "./git-check.sh"
      }
    }
    stage('ssh into pytestVM') {
      steps {
        sh "chmod +x new-script.sh"
        sh "./new-script.sh"
      }
    }
    stage('Communicate'){
      steps {
        sh 'echo Hello World- I am communicating via Jenkins'
      }
    }
    stage('Build images and push to Dockerhub'){
      steps {
        sh "chmod +x docker-images.sh"
        sh "./docker-images.sh"
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

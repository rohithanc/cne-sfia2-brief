pipeline {
  agent any
  stages {
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
        sh "chmod +x kubernetes.sh"
	sh "./kubernetes.sh"
      }
    }
}
}

pipeline {
  agent any
  stages {
    stage('ssh into pytestVM') {
      steps {
        sh "ssh -tt -i /home/jenkins/.ssh/id_rsa ubuntu@52.215.78.226 'whoami && exit'"
      }
    }
    stage('Communicate'){
      steps {
        sh 'echo Hello World- I am communicating via Jenkins'
      }
    }
  }
}

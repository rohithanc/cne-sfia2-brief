pipeline {
  agent any
  stages {
    stage('ssh into pytestVM') {
      steps {
        sh "./new-script.sh"
      }
    }
    stage('Communicate'){
      steps {
        sh 'echo Hello World- I am communicating via Jenkins'
      }
    }
  }
}

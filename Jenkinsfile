pipeline {
  agent any
  stages {
    stage('init') {
      steps {
        echo 'test initialization step'
        sh 'npm install'
      }
    }
    stage('test') {
      steps {
        sh 'npm test'
      }
    }
  }
  post {
    success {
      sh 'echo "it succeeded"'
    }
    failure {
      sh 'echo "it failed"'
    }
  }
}

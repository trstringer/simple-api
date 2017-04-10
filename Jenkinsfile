pipeline {
  agent {
    dockerfile {
      filename 'Dockerfile'
    }
    
  }
  stages {
    stage('init') {
      steps {
        echo 'test initialization step'
        sh 'whoami'
      }
    }
    stage('tests') {
      steps {
        sh 'npm test'
      }
    }
  }
}
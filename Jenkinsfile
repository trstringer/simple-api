pipeline {
  agent {
    dockerfile {
      filename 'Dockerfile'
    }
    
  }
  stages {
    stage('test') {
      steps {
        echo 'test initialization step'
        sh 'npm test'
      }
    }
  }
}
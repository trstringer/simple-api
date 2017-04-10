pipeline {
  agent any

  environment {
    ARM_CLIENT_ID = credentials('ARM_CLIENT_ID')
    ARM_SUBSCRIPTION_ID = credentials('ARM_SUBSCRIPTION_ID')
    ARM_TENANT_ID = credentials('ARM_TENANT_ID')
    ARM_CLIENT_SECRET = credentials('ARM_CLIENT_SECRET')
  }

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
      sh 'echo $ARM_SUBSCRIPTION_ID'
    }
    failure {
      sh 'echo "it failed"'
      sh 'echo $ARM_TENANT_ID'
    }
  }
}

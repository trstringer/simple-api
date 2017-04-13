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
      sh 'cd infra/prod && terraform apply'
    }
    failure {
      sh 'echo "it failed"'
    }
  }
}

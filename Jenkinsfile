pipeline {
  agent any

  stages {
    stage('Clone') {
      steps {
        git branch: 'main', url: 'https://github.com/sharanch/cicd-poc.git'
      }
    }

    stage('Build Docker Image') {
      steps {
        script {
          docker.build('cicd-poc-image')
        }
      }
    }

    stage('Run Container') {
      steps {
        sh '''
          docker rm -f cicd-poc-container || true
          docker run -d -p 5000:5000 --name cicd-poc-container cicd-poc-image
        '''
      }
    }

    stage('Deploy') {
      steps {
        echo 'Trigger deployment script or Helm chart here'
      }
    }
  }

  post {
    always {
      echo 'Cleaning up workspace...'
      cleanWs()
    }
  }
}

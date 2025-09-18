pipeline {
  agent any

  stages {
    stage('Clone') {
      steps {
        git branch: 'main', url: 'https://github.com/sharanch/cicd-poc.git'
        // If private repo, use: 
        // git branch: 'main', url: 'https://github.com/sharanch/cicd-poc.git', credentialsId: 'github-creds'
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
  }

  post {
    always {
      echo 'Cleaning up workspace...'
      cleanWs()
    }
  }
}

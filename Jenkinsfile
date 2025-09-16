pipeline {
  agent any

  stages {
    stage('Clone') {
      steps {
        git 'https://github.com/your-username/cicd-poc.git'
      }
    }

    stage('Build Docker Image') {
      steps {
        script {
          docker.build('cicd-poc-image')
        }
      }
    }

    stage('Push to Docker Hub') {
      steps {
        withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'USER', passwordVariable: 'PASS')]) {
          sh """
            echo $PASS | docker login -u $USER --password-stdin
            docker tag cicd-poc-image $USER/cicd-poc-image:latest
            docker push $USER/cicd-poc-image:latest
          """
        }
      }
    }

    stage('Deploy') {
      steps {
        echo 'Trigger deployment script or Helm chart here'
      }
    }
  }
}
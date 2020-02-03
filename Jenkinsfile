pipeline {
  agent { dockerfile true }

  stages {
    stage('Checkout Repository') {
      steps {
        sh checkout scm
      }
    }
    stage('build') {
      steps{
        def app = docker.build("flaskky:${env.BUILD_ID}")
      }
    }
    stage('test') {
      steps {
        sh 'python test.py'
      }
      post {
        always {
          junit 'test-reports/*.xml'
        }
      }
    }
    stage('Publish') {
      when {
        branch 'master'
      }
      steps {
        docker.withRegistry([ 'https://registry.hub.docker.com', 'docker-hub-credentials']) {
            app.push("latest")
        }
      }
    }
  }
}

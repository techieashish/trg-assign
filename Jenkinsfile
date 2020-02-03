node {
  agent { dockerfile true }
  def app
  stages {
    stage('Checkout Repository') {
      checkout scm
    }
    stage('build') {
      app = docker.build("flaskky:${env.BUILD_ID}")
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

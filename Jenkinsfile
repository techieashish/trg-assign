node {
  def app
    stage('Checkout Repository') {
         checkout scm
    }
    stage('build') {
      app = docker.build("flaskky:${env.BUILD_ID}")
    }
    stage('test') {
      app.inside{sh 'python test.py'}
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
      docker.withRegistry([ 'https://registry.hub.docker.com', 'docker-hub-credentials']) {
            app.push("latest")
      }
    }
  }
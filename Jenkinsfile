node {
    def app
    stage('Checkout Repository') {
         checkout scm
    }
    stage('build') {
      app = docker.build("flaskky:${env.BUILD_ID}", "-f ${DOCKER_FILES_DIR}/${dockerfile} ${DOCKER_FILES_DIR}")
    }
    stage('Publish') {
      docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
            app.push("latest")
      }
    }
  }
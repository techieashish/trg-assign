node {
    def app
    stage('Checkout Repository') {
         checkout scm
    }
    stage('build') {
      app = docker.build("flaskky:${env.BUILD_ID}")
    }
    stage('Publish') {
      docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
            app.push("latest")
      }
    }
    stage('Deploy') {
      sh 'ansible-playbook local-playbook.yml '
    }
  }
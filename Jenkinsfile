node{
    stage('SCM checkout'){
                git credentialsId: 'dc6d8db2-f75e-4a78-bbad-4f55e0503c7a', url: 'https://github.com/timurgaleev/java-test-app'
    }
   stage('MVN Package'){
    def mvnHome = tool name: 'maven-3', type: 'maven'
    sh "${mvnHome}/bin/mvn clean package"
  }
    stage('Build Docker Image'){
    sh 'docker build -t timurgaleev/provectus-test:0.0.1 .'
  }
}
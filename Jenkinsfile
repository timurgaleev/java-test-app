node{
    stage('SCM checkout'){
        checkout scm
    }
    
    stage('MVN Package'){
        def mvnHome = tool name: 'maven-3', type: 'maven'
        sh "${mvnHome}/bin/mvn clean package"
    }
    
    stage('Build Docker Image'){
        sh 'docker build -t timurgaleev/provectus-test:0.0.1 .'
    }
    
    stage('Push to Docker Hub'){
        withCredentials([string(credentialsId: 'docker-pwd', variable: 'dockerHubPwd')]) {
            sh "docker login -u timurgaleev -p ${dockerHubPwd}"
        }
        sh 'docker push timurgaleev/provectus-test:0.0.1'
    }
}

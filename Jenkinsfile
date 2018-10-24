node{
    stage('SCM checkout'){
        checkout scm
    }
    
    stage('MVN Package'){
        def mvnHome = tool name: 'maven-3', type: 'maven'
        def mvnCMD = "${mvnHome}/bin/mvn"
        sh "${mvnCMD} clean package"
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
	stage('Remove Previous Container'){
		try{
			def dockerRm = 'docker stop provectus-test'
			sshagent(['docker-dev']) {
				sh "ssh -o StrictHostKeyChecking=no ec2-user@35.158.125.213 ${dockerStop}"
            }
		sh = "docker stop provectus-test"
        }catch(error){
		//  do nothing if there is an exception
        }
    }
	
	stage('Run Container on Dev Server'){
        def dockerRun = 'docker run -p 8080:8080 -d --name provectus-test --link mysql-provectus:mysql timurgaleev/provectus-test:0.0.1'
        sshagent(['dev-server']) {
       sh "ssh -o StrictHostKeyChecking=no ec2-user@35.158.125.213 ${dockerRun}"
     }
   }
}

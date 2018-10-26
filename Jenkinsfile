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
        sh 'docker build -t timurgaleev/provectus-test:0.0.3 .'
    }
    
    stage('Push to Docker Hub'){
        withCredentials([string(credentialsId: 'docker-pwd', variable: 'dockerHubPwd')]) {
            sh "docker login -u timurgaleev -p ${dockerHubPwd}"
        }
        sh 'docker push timurgaleev/provectus-test:0.0.3'
    }	
	stage('Remove Previous Containers'){
		try{
			def dockerRm = 'docker rm -f provectus-test'
			def dockerRmMYSQL = 'docker rm -f mysql-provectus'
			sshagent(['dev-server']) {
			sh "ssh -o StrictHostKeyChecking=no ec2-user@35.158.125.213 ${dockerRm}"
			sh "ssh -o StrictHostKeyChecking=no ec2-user@35.158.125.213 ${dockerRmMYSQL}"
            }
        }catch(error){
		//  do nothing if there is an exception
        }
    }
	
	stage('Run Container on Dev Server'){
        def dockerRunMySQL = 'docker run --name mysql-provectus -e MYSQL_ROOT_PASSWORD=143625 -e MYSQL_DATABASE=provectus -d mysql:5.6'
	def dockerRunApp = 'docker run -p 8080:8080 -d --name provectus-test --link mysql-provectus:mysql timurgaleev/provectus-test:0.0.3'
        sshagent(['dev-server']) {
       	sh "ssh -o StrictHostKeyChecking=no ec2-user@35.158.125.213 ${dockerRunMySQL}"
	sh "ssh -o StrictHostKeyChecking=no ec2-user@35.158.125.213 ${dockerRunApp}"
     }
   }
	stage('Email Notification'){
     	 mail bcc: '', body: 'Delivery is done',
	cc: '', from: '', replyTo: '', subject: 'Jenkins job', to: 'aksissound@gmail.com'
   }
}

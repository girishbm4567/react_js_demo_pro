pipeline {
    agent any
    stages {
        stage ("Install Dependencies"){
            steps {
                sh 'npm install'
            }
        }
        
        stage ("Building Artifact"){
            steps {
                sh 'npm run build'
            }
        }
        
        stage('Building Docker image') {
            steps {
                script {
                    if (env.BRANCH_NAME == 'dev') {
			    //echo "From dev"
			    sh 'chmod +x ./docker/build.sh'
		            def image_name= "girishbm4567/reactjs-demo-development:${env.BUILD_ID}.0"
			    //echo "${image_name}"
			    sh "./docker/build.sh ${image_name}"
			    
			    
		    } else if (env.BRANCH_NAME == 'master') {
			    echo "from master"
			    sh 'chmod +x ./docker/build.sh'
                            def image_name= "girishbm4567/reactjs-demo-production:${env.BUILD_ID}.0"
                            echo "${image_name}"
                            sh "./docker/build.sh ${image_name}"
			   
                        }
                    }
                }
        }
	    
	stage('Pushing Docker image') {
            steps {
                script {
			withCredentials([usernamePassword(credentialsId: 'dockerHub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
				    sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
				    if (env.BRANCH_NAME == 'dev') {
					    def image_name= "girishbm4567/reactjs-demo-development"
					    sh "docker push ${image_name}:${env.BUILD_ID}.0"
					    sh "docker tag ${image_name}:${env.BUILD_ID}.0 ${image_name}:latest"
          			            sh "docker push ${image_name}:latest"
				            echo "Docker image is pushed to girishbm4567/reactjs-demo-development repository"
					    
						    
				    }else if (env.BRANCH_NAME == 'master') {
					    def image_name= "girishbm4567/reactjs-demo-production"
					    sh "docker push ${image_name}:${env.BUILD_ID}.0"
					    sh "docker tag ${image_name}:${env.BUILD_ID}.0 ${image_name}:latest"
          			            sh "docker push ${image_name}:latest"
				            echo "Docker image is pushed to girishbm4567/reactjs-demo-production repository"
				    }
				
			    } 
		}
		    
                    
	    }
        
	    post {
		    success {
			    script {
				    if (env.BRANCH_NAME == 'dev' ){
					    //emailext body: 'Job dev successful', subject: 'Job Success', to: 'girishb.m4567@gmail.com'
					    input message: 'Do you want to Deploy application in Development environment? (Click "Proceed" to continue)'
					    build job: 'Deploy_reactjs_app_to_Dev_env', wait: false
					    echo "Deploying Application to Development server"
				    } else if (env.BRANCH_NAME == 'master' ){
					    //emailext body: 'Job master successful', subject: 'Job Success', to: 'girishb.m4567@gmail.com'
					    input message: 'Do you want to Deploy application in Production environment? (Click "Proceed" to continue)'
					    build job: 'Deploy_reactjs_app_to_Prod_env' , wait: false
					    echo "Deploying Application to Production server."
				    }
			    }
		    }
	    }
	}    
	
    }
	
}

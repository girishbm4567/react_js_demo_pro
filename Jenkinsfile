pipeline {

    agent any

    stages {
        stage ("Install Dependencies"){
            steps {
                sh 'npm install'
            }
        }
        
        stage ("Build"){
            steps {
                sh 'npm run build'
            }
        }
        
        stage('Deploy') {
            steps {
                script {
                    if (env.BRANCH_NAME == 'dev') {
			    stage ("Building Docker image"){
				  
					    //echo "From dev"
			    		    sh 'chmod +x ./docker/build-dev.sh'
		                            def image_name= "girishbm4567/reactjs-demo-development:${env.BUILD_ID}.0"
			                    //echo "${image_name}"
			                    sh "./docker/build-dev.sh ${image_name}"
				    
			    }
			    stage ("Pushing Docker image to DockerHub"){
				    
					    withCredentials([usernamePassword(credentialsId: 'dockerHub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
						    sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
						    sh "docker push ${image_name}"
						    echo "Docker image is pushed to girishbm4567/reactjs-demo-development repository"
					  
					    
				    }
			    }
					   
			    
			    
		    } else if (env.BRANCH_NAME == 'master') {
			    echo "from master"
			    sh 'chmod +x ./docker/build-dev.sh'
                            def image_name= "girishbm4567/reactjs-demo-production:${env.BUILD_ID}.0"
                            echo "${image_name}"
                            sh "./docker/build-dev.sh ${image_name}"
			    withCredentials([usernamePassword(credentialsId: 'dockerHub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
				    sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
          			    sh "docker push ${image_name}"
				    echo "Docker image is pushed to girishbm4567/reactjs-demo-production repository"
			    }
                        }
                    }
                }
        }
    }
}

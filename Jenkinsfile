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
                        echo "From dev"
			sh 'chmod +x ./docker/build-dev.sh'
			def image_name= "react_app_dev:${env.BUILD_ID}.0"
			echo "${image_name}"
			sh "./docker/build-dev.sh ${image_name}"
                        } else if (env.BRANCH_NAME == 'master') {
                        echo "from master"
                        }
                    }
                }
                    

            




        }
    }
}

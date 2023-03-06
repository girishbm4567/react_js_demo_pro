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
			sh './docker/build-dev.sh ${env.BUILD_ID} '
                        } else if (env.BRANCH_NAME == 'master') {
                        echo "from master"
                        }
                    }
                }
                    

            




        }
    }
}

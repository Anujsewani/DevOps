pipeline{
    agent any
        environment{
            //dockerImage=''
            //registy="sewani/Djangohell0"
            DOCKERHUB_CREDENTIALS=credentials('dockerhub')
        }
        stages{
            stage('gitclone'){
                steps{
                    checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'Github_Id', url: 'https://github.com/Anujsewani/DevOps.git']])
                    
                }
            }
            stage('docker build'){
                steps{
                    script{
                        
                        //def dockerHubCredentials = credentials('dockerhub')
                        def dockerImage = 'sewani/djangohell0'
                        sh "docker build -t ${dockerImage}:${env.BUILD_NUMBER} ."
                    }
                }
            }
            stage('docker Login'){
                steps{
                    script{
                    sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
                    //def dockerHubCredentials = credentials('dockerhub')
                    //sh "docker login -u ${DOCKERHUB_CREDENTIALS.username} -p ${DOCKERHUB_CREDENTIALS.password}"
                    }
                }
            }
            stage('docker push'){
                steps{
                    script{
                    //sh 'docker push sewani/Djangohello:latest'
                    def dockerImage = 'sewani/djangohell0'
                    sh "docker push ${dockerImage}:${env.BUILD_NUMBER}"
                    }
                }
            }
        }
       
}
             

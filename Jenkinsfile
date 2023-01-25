pipeline {
    agent any 
    environment {       
        
        DOCKERHUB_CREDENTIALS_USR = credentials('docker_user_password') 
        VERSION = ${env.BUILD_ID}
      }

    stages {
      stage('Building with gradle ') {
             steps {
                    withGradle {
                    sh './gradlew build'
                    }
                }

            }

       stage('Docker Build') {
        steps {
      	sh 'docker build -t bharatverman/learndevops:${VERSION} .'
      }
        }

      

       stage(' Push Docker Image') {
      steps{
         script {
            sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u bharatverman -p Vbachub310$' //$DOCKERHUB_CREDENTIALS_USR --password-stdin'
            sh 'docker push bharatverman/learndevops'
            sh 'docker logout'
          }
        }
      }
    } 

}


pipeline {
    agent any 
    environment {     
         = ${env.BUILD_ID}
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
            withCredentials([string(credentialsId: 'docker_pass', variable: 'docker_password')]) {
                    sh '''
                      docker login -u bharatverman -p $docker_password
                      docker push bharatverman/learndevops:${VERSION}
                      docker rmi bharatverman/learndevops:${VERSION}
                      docker logout
                      '''
            }
            
          }
        }
      }
    } 

}


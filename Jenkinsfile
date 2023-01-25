pipeline {
    agent any 
    environment {     
         VERSION = "${env.BUILD_ID}"
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
                    sh '''
                      docker login -u bharatverman -p Vbachub310$
                      docker push bharatverman/learndevops:${VERSION}
                      docker rmi bharatverman/learndevops:${VERSION}
                      docker logout
                      '''
            
            
          }
        }
      }
    } 

}


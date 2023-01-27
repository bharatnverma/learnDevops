pipeline {
    agent any 

     parameters {

        booleanParam(name: 'codeBuild', defaultValue: false, description: 'Gradle Build')
        booleanParam(name: 'dockerBuild', defaultValue: false, description: 'Docker Image Build')
        booleanParam(name: 'imagePush', defaultValue: false, description: 'Docker image push')
        booleanParam(name: 'deploy', defaultValue: false, description: 'Deploy to K8s Cluster')
        booleanParam(name: 'undeploy', defaultValue: false, description: 'Rollback recent deployment')
    }

    environment {     
         VERSION = "${env.BUILD_ID}"
      }

    stages {
      stage('Code Build ') {
             when { expression { params.codeBuild } }
             steps {
                    withGradle {
                    sh './gradlew build'
                    }
                }

            }

       stage('Docker Build') {
        when { expression { params.dockerBuild } }
        steps {
      	sh 'docker build -t bharatverman/learndevops:${VERSION} .'
      }
        }

      

       stage(' Push Docker Image') {
      when { expression { params.imagePush } }
      steps{
         script {            
                    sh '''
                      docker login -u bharatverman -p Vbachub310$
                      docker push bharatverman/learndevops
                      docker rmi bharatverman/learndevops
                      docker logout
                      '''
            
            
          }
        }
      }
    } 

}


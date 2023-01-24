pipeline {
    agent any 
    environment {
        
        registry = "bharatverman/learndevops"
        registryCredential = 'docker_user_password'  
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
      	sh 'docker build -t webapp .'
      }
        }

      

       stage(' Push Docker Image') {
      steps{
         script {
            docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
          }
        }
      }
    } 

}
}


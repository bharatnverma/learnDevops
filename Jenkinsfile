pipeline {
    agent any  
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

      environment{
        
        registry = "bharatverman/learndevops"
        registryCredential = 'docker_user_password'  
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


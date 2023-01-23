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
        agent any
      steps {
        sh 'echo $WORKSPACE'
        sh 'echo $JENKINS_HOME'
      	sh 'docker build -t webapp .'
      }
        } 

}
}


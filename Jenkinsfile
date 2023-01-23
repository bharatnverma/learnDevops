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
        sh 'cp /home/bharat/learndevops/learnDevops/sampleWeb-0.0.1-SNAPSHOT.war $WORKSPACE  '
        sh 'cp /home/bharat/learndevops/learnDevops/sampleWeb-0.0.1-SNAPSHOT.war $JENKINS_HOME  '
      	sh 'docker build -t webapp .'
      }
        } 

}
}


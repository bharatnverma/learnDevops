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
}
}


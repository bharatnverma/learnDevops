pipeline {
    agent any
  
    stages {
          stage('Building with gradle ') {
             steps {
                  withGradle {
                    chmod +x gradlew
                    ./gradle build
                        }
                   }
                }

      }
}

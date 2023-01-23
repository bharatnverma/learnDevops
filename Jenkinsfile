pipeline {
    agent any
  
    stages {
          stage('Building with gradle ') {
             steps {
                  scripts {
                        withGradle {
                    chmod +x gradlew
                    ./gradlew build
                        }
                   }
                }

      }
}
}


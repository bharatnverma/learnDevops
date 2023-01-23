pipeline {
    agent any
  
    stages {
          stage('Gradle Build') {
      steps {
        withGradle {
        sh './gradlew build'
  }
    }
}
}

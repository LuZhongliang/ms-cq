node {
//    stage('Preparation') { // for display purposes
//       // Get some code from a GitHub repository
//       git 'https://github.com/wizardbyron/ms-cq.git'
//    }
    stage('Test') {
      // Run the maven build
      if (isUnix()) {
         sh "./gradlew test"
      } else {
         echo "cannot start on other os"
      }
   }
   stage('Build') {
      // Run the maven build
      if (isUnix()) {
         sh "docker-compose up -d --build"
      } else {
         echo "cannot start on other os"
      }
   }
}
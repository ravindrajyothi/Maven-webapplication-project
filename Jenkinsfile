pipeline{
    agent any
    tools{
        maven "maven-3.9.9"
    }
    stages{
        stage("Git checkout"){
            steps{
                git branch: 'development', credentialsId: '188dedcc-8f19-42d1-9707-6c706feb8913', url: 'https://github.com/ravindrajyothi/Maven-webapplication-project.git'
            }
        }
        stage("Maven-Build"){
            steps{
                sh "mvn clean package"
            }
        }
        stage("Sonar Report"){
            steps{
                sh "mvn clean sonar:sonar package"
            }
        }
        stage("Nexus Backup"){
            steps{
                sh "mvn clean package deploy"
            }
        }
        stage('DeployAppToTomcat'){
           steps{
        sh """
            curl -u Ravindra:bindu \
            --upload-file /var/lib/jenkins/workspace/jio-dec-PL/target/maven-web-application.war \
            "http://52.207.135.214:9090/manager/text/deploy?path=/maven-web-application&update=true"
        """

          }
        }
    
    }  // stages end tag
    post {
  success {
    notifyBuild(currentBuild.result)
  }
  failure {
notifyBuild(currentBuild.result)
      }
}
}//pipeline closing


def notifyBuild(String buildStatus = 'STARTED') {
  // build status of null means successful
  buildStatus =  buildStatus ?: 'SUCCESS'

  // Default values
  def colorName = 'RED'
  def colorCode = '#FF0000'
  def subject = "${buildStatus}: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'"
  def summary = "${subject} (${env.BUILD_URL})"

  // Override default values based on build status
  if (buildStatus == 'STARTED') {
    color = 'YELLOW'
    colorCode = '#FFFF00'
  } else if (buildStatus == 'SUCCESS') {
    color = 'GREEN'
    colorCode = '#00FF00'
  } else {
    color = 'RED'
    colorCode = '#FF0000'
  }

  // Send notifications
  slackSend (color: colorCode, message: summary, channel: '#devops-enthusiast')
    
} //pipeline end tag

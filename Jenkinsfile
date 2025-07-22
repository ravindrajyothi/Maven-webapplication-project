node
{
    def mavenHome=tool name:"maven-3.9.9"
    echo "git branch name: ${env.BRANCH_NAME}"
    echo "build number is: ${env.BUILD_NUMBER}"
    echo "node name is: ${env.NODE_NAME}"
    stage('stage 1')
    {
        notifyBuild('STARTED')
        checkout scmGit(branches: [[name: '*/development']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/Mamatha1718/Maven-WebApplication.git']])
    }
    stage('Build')
    {
        sh "${mavenHome}/bin/mvn clean package"
    }
    stage('SonarQube Report')
    {
        sh "${mavenHome}/bin/mvn sonar:sonar"
    }
    stage('Nexus Artifactory')
    {
        sh "${mavenHome}/bin/mvn clean deploy"
    }
    stage('Tomcat Deploy')
    {
        sh """
        curl -u mamatha:password\
        --upload-file /var/lib/jenkins/workspace/jio-scripted-way-PL/target/maven-web-application.war\
        "http://3.110.28.237:8080//manager/text/deploy?path=/maven-web-application&update=true"
        """
        notifyBuild(currentBuild.result)
    }
}
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
  slackSend (color: colorCode, message: summary, channel: '#jio-channel')
  slackSend (color: colorCode, message: summary, channel: '#jiodev')
}

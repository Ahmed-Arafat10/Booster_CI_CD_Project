pipeline {
  agent {label "Project"}

    stages {
        stage('Preparation') {
            steps {
                  }
        
                              }
      
         stage('Build Image') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'DockerHub', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                sh """
                docker build . -f dockerfile -t ahmedarafat10/django_project:latest
                """
            }
        }
        
        }   
         stage('Push Image') {
               steps {
                withCredentials([usernamePassword(credentialsId: 'DockerHub', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
               
                sh """
                docker login -u ${USERNAME}  -p ${PASSWORD}
                docker push ahmedarafat10/django_project:latest
                """
               }
           }
        
        }   
         stage('Depoly') {
            steps {
                   sh """
                docker run -d -p 3000:8000 ahmedarafat10/django_project:latest
                """
                }
        }   
      
         stage('Notification') {
            steps {
                post{
                      success{
                        slackSend(color:"#00ffcc",message: "pipeline succeeded")//Green
                        }
                        // failure not for syntax errors in scrip , its as for example $ docker command in pipeline that dont installed in it docker CLI
                        failure{
                        slackSend(color:"#cc3300",message: "pipeline failed")//Red
                        }
        }
          
        }
        
        }   

     
      
    }
}

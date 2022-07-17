pipeline {
    agent any

    stages {
        stage('Initialize')
        {
            steps{
                script{ 
                    def dockerHome = tool 'Docker'
                    env.PATH = "${dockerHome}/bin:${env.PATH}"
                }
            }
        }
        stage('Build') 
        {
            agent any
            steps {
                echo 'Building..'
                sh "whoami"
                sh "echo $PATH"
                sh "docker build -t mywebapp ."
            }
        }
        stage('Docker Login'){
        steps{
            withCredentials([usernamePassword(credentialsId:'dockerid',usernameVariable:'USR',passwordVariable:'PWD')])
            {
                sh "docker login -u=${env.USR} -p=${env.PWD}"
            }
        }
        }
        stage('docker_push') {
            steps {
                sh "docker tag mywebapp biprodatta/mywebapp"
                sh "docker images"
                sh "docker push biprodatta/mywebapp:latest"
                
            }
        }
        stage('Test') {
            steps {
                sh "docker images"
                sh "docker pull biprodatta/mywebapp:latest"
                sh "docker run -i -t -d -p 80:80 biprodatta/mywebapp:latest"
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}

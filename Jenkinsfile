pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building..'
                docker build -t mywebapp .
            }
        }
        stage('Docker Login'){
        steps{
            withCredentials([usernamePassword(credentialsId:'dockerid',usernameVariable:'USR',passwordVariable:'PWD')])
            {
                bat "docker login -u=${env.USR} -p=${env.PWD}"
            }
        }
        }
        stage('docker_push') {
            steps {
                docker tag mywebapp biprodatta/mywebapp
                docker push biprodatta/myrepo:v1
                
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
                docker images
                docker pull biprodatta/myrepo:v1
                docker run -i -t -d -p 80:80 mywebapp
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}

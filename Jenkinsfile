pipeline {
    agent any

    stages {
        stage('Initialize')
        {
            def dockerHome = tool 'MyDocker'
            env.PATH = "${dockerHome}/bin:${env.PATH}"
        }
        stage('Build') 
        {
            agent any
            steps {
                echo 'Building..'
                sh "docker build -t mywebapp ."
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
                sh "docker tag mywebapp biprodatta/mywebapp"
                sh "docker push biprodatta/myrepo:v1"
                
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
                sh "docker images"
                sh "docker pull biprodatta/myrepo:v1"
                sh "docker run -i -t -d -p 80:80 mywebapp"
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}

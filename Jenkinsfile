pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building..'
                docker build -t mywebapp .
                docker login
                docker tag myfirstwebapp myusername/myfirstwebapp
                docker push myusername/myfirstwebapp
                
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
                docker images
                docker pull myusername/myfirstwebapp
                docker run -i -t -d -p 80:80 myfirstwebapp
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}

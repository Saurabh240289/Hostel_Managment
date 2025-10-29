pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/Saurabh240289/Hostel_Managment.git'
            }
        }
        stage('Build with Maven') {
            steps {
                sh 'mvn clean package'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t skulkarni24/hostel_management'
            }
        }
        stage('Push to DockerHub') {
            steps {
                sh '''
                    docker login -u skulkarni24 -p Saurabh@240289!
                    docker push skulkarni24/hostel_management
                '''
            }
        }
        stage('Run Docker Container') {
            steps {
                sh '''
                    docker rm -f sk-hostel-container || true
                    docker run -d --name sk-hostel-container -p 8081:8080 skulkarni24/hostel_management
                '''
            }
        }
    }
}

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
                sh 'docker build -t Saurabh240289/Hostel_Management'
            }
        }
        stage('Push to DockerHub') {
            steps {
                sh '''
                    docker login -u skulkarni -p Saurabh@240289!
                    docker push Saurabh240289/Hostel_Management
                '''
            }
        }
        stage('Run Docker Container') {
            steps {
                sh '''
                    docker rm -f sk-hostel-container || true
                    docker run -d --name sk-hostel-container -p 8081:8080 Saurabh240289/Hostel_Management
                '''
            }
        }
    }
}

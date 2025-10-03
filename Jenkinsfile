pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/himanshitekade/hostel-management.git'
            }
        }
        stage('Build with Maven') {
            steps {
                sh 'mvn clean package'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t himanshitekade/ht-hostel-management .'
            }
        }
        stage('Push to DockerHub') {
            steps {
                sh '''
                    docker login -u himanshitekade -p H!m@n$h!@0410
                    docker push himanshitekade/ht-hostel-management
                '''
            }
        }
        stage('Run Docker Container') {
            steps {
                sh '''
                    docker rm -f ht-hostel-container || true
                    docker run -d --name ht-hostel-container -p 8081:8080 himanshitekade/ht-hostel-management
                '''
            }
        }
    }
}

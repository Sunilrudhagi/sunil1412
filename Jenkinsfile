pipeline {
    agent any

    environment {
        docker_image = 'https://github.com/sunilrudhagi/sunil1412.git/test-main:latest'
    }

    stages {
        stage('Clone Repository') {
            steps {
                git url: 'https://github.com/https://github.com/sunilrudhagi/sunil1412.git/scorll-web.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh "docker build -t ${docker_image} ."
            }
        }

        stage('Login to DockerHub') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', usernameVariable: 'docker_username', passwordVariable: 'docker_password')]) {
                        sh "echo $docker_password | docker login -u $docker_username --password-stdin"
                    }
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                sh "docker push ${docker_image}"
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                sh "microk8s.kubectl apply -f deploy.yml"
            }
        }
    }
}


pipeline {
    agent {docker { image 'ruby:2.6.1' }}
    stages {
        stage('requirements') {
            steps {
                sh 'gem install bundler -v 2.0.1'
            }
        }
        stage('Bundle'){
            steps{
                echo "Executando o Bundle"
                sh "bundle install"
            }
        }
        stage('STAGE 01'){
            steps{
                echo "Pipeline Usando Jenkinsfile"
                sh "rails db:create"
            }
        }
        stage('STAGE 02'){
            steps{
                echo "Pipeline Usando Jenkinsfile"
                sh "rails db:migrate"
            }
        }
        stage('STAGE 03'){
            steps{
                echo "Pipeline Usando Jenkinsfile"
                sh "docker build . -t seas_principal_homolog_7004"
            }
        }
        stage('STAGE 04'){
            steps{
                echo "Pipeline Usando Jenkinsfile"
                sh "docker tag seas_principal_homolog_7004 192.168.0.1:5000/seas_principal_homolog_7004"
            }
        }
        stage('STAGE 05'){
            steps{
                echo "Pipeline Usando Jenkinsfile"
                sh "docker push 192.168.0.1:5000/seas_principal_homolog_7004"
            }
        }
    }
}
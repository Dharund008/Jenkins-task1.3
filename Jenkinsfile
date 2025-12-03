pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID     = credentials('access')
        AWS_SECRET_ACCESS_KEY = credentials('secret_key_aws')
        AWS_SESSION_TOKEN     = credentials('token_session')   // optional
        TF_WORKSPACE = "task3"
    }

    options {
        timestamps()
    }

    triggers {
        pollSCM('* * * * *') // Poll every 1 min (optional)
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
                echo "Checked out branch: ${env.GIT_BRANCH}"
            }
        }

        stage('Terraform Init') {
            steps {
                sh '''
                terraform --version
                terraform init
                echo "Terraform initialized Successfully in branch: ${env.GIT_BRANCH}"
                '''
            }
        }

        stage('Terraform Plan') {
            steps {
                sh '''
                terraform plan -out=tfplan -input=false
                echo "Terraform plan created Successfully in branch: ${env.GIT_BRANCH}"
                '''
            }
        }

        stage('Approval') {
            when {
                anyOf {
                    branch 'main'
                    branch 'master'
                }
            }
            steps {
                timeout(time: 10, unit: 'MINUTES') {
                    input message: "Approve Terraform Apply?"
                }
            }
        }

        stage('Terraform Apply') {
            when {
                anyOf {
                    branch 'main'
                    branch 'master'
                }
            }
            steps {
                sh '''
                terraform apply -auto-approve tfplan
                echo "Terraform applied Successfully in branch: ${env.GIT_BRANCH}"
                '''
            }
        }
    }

    post {
        failure {
            echo "Pipeline failed for branch: ${env.GIT_BRANCH}"
        }
        success {
            echo "Pipeline succeeded for branch: ${env.GIT_BRANCH}"
        }
    }
}

pipeline {
    agent any

    environment {
        AWS_REGION = 'us-east-1'
        TFVARS_FILE = 'test.tfvars' // Updated from custom.tfvars to test.tfvars
    }

    stages {
        stage('Check AWS Identity') {
            steps {
                sh 'aws sts get-caller-identity'
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Validate') {
            steps {
                sh 'terraform validate'
            }
        }

        stage('Terraform Plan') {
            steps {
                sh """
                    terraform plan \
                      -var-file=${TFVARS_FILE} \
                      -out=tfplan
                """
            }
        }

        stage('Terraform Apply') {
            when {
                expression { return params.APPLY_CHANGES == true }
            }
            steps {
                input message: 'Apply infrastructure changes?', ok: 'Apply'
                sh 'terraform apply -auto-approve tfplan'
            }
        }
    }

    parameters {
        booleanParam(name: 'APPLY_CHANGES', defaultValue: false, description: 'Apply the Terraform changes')
    }

    post {
        always {
            cleanWs()
        }
    }
}

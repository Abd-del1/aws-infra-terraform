pipeline {
  agent any

  environment {
    VAULT_ADDR  = 'http://184.73.22.166:8200'
    VAULT_TOKEN = credentials('vault-token')
  }

  stages {
    stage('Checkout') {
      steps {
        checkout scm
      }
    }

    stage('Fetch AWS creds from Vault') {
      steps {
        sh '''
          set -e

          ACCESS_KEY=$(vault kv get -field=access_key secret/terraform/aws)
          SECRET_KEY=$(vault kv get -field=secret_key secret/terraform/aws)
          REGION=$(vault kv get -field=region secret/terraform/aws)

          cat > vault.env <<EOF
AWS_ACCESS_KEY_ID=$ACCESS_KEY
AWS_SECRET_ACCESS_KEY=$SECRET_KEY
AWS_DEFAULT_REGION=$REGION
TF_VAR_aws_region=$REGION
TF_VAR_vault_addr=$VAULT_ADDR
TF_VAR_vault_token=$VAULT_TOKEN
EOF

          echo "Vault AWS secret fetch successful"
        '''
      }
    }

    stage('Terraform Init') {
      steps {
        sh '''
          set -e
          set -a
          . ./vault.env
          set +a

          terraform init
        '''
      }
    }

    stage('Terraform Validate') {
      steps {
        sh '''
          set -e
          set -a
          . ./vault.env
          set +a

          terraform validate
        '''
      }
    }

    stage('Terraform Plan') {
      steps {
        sh '''
          set -e
          set -a
          . ./vault.env
          set +a

          terraform plan -out=tfplan
        '''
      }
    }

    stage('Terraform Apply') {
      steps {
        sh '''
          set -e
          set -a
          . ./vault.env
          set +a

          terraform apply -auto-approve tfplan
        '''
      }
    }
  }

  post {
    always {
      sh 'rm -f vault.env tfplan || true'
    }
  }
}

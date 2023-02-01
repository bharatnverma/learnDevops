pipeline {
    agent any 

     parameters {

        booleanParam(name: 'codeBuild', defaultValue: false, description: 'Gradle Build, Docker image build and Push to Docker hub')
        booleanParam(name: 'deploy', defaultValue: false, description: 'Deploy to K8s Cluster')
        booleanParam(name: 'undeploy', defaultValue: false, description: 'Rollback recent deployment')
    }

    environment {     
         VERSION = "${env.BUILD_ID}"
      }

    stages {
      stage('Code Build ') {
             when { expression { params.codeBuild } }
             steps {
                    withGradle {
                    sh './gradlew build'
                    }
                }

            }

       stage('Docker Build') {
        when { expression { params.codeBuild  } }
        steps {
      	sh 'docker build -t bharatverman/learndevops .'
      }
        }

      

       stage(' Push Docker Image') {
      when { expression { params.codeBuild  } }
      steps{
         script {            
                    sh '''
                      docker login -u bharatverman -p Vbachub310$
                      docker push bharatverman/learndevops
                      docker logout
                      '''
            
            
          }
        }
      }

      stage('Deploy service to Kubernetes') {
          when { expression { params.deploy } }
          steps{
            
              sh '''ssh -o "StrictHostKeyChecking no" -i "kubesetup.pem" ec2-user@ec2-3-110-190-236.ap-south-1.compute.amazonaws.com " curl -OJ https://raw.githubusercontent.com/bharatnverma/learnDevops/main/deployment.yaml " 
                    ssh -o "StrictHostKeyChecking no" -i "kubesetup.pem" ec2-user@ec2-3-110-190-236.ap-south-1.compute.amazonaws.com " kubectl --kubeconfig ~/.kube/config  apply -f deployment.yaml " 
                   
                '''   
          }



      }

            stage('Undeploy service on Kubernetes Cluster ') {
          when { expression { params.undeploy } }
          steps{
            
              sh ''' 
                    ssh -o "StrictHostKeyChecking no" -i "kubesetup.pem" ec2-user@ec2-3-110-190-236.ap-south-1.compute.amazonaws.com "kubectl --kubeconfig ~/.kube/config delete deployment webapp-deployment "
                   
                '''   
          }



      }
    } 

}


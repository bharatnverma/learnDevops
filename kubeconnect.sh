
# connect to kubernetes master and deploy the appliction 
ssh -i "/home/bharat/Downloads/kubesetup.pem" ec2-user@ec2-13-234-34-149.ap-south-1.compute.amazonaws.com 
kubectl run nginx --image=nginx --restart=Never
exit



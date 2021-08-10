# Deploy eks cluster stack using cloudformation
aws cloudformation deploy \
    --template-file ekscluster.yml \
    --tags project=udacity \
    --stack-name "Chibsapp-Cluster"

# Update Kubeconfig
aws eks --region eu-west-2 update-kubeconfig --name Chibsapp-Cluster

# Confgure nodes
kubectl apply -f aws-auth-cm.yml

# Deploy Base version of app
kubectl apply -f deployment.yml

# Configure node service
kubectl apply -f service.yml
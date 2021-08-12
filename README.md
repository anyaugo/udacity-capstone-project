# udacity-capstone-project
Capstone Project for Udacity Nano Degree

# description
This project contains source files that deploy a python flask app in a docker container. 

# infrastructure
The application is hosted on AWS Elastic Kubernetes Services. The kubernetes cluster infrastructure is created using AWS cloudformation. The cluster nodes are configired using a configMap, before an initial application version is deployed. A nodeService is then created to map the application's container port to an exposed port on the cluster node. The commands to setup the cluster infrastructure are specified in the shell script 'setup_cluster.sh'.

# cicd
The project uses the circleci continous integration pipeline which involes the following 4 steps: 

## lint-files
Lints the python flask app file (app.py) using pylint as well as the dockerfile using hadolint for any file script errors. Uses the command 'make lint' as specified in the Makefile file included.

## build-docker 
Builds the dockerfile image, tags the image and pushes the image to an AWS Elastic Container Registry. Uses commands specified in the shell script 'build_docker.sh'.

## deploy-app
Deploys the latest version of the app using a 'rolling deployment' process by updating the app container image to the latest built image.

## smoke-test
Performs a smoke test on the live application instance by running a curl command on the app-server URL. Rolls back the deployment to the last stable version if smoke test fails.

## cleanup
Optional pipeline step to clean up entire EKS cluster infrastructre if no longer needed.


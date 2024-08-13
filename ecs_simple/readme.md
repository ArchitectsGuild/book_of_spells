# This is a correction and completion of repository by Miguel Saavedra
https://github.com/msaavedra91/docker-ecs-terraform
https://medium.com/@msaavedra91/spanish-docker-aws-ecs-terraform-lo-m%C3%A1s-simple-para-empezar-87402ddd9da5

# First get docker container built and tested

docker build -t tutorial-flask-image .
docker images
docker run -p 5637:5637 -d tutorial-flask-image

# don't forget to create an AWS bucket named "terraform-tfstate-ecsworkshop"

# push it to ECR
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 349556150670.dkr.ecr.us-east-1.amazonaws.com

docker tag tutorial-flask-image:latest 349556150670.dkr.ecr.us-east-1.amazonaws.com/ecr-workshop:latest
    
docker push 349556150670.dkr.ecr.us-east-1.amazonaws.com/ecr-workshop:latest

# Use the right image id in ECR both in this script and in container-def.json
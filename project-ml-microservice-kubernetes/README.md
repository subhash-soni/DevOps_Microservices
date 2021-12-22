[![CircleCI](https://circleci.com/gh/subhash-soni/DevOps_Microservices/tree/master.svg?style=svg)](https://circleci.com/gh/subhash-soni/DevOps_Microservices/tree/master)

## Project Overview

In this project, you will apply the skills you have acquired in this course to operationalize a Machine Learning Microservice API. 

You are given a pre-trained, `sklearn` model that has been trained to predict housing prices in Boston according to several features, such as average rooms in a home and data about highway access, teacher-to-pupil ratios, and so on. You can read more about the data, which was initially taken from Kaggle, on [the data source site](https://www.kaggle.com/c/boston-housing). This project tests your ability to operationalize a Python flask app—in a provided file, `app.py`—that serves out predictions (inference) about housing prices through API calls. This project could be extended to any pre-trained machine learning model, such as those for image recognition and data labeling.

### Project Tasks

Your project goal is to operationalize this working, machine learning microservice using [kubernetes](https://kubernetes.io/), which is an open-source system for automating the management of containerized applications. In this project you will:
* Test your project code using linting
* Complete a Dockerfile to containerize this application
* Deploy your containerized application using Docker and make a prediction
* Improve the log statements in the source code for this application
* Configure Kubernetes and create a Kubernetes cluster
* Deploy a container using Kubernetes and make a prediction
* Upload a complete Github repo with CircleCI to indicate that your code has been tested

You can find a detailed [project rubric, here](https://review.udacity.com/#!/rubrics/2576/view).

**The final implementation of the project will showcase your abilities to operationalize production microservices.**

---

## Setup the Environment

* Create a virtualenv with Python 3.7 and activate it. Refer to this link for help on specifying the Python version in the virtualenv. 
```bash
# You should have Python 3.7 available in your host. 
# Check the Python path using `which python3`
# Use a command similar to this one:
* CD to directory of your project
* python3 --version
* which pyhthon3
* python3 -m venv .devops
* source .devops/bin/activate
*
```
* Run `make install` to install the necessary dependencies

### Running `app.py`

1. Standalone:  `python app.py`
2. Run in Docker:  `./run_docker.sh`
3. Run in Kubernetes:  `./run_kubernetes.sh`

### Kubernetes Steps

* Setup and Configure Docker locally
* 1) Check the link for linus distribustion of Docker for installation --> https://docs.docker.com/engine/install/ubuntu/
* 2) Run docker: ./run_docker.sh

* Setup and Configure Kubernetes locally
* 1) Check the link --> https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/
* 2) Run command: curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
* 3) Run command: sudo install minikube-linux-amd64 /usr/local/bin/minikube
* 4) Run command: minikube start 
* 5) To separately install kuberctl --> check https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/#install-kubectl-binary-with-curl-on-linux
* 6) Run Command: curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
* 7) Run Command: curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
* 8) Run Command: echo "$(<kubectl.sha256) kubectl" | sha256sum --check ==> Valid o/p is: kubectl: OK
* 9) Run command: sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
* 10) Run Command: kubectl version --client
* 11) Post all your testing & logging, don't forget to delete the minikube by running command --> minikube delete
* 
* Create Flask app in Container
* 1) Run command: ./run_docker.sh - to build and start the Flask app container
* 2) Run command: ./upload_docker.sh - to upload the container to docker hub.
* 3) Run ./make_prediction.sh in another terminal to make prediction and copy/paste the logging info at terminal tooutput_txt_files/docker_out.txt.

* Run via kubectl
* 1) Run command: ./run_kubernetes.sh - to build and start the Flask app container
* 2) Run: kubectl get pods in another terminal to see pods started by previous file and check their status changing to running.
* 3) Run ./make_prediction.sh in another terminal to make prediction and copy/paste the logging info at terminal tooutput_txt_files/kubernetes_out.txt.
* 4) Run 'kubectl logs p4udacity' to get the logs from kubernetes on the terminal where you ran make_prediction.sh file.
* 
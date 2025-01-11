MakeMyTrip Clone Deployment

This project demonstrates the deployment of a web application (MakeMyTrip Clone) using Docker, Kubernetes, and Terraform. The web application is hosted on Azure Kubernetes Service (AKS) with pods managed through Kubernetes and infrastructure provisioned using Terraform.

 Table of Contents
- Overview
- Technologies Used
- Project Structure
- Getting Started
- Deployment Steps
- Accessing the Application
- Contributing
- License

 Overview
The MakeMyTrip Clone is a web application that allows users to search for flights between different destinations. The application is built using Python and Flask, and it is containerized using Docker. The deployment is managed through Kubernetes, with the infrastructure provisioned using Terraform.

 Technologies Used
- Python: Programming language for the backend.
- Flask: Web framework for building the application.
- Docker: Containerization platform for packaging the application.
- Kubernetes: Container orchestration platform for managing the deployment.
- Terraform: Infrastructure as Code (IaC) tool for provisioning resources.
- Azure Kubernetes Service (AKS): Managed Kubernetes service on Azure.

 Project Structure
MakeMyTripClone/
├── app.py
├── requirements.txt
├── templates/
│   └── index.html
└── Dockerfile

 Getting Started

# Prerequisites
- Docker
- Kubernetes (kubectl)
- Terraform
- Azure CLI

# Setup
1. Clone the repository:
   git clone <repository-url>
   cd MakeMyTripClone

2. Install dependencies:
   pip install -r requirements.txt

 Deployment Steps

# 1. Build and Push Docker Image
1. Build the Docker image:
   docker build -t <registry-name>.azurecr.io/pj-app:latest .

2. Push the Docker image to Azure Container Registry:
   docker push <registry-name>.azurecr.io/pj-app:latest

# 2. Configure Kubernetes and Terraform
1. Authenticate with Azure:
   az login
2. Get AKS credentials:
   az aks get-credentials --resource-group <resource-group> --name <aks-cluster-name>

3. Initialize and apply Terraform:
  terraform init
   terraform apply -auto-approve

# 3. Deploy to Kubernetes
1. Apply the Kubernetes deployment and service:
   kubectl apply -f deployment.yaml -n <namespace>


 Accessing the Application
Once deployed, the application can be accessed via the external IP address assigned by the LoadBalancer service. To find the external IP:
kubectl get services -n <namespace>
Navigate to `http://<EXTERNAL-IP>/` in your browser to view the application.

Contributing
Contributions are welcome! Please open an issue or submit a pull request for any improvements or bug fixes.

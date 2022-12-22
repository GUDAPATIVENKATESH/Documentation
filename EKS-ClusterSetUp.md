# EKS CLUSTER SET-UP by VENKATESH GUDAPATI
  * Take a linux machine (t2.micro)
  * Inatall Unzip & AWS CLI. For Official document [Refer here](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
    ```
     sudo apt install unzip -y
     curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
     unzip awscliv2.zip
     sudo ./aws/install
    ```
  * Create an IAM user and Configure AWS CLI Official document [Refer here](https://sst.dev/chapters/create-an-iam-user.html)
  * Installind kubectl For Official document [Refer here](https://docs.aws.amazon.com/eks/latest/userguide/install-kubectl.html)
    ```
     curl -o kubectl https://s3.us-west-2.amazonaws.com/amazon-eks/1.24.7/2022-10-31/bin/linux/amd64/kubectl

     openssl sha1 -sha256 kubectl
     chmod +x ./kubectl
     mkdir -p $HOME/bin && cp ./kubectl $HOME/bin/kubectl && export PATH=$PATH:$HOME/bin
     echo 'export PATH=$PATH:$HOME/bin' >> ~/.bashrc
     kubectl version --short --output=yaml
    ```  
  * Optional: Installing EKS CTL for official document [Refer here](https://docs.aws.amazon.com/eks/latest/userguide/eksctl.html)

  * here we are provisioning AWSEKS with Terraform for official document [Refer here](https://developer.hashicorp.com/terraform/tutorials/kubernetes/eks)  
  * to set up the provisioning we need Terraform to be installed for official document [Refer here](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
    ```
     cd ~/bin or cd /home/ubuntu/bin 
     sudo apt-get update && sudo apt-get install -y gnupg software-properties-common
    
     wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
    
     gpg --no-default-keyring --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg --fingerprint
    
     echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
     https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
     sudo tee /etc/apt/sources.list.d/hashicorp.list
    
     sudo apt update
     sudo apt-get install terraform -y
     terraform --version

    ```
  * Clone Terraform EKS cluster Template for official document [Refer here](https://developer.hashicorp.com/terraform/tutorials/kubernetes/eks)
    ```
     git clone https://github.com/hashicorp/learn-terraform-provision-eks-cluster
     cd learn-terraform-provision-eks-cluster/
    ```
  * If you want know the cluster details or modify, Just verify the cluster_version &    eks_managed_node_groups on eks-cluster.tf.
  * to create the set up 
    ```
     terraform init
     terraform apply --auto-approve
     aws eks --region $(terraform output -raw region) update-kubeconfig \
     --name $(terraform output -raw cluster_name)

     kubectl get nodes
    ```
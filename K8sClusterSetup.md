# Kubernetes Setup by VENKATESH GUDAPATI
  * Master must be linux machine. Nodes can be anything.
  * Installing Container runtime. Our choise is Docker.(on Both Master & Nodes)
    ```
    curl -fsSL https://get.docker.com -o get-docker.sh
    sh get-docker.sh
    ```
## Installing cri-dockerd
  * to run cri-dockerd machine need go & git. Check in your machine if they don't present install them (on Both Master & Nodes)
    * to install git (for ubuntu)  
       ```
      sudo apt-get update
      sudo apt install git
      ```
    * to install go (on Both Master & Nodes)
      ```
      sudo -i
      wget https://storage.googleapis.com/golang/getgo/installer_linux
      chmod +x ./installer_linux
      ./installer_linux
      source ~/.bash_profile
      ```
    * to install cri-dockerd(on Both Master & Nodes)
      ```
      git clone https://github.com/Mirantis/cri-dockerd.git
      cd cri-dockerd
      mkdir bin
      go build -o bin/cri-dockerd
      mkdir -p /usr/local/bin
      install -o root -g root -m 0755 bin/cri-dockerd /usr/local/bin/cri-dockerd
      cp -a packaging/systemd/* /etc/systemd/system
      sed -i -e 's,/usr/bin/cri-dockerd,/usr/local/bin/cri-dockerd,' /etc/systemd/system/cri-docker.service

      systemctl daemon-reload
      systemctl enable cri-docker.service
      systemctl enable --now cri-docker.socket
      ```
    * To Install kobelet,kubectl,kebeadm (on Both Master & Nodes) as Non-root user
      ```
      sudo apt update
      sudo apt-get install -y apt-transport-https ca-certificates curl
      sudo curl -fsSLo /etc/apt/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
      echo "deb [signed-by=/etc/apt/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
      sudo apt-get update
      sudo apt-get install -y kubelet=1.25.5-00 kubeadm=1.25.5-00 kubectl=1.25.5-00
      sudo apt-mark hold kubelet kubeadm kubectl
      ```  
    * to install kube-flannel as a root user
      ```
      kubectl apply -f https://raw.githubusercontent.com/flannel-io/flannel/master/Documentation/kube-flannel.yml
      ```
    * to create a cluster, login into master node & execute the following commands as a root user & including cri-socket
      ```
      kubeadm init --pod-network-cidr=10.244.0.0/16 --cri-socket=unix:///var/run/cri-dockerd.sock
      ```
      * aftr sucessful execution of above command you will recive a worker node join command to cluster note down it.
    * Your Kubernetes control-plane has initialized
    * To start using your cluster, you need to run the following as a regular user
      ```
      mkdir -p $HOME/.kube
      sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
      sudo chown $(id -u):$(id -g) $HOME/.kube/config
      ```
### Joining node to the cluster
  * we are including cri-socket to node
    ```
    <node cluster joining command> --cri-socket=unix:///var/run/cri-dockerd.sock
    ``` 

* Use Docker Cheat Sheet [Refer Here](https://kubernetes.io/docs/reference/kubectl/cheatsheet/)
Integrating terraform with ansible
---------------------------------
```json
resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  provisioner "local-exec" {
    command = "ansible-playbook playbook.yml -i ${self.public_ip}, -u ec2-user --private-key=mykey.pem"
  }
  provisioner "ansible" {
    playbook_file = "playbook.yml"
    inventory_file = "${self.public_ip},"
    user = "ec2-user"
    private_key = "mykey.pem"
  }
}
```
Generate json output from terraform as shown below
--------------------------------------------------
``` Json
{
    "group1": {
        "hosts": [
            "host1.example.com",
            "host2.example.com"
        ],
        "vars": {
            "ansible_user": "user",
            "ansible_port": "22"
        }
    },
    "group2": {
        "hosts": [
            "host3.example.com",
            "host4.example.com"
        ],
        "vars": {
            "ansible_user": "user",
            "ansible_port": "22"
        }
    },
    "_meta": {
        "hostvars": {
            "host1.example.com": {
                "ansible_host": "10.0.0.1",
                "custom_var": "value"
            },
            "host2.example.com": {
                "ansible_host": "10.0.0.2",
                "custom_var": "value"
            },
            "host3.example.com": {
                "ansible_host": "10.0.0.3",
                "custom_var": "value"
            },
            "host4.example.com": {
                "ansible_host": "10.0.0.4",
                "custom_var": "value"
            }
        }
    }
}
```
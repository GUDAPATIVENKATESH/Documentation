To Create a AWS EBS Volume
--------------------------
```
aws ec2 create-volume --region us-west-2 --availability-zone us-west-2a --size 5 --volume-type gp2
``` 

To attach EBS Volume to EC2 Instance
------------------------------------
```
aws ec2 attach-volume --device <value> --instance-id <value> --volume-id <value>
```

To Delete a AWS EBS Volume
--------------------------
```
aws ec2 delete-volume --volume-id vol-05c42161942db76cc
```

UUID="f027f579-119f-4e60-b809-7b3a2b456f54" BLOCK_SIZE="512" TYPE="xfs"
UUID=f027f579-119f-4e60-b809-7b3a2b456f54   /linux   xfs   defaults,nofail   1   2
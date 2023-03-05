Snapshot is the backup of EBS Volume
------------------------------------

* AWS snapshot of an EBS volume, it captures a full, incremental copy of the volume and stores it in S3. You can use snapshots to create new EBS volumes or to restore an existing volume to a previous state.
* If you created a snapshot for an EBS volume for the first time it will create a full backup.
* Then after some operations done on EC2, you create a snapshot again, this time it create a incremental backup, that means tha incremental backup has the data that the previous backup does't had. Also the incremental backup has a connection to it's previous backup.
* What happens when you delete the latest snapshot: The backup would get deleted along with the data. In this case there is data loss.
* What happens when you delete the first snapshot: The first backup gets deleted, if it has any incremental backups connected to it the first backup data also copied into the incremental backup. In this case there is no data loss.
* Now Generally organizations, configure automated backups periodically (once every day/hour/week). In these situations we can also configure to delete the older snapshots as it doesnot cause data loss.


* In AWS after creating the snapshot we can create an AMI form that snapshot, also we can copy that snapshot to other regions also. 
# AWS Resource Tracker

AWS Resource Tracker is a script that lists all the resources in your AWS account and generates a report file.  
It provides a quick way to see which services and resources are currently in use, saving time and effort by avoiding manual checks.  
This helps in monitoring your AWS environment, tracking resource usage, and keeping everything organized in one place.

## Tracks

- S3 buckets  
- EC2 instances, VPCs, Subnets, Security Groups  
- Lambda functions  
- IAM users  
- DynamoDB tables  
- RDS databases  
- Rekognition collections  
- SNS topics  
- CloudTrail trails  

## Requirements

- Linux or WSL terminal  
- AWS CLI installed and configured  
- Command-line shell (Bash compatible)  
- `jq` installed (optional)  

## Installation

```bash
git clone https://github.com/aakanshaa0/aws_resource_tracker.git
cd aws_resource_tracker
chmod +x aws_resource_tracker_script.sh
./aws_resource_tracker_script.sh

#!/bin/bash

##################
#Author: Aakansha
#Date: 19 October
#Version: V2
#
#This script will report AWS resource usage
##################

> resourceTracker.txt

#set -x

#AWS S3
echo "Print list of S3 buckets"
aws s3 ls | tee -a resourceTracker.txt
if [ $? -ne 0 ]; then
	echo "Error fetching s3 buckets" | tee -a resourceTracker.txt
fi

#AWS EC2
echo "Print list of EC2 instances" | tee -a resourceTracker.txt
aws ec2 describe-instances --query 'Reservations[].Instances[].[InstanceId,InstanceType,State.Name,PublicIpAddress]' --output table | tee -a resourceTracker.txt
if [ $? -ne 0 ]; then
  echo "Error fetching EC2 instances" | tee -a resourceTracker.txt
fi


# AWS Lambda
echo "Print list of Lambda functions" | tee -a resourceTracker.txt
aws lambda list-functions --query 'Functions[].[FunctionName,Runtime,LastModified]' --output table | tee -a resourceTracker.txt
if [ $? -ne 0 ]; then
  echo "Error fetching Lambda functions" | tee -a resourceTracker.txt
fi

# AWS IAM
echo "Print list of IAM users" | tee -a resourceTracker.txt
aws iam list-users --query 'Users[].[UserName,CreateDate]' --output table | tee -a resourceTracker.txt 
if [ $? -ne 0 ]; then
  echo "Error fetching IAM users" | tee -a resourceTracker.txt
fi

# AWS VPC
echo "Print list of VPCs" | tee -a resourceTracker.txt
aws ec2 describe-vpcs --query 'Vpcs[].[VpcId,CidrBlock,IsDefault]' --output table | tee -a resourceTracker.txt
if [ $? -ne 0 ]; then
  echo "Error fetching VPCs" | tee -a resourceTracker.txt
fi

# AWS Subnets
echo "Print list of Subnets" | tee -a resourceTracker.txt
aws ec2 describe-subnets --query 'Subnets[].[SubnetId,VpcId,CidrBlock,AvailabilityZone]' --output table | tee -a resourceTracker.txt
if [ $? -ne 0 ]; then
  echo "Error fetching Subnets"  | tee -a resourceTracker.txt
fi

# AWS Security Groups
echo "Print list of Security Groups" | tee -a resourceTracker.txt
aws ec2 describe-security-groups --query 'SecurityGroups[].[GroupId,GroupName,VpcId,Description]' --output table | tee -a resourceTracker.txt
if [ $? -ne 0 ]; then
  echo "Error fetching Security Groups"  | tee -a resourceTracker.txt
fi

# AWS DynamoDB
echo "Print list of DynamoDB tables" | tee -a resourceTracker.txt
aws dynamodb list-tables --query 'TableNames' --output table | tee -a resourceTracker.txt
if [ $? -ne 0 ]; then
  echo "Error fetching DynamoDB tables"  | tee -a resourceTracker.txt
fi

# AWS RDS
echo "Print list of RDS instances" | tee -a resourceTracker.txt
aws rds describe-db-instances --query 'DBInstances[].[DBInstanceIdentifier,DBInstanceStatus,Engine]' --output table | tee -a resourceTracker.txt
if [ $? -ne 0 ]; then
  echo "Error fetching RDS instances"  | tee -a resourceTracker.txt
fi

# AWS Rekognition
echo "Print list of Rekognition collections" | tee -a resourceTracker.txt
aws rekognition list-collections | tee -a resourceTracker.txt
if [ $? -ne 0 ]; then
  echo "Error fetching Rekognition collections"  | tee -a resourceTracker.txt
fi

# AWS SNS
echo "Print list of SNS topics" | tee -a resourceTracker.txt
aws sns list-topics --query 'Topics[].TopicArn' --output table | tee -a resourceTracker.txt
if [ $? -ne 0 ]; then
  echo "Error fetching SNS topics" | tee -a resourceTracker.txt
fi

# AWS CloudTrail
echo "Print list of CloudTrails" | tee -a resourceTracker.txt
aws cloudtrail describe-trails --query 'trailList[].[Name,HomeRegion,S3BucketName]' --output table | tee -a resourceTracker.txt
if [ $? -ne 0 ]; then
  echo "Error fetching CloudTrails" | tee -a resourceTracker.txt
fi

echo "All AWS resources have been listed in resourceTracker.txt"

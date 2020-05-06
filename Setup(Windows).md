# Setup for EC2 isntance
# Deploy using the "Microsoft Windows Server 2019 Base" image from AMI
# Upload the field Ec2Setup for the UserData. Levae the "is encoded already" box unchecked
# Be sure an EC2 isntance is properly tagged with Name=HardyWebsite

# Setup For CodeDeploy Deployment
# Be sure an EC2 isntance is properly tagged with Name=HardyWebsite
aws deploy create-application --application-name HardyWebsite

# Create Delployment Group. Make sure your selected has the AWSCodeDeployRole policy
aws deploy create-deployment-group --application-name HardyWebsite --deployment-group-name HardyWebsite_DepGroup --deployment-config-name CodeDeployDefault.OneAtATime --ec2-tag-filters Key=Name,Value=HardyWebsite,Type=KEY_AND_VALUE --service-role-arn arn:aws:iam::244634903703:role/HardyWebsite-CodeDeployRole

# Sample Deployment
# deploy.sh will default to the current commit if a commit hash is not provided
./deploy.sh (commit hash) 
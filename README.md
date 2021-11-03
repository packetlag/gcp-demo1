# gcp-demo1
Making magic in the cloud

# Endpoint
- [https://us-central1-gcp-demo1-330914.cloudfunctions.net/spanner_hello_world](https://us-central1-gcp-demo1-330914.cloudfunctions.net/spanner_hello_world)

# Solution
## Cloud Spanner RDS
- Instance: gcp-demo1-beta
- DB: gcp-demo1-db

## Cloud Functions
- Function: spanner_hello_world

## Alerting
- Polices: CloudFunction Exec Too Slow
- Notifications: Email and SMS

## Cloud Storage
- Bucket: gcp-demo1-state

## IAM
NOTE - not all roles required for solution, but used as I learned my way through things.
- Principal: terraform@gcp-demo1-330914.iam.gserviceaccount.com 
- Roles: Cloud Functions Admin, Cloud Spanner Admin, Cloud SQL Admin, Cloud Admin, Monitoring Admin, Storage Admin, Storage Object Admin.

## Manually created assets
- Terraform State File bucket
- IAM administration
- Data inserted in Spanner DB table "demo1"
- Deployment of spanner_hello_world function from repo

## Extra assets
NOTE - Some assets remain deployed but are not needed for this solution. Good to show where I started, though.
- Compute Engine Instance: app-1
- Cloud SQL: gcp-demo1-sql

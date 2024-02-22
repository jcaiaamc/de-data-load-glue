# README #

This README would normally document whatever steps are necessary to get your application up and running.

### de-data-load-glue ###

* This project is for uploading files into an s3 bucket ({env}-ops-data-load-bucket). 
* Place all files that should be uploaded into "files" folder. 
* This repo is managed and supported by Data Engineering team. 

### upload-file branch ###

* This branch is only used to make upload file(s) into the designated s3 bucket. 

### Setup guidelines ###

* Create a new feature branch from "upload-file". Include Jira number in the branch name.
* Add / remove files as needed into "files" folder.  

### Contribution guidelines ###

* DO NOT merge any branch back into "upload-file" branch, unless for making changes to the pipeline. In this case, be sure to exclude any "files".

### Upload options ###

To upload files, using the pipeline, enter values for the following:
* DB_TYPE: select between "oracle" or "postgres"
* DB: select from a list of DBs, oracle DBs are capitalized 
* SCHEMA: enter the target schema name
* TABLE: enter the target table name
* YYYYMMDD: enter current date in YYYYMMDD format 

### For more info ###

* Contact Data Engineering team for more information about this repo. 
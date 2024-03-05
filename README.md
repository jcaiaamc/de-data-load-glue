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
* DO NOT put any data file (csv / xlsx) in the "upload-file" branch. 

### Upload file option ###

To upload file(s):
* In load_info.json: define the schema, table and load date (or date when file is provided) in YYYYMMDD. 
    * "SCHEMA": target schema name, for example: "contact_svc" 
    * "TABLE": target table name, for example: "xwalk_institution_contact"
    * "YYYYMMDD": define datestamp in YYYYMMDD format, for example: "20240229".

* Using pipeline, select "Copy to S3 option" and select values for the following:
    * DB_TYPE: select between "oracle" or "postgres".
    * DB: select from a list of DBs, oracle DBs are capitalized. 

### Delete file option ###
To delete file(s):
* Using the pipeline, define the following:
    * file_path: define a path to a folder or file, without the s3 bucket (i.e. if the file is "s3://bucketname/folder/subfolder/filename.txt", only enter "folder/subfolder/filename.txt"). The s3 bucket is limited to the s3 bucket created for this project.
    * delete_type: select either "DRY_RUN" to see which file(s) will be deleted, or "DELETE" to do the actual deletion. 

### For more info ###

* Contact Data Engineering team for more information about this repo. 
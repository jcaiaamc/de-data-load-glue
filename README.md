# README #

This README would normally document whatever steps are necessary to get your application up and running.

### de-data-load-glue ###

* This project is for uploading files into an s3 bucket ({env}-ops-data-load-bucket). 
* Place all files that should be uploaded into "files" folder. 
* The glue job needs information from settings.json file (definition below) to load data. As a minimum, define either a data load, or a pre-sql file, or a post-sql file.
* When selecting the Run-job option, you can choose the "write" method (note that the target table must exist before the data can be loaded into it):
    * append: specify if the load is to append to an existing table.
    * truncate: truncate and load on an existing table.
* This repo is managed and supported by Data Engineering team. 

### upload-file branch ###

This branch is for:

* To upload file(s) into the designated s3 bucket. 
* For executing the glue jobs to process data according to the information in settings.json file.

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

* Using pipeline, select "Copy to S3" option and select values for the following:
    * DB_TYPE: select between "oracle" or "postgres".
    * DB: select from a list of DBs, oracle DBs are capitalized. 

### Run job option ###

To run the job:

* In settings.json - define the details of the load here:
    * "TARGET_DB": the target database, use from the DBs available in the list. 
    * "SOURCE_FILE": the full s3 path of the source file in s3. The pipeline will replace "<environment>" with the appropriate deployment environment, for example: "s3://<environment>-ops-data-load-bucket/files/postgres/edc/contact_svc/xwalk_institution_contact_test/20240229/data-1703168934654__for_QA_DEO-120.xlsx".
    * "TARGET_TABLE": the target table in schema.table_name format, for example: "contact_svc.load_data_temp_table".
    * "PRE_SQL_FILE": the full s3 path of the sql file in s3 to be executed BEFORE loading the data. For example: "s3://<environment>-ops-data-load-bucket/files/postgres/edc/contact_svc/xwalk_institution_contact_test/20240229/DEO-120-pre-script.txt".
    * "POST_SQL_FILE": the full s3 path of the sql file in s3 to be executed AFTER loading the data. For example: "s3://<environment>-ops-data-load-bucket/files/postgres/edc/contact_svc/xwalk_institution_contact_test/20240229/DEO-120-post-script.txt".
    * "EMAIL_TO": define the email address that will be sent notification after processing the data load.

* Using pipeline, select "Run-job" option and select values for the following:
    * "WRITE_OPTION": select between append (insert only) or truncate (truncate the target table before insert).
    * "DEBUG_IND": "N" to log minimal info during the job run, "Y" to record all logs during the job run.

### Delete file option ###

To delete file(s):

* Using the pipeline, define the following:
    * file_path: define a path to a folder or file, without the s3 bucket (i.e. if the file is "s3://bucketname/folder/subfolder/filename.txt", only enter "folder/subfolder/filename.txt"). The s3 bucket is limited to the s3 bucket created for this project.
    * delete_type: select either "DRY_RUN" to see which file(s) will be deleted, or "DELETE" to do the actual deletion. 

### For more info ###

* Contact Data Engineering team for more information about this repo. 
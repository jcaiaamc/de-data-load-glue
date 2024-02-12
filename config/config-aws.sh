#!/bin/bash

echo "BITBUCKET_DEPLOYMENT_ENVIRONMENT: $BITBUCKET_DEPLOYMENT_ENVIRONMENT"
export costCenter=16900

if [[ $BITBUCKET_DEPLOYMENT_ENVIRONMENT == "evaluation" ]]; then
  export EnvType="EVAL";
elif [[ $BITBUCKET_DEPLOYMENT_ENVIRONMENT == "development" ]]; then
  export EnvType="DEV";
elif [[ $BITBUCKET_DEPLOYMENT_ENVIRONMENT == "ftest" ]]; then
  export EnvType="FTEST";
elif [[ $BITBUCKET_DEPLOYMENT_ENVIRONMENT == "staging" ]]; then
  export EnvType="STAGING";
elif [[ $BITBUCKET_DEPLOYMENT_ENVIRONMENT == "ptest" ]]; then
  export EnvType="PTEST";
elif [[ $BITBUCKET_DEPLOYMENT_ENVIRONMENT == "production" ]]; then
  export EnvType="PROD";
  costCenter=16200
fi

export ACCESS_KEY=$EnvType"_ROLE_USER_ACCESS_KEY"
export SECURITY_KEY=$EnvType"_ROLE_USER_SECURITY_KEY"
export ROLE=$EnvType"_ROLE_ARN_SERVERLESS"
aws --profile serverless configure set aws_access_key_id "${!ACCESS_KEY}"
aws --profile serverless configure set aws_secret_access_key "${!SECURITY_KEY}"
aws --profile serverless configure set default.region $AWS_DEFAULT_REGION
aws --profile serverless configure set role_arn "${!ROLE}"
aws --profile serverless configure set source_profile serverless 
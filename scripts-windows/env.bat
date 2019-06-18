@set GCP_NAME=cloudrun-go-fileserver
@set GCP_PROJECT_ID=
@set GCP_PROJECT_NUM=
@set GCP_REGION=us-central1
@set GCP_SERVICE_NAME=%GCP_NAME%
@set GCP_IMAGE_NAME=%GCP_NAME%

@REM This code gets the Project ID from gcloud
call gcloud config get-value project > project.tmp
for /f "delims=" %%x in (project.tmp) do set GCP_PROJECT_ID=%%x
echo Project ID: %GCP_PROJECT_ID%

del project.tmp

@echo on

@REM This code gets the Project Number from gcloud
call gcloud projects list --filter="%GCP_PROJECT_ID%" --format="value(PROJECT_NUMBER)" > number.tmp
for /f "delims=" %%x in (number.tmp) do set GCP_PROJECT_NUM=%%x
echo Project Number: %GCP_PROJECT_NUM%

del number.tmp

@echo on

echo "Done" > env.tmp

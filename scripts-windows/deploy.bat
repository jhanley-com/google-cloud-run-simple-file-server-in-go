@if not exist env.tmp call env.bat

@echo on

call gcloud beta run deploy %GCP_SERVICE_NAME% ^
--region %GCP_REGION% ^
--image gcr.io/%GCP_PROJECT_ID%/%GCP_IMAGE_NAME% ^
--allow-unauthenticated

@if errorlevel 1 goto err_out

@goto end

:err_out
@echo ***************************************************************
@echo Build Failed     Build Failed     Build Failed     Build Failed
@echo ***************************************************************

:end

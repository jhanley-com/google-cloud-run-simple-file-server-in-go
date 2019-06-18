@set IMAGE_NAME=go-fileserver

cd ..

docker build -f dockerfile.local -t %IMAGE_NAME% .
@if errorlevel 1 goto err_out

@REM docker run -it --rm -p 8080:8080 -v c:/:/data %IMAGE_NAME% /bin/bash
docker run -it --rm -p 8080:8080 %IMAGE_NAME%
@if errorlevel 1 goto err_out

@goto end

:err_out
@echo ***************************************************************
@echo Build Failed     Build Failed     Build Failed     Build Failed
@echo ***************************************************************

:end

cd scripts-windows

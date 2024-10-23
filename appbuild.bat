::notepad++ command: cmd /K $(FULL_CURRENT_PATH)
::set env variables
:: the code is the documentation
set PATH=%PATH%;C:\"Program Files"\7-Zip;C:\Users\acesspoint\apache-groovy-sdk-4.0.23\groovy-4.0.23\bin;
echo %PATH%
javac -version
::groovyc -version
::7z -version

set scriptpath=%~dp0
cd %scriptpath%
rd lib /s /q
md lib
cd lib
md servlet-api-6.0
cd servlet-api-6.0
::md javax\servlet\resources\
::cd ./../../src/main/webapp/WEB-INF/lib/servlet-api-6.0/dtd/
::copy ".\*.*" ..\..\..\..\..\..\..\lib\servlet-api-6.0\javax\servlet\resources\
cd ../../
cd src/main/webapp/WEB-INF/lib/servlet-api-6.0
dir /s /B *.java > ../../../../../../lib/servlet-api-6.0/sources.txt
javac @../../../../../../lib/servlet-api-6.0/sources.txt -d ../../../../../../lib/servlet-api-6.0 > ../../../../../../lib/servlet-api-6.0/build.log
cd ../../../../../../
copy "src\main\webapp\WEB-INF\lib\servlet-api-6.0\javax\servlet\*.properties" lib\servlet-api-6.0\javax\servlet\
copy "src\main\webapp\WEB-INF\lib\servlet-api-6.0\javax\servlet\http\*.properties" lib\servlet-api-6.0\javax\servlet\http\
cd lib/servlet-api-6.0
7z.exe a -r ../servlet-api-6.0.jar *
cd ..
rd servlet-api-6.0 /s /q
cd ..
rd dist /s /q
md dist
cd dist
md app
xcopy ".\..\src\main\webapp\*" ".\app\" /s /e
rd "app\WEB-INF\lib\" /s /q
xcopy ".\..\src\main\resources\" ".\app\resources\" /s /e
cd ..
md "dist/app/WEB-INF/lib"
copy "lib\servlet-api-6.0.jar" "dist\app\WEB-INF\lib\"
rd lib /s /q
cd src\main\groovy
dir /s /B *.java > ../../../dist/sources.txt
cd ../../../dist/app/WEB-INF
md classes
cd classes
groovyc -cp "../lib/servlet-api-6.0.jar" @../../../sources.txt && cd ../../../../dist/app && 7z.exe a -r ../app.jar * && cd .. && ren app.jar app.war && rd app /s /q && del /f sources.txt

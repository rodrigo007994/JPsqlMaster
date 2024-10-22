# war-generator
Windows script that generates a tomcat ready war file out of a simple template using Groovy


Make available javac,groovyc,7z(7-zip) on the path.
Change the env path as needed on the appbuild.bat file:

example:
set PATH=%PATH%;C:\"Program Files"\7-Zip;C:\Users\acesspoint\apache-groovy-sdk-4.0.23\groovy-4.0.23\bin;

Tested on jdk-11.0.25 and groovy-4.0.23 on Windows 10 64 bit

servlet-api-2.5-sources.jar (https://repo1.maven.org/maven2/javax/servlet/servlet-api/2.5/servlet-api-2.5-sources.jar) must be added to src\main\webapp\WEB-INF\lib

APP\SRC\MAIN\WEBAPP\WEB-INF\LIB
x└───servlet-api-2.5
x++++├───dtd
x++++└───javax
x++++++++└───servlet
x++++++++++++└───http

run appbuild.bat
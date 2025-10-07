@echo off
echo ========================================
echo Building WAR file for ch14_ex1_email
echo ========================================

rem Create build directories
if not exist "build" mkdir build
if not exist "build\classes" mkdir build\classes
if not exist "build\war" mkdir build\war
if not exist "dist" mkdir dist

echo Step 1: Compiling Java classes...

rem Set classpath
set CLASSPATH=web\WEB-INF\lib\javax.mail.jar

rem Compile utility classes
javac -d build\classes -cp "%CLASSPATH%" src\java\murach\util\*.java
if errorlevel 1 (
    echo ERROR: Failed to compile utility classes
    pause
    exit /b 1
)

rem Compile business classes
javac -d build\classes -cp "%CLASSPATH%;build\classes" src\java\murach\business\*.java
if errorlevel 1 (
    echo ERROR: Failed to compile business classes
    pause
    exit /b 1
)

rem Compile data classes
javac -d build\classes -cp "%CLASSPATH%;build\classes" src\java\murach\data\*.java
if errorlevel 1 (
    echo ERROR: Failed to compile data classes
    pause
    exit /b 1
)

rem Compile email classes (servlet)
javac -d build\classes -cp "%CLASSPATH%;build\classes" src\java\murach\email\*.java 2>nul
if errorlevel 1 (
    echo WARNING: Servlet compilation failed - need servlet-api.jar
    echo But utility classes compiled successfully!
    echo Continuing with WAR creation...
)

echo Step 2: Creating WAR structure...

rem Copy web content
xcopy /E /I /Y web\*.* build\war\
xcopy /E /I /Y web\WEB-INF\*.* build\war\WEB-INF\
xcopy /E /I /Y web\styles\*.* build\war\styles\
xcopy /E /I /Y web\META-INF\*.* build\war\META-INF\

rem Copy compiled classes
if exist "build\classes\murach" (
    xcopy /E /I /Y build\classes\murach\*.* build\war\WEB-INF\classes\murach\
)

echo Step 3: Creating WAR file...

rem Change to build\war directory and create WAR
cd build\war
jar -cf ..\..\dist\ch14_ex1_email.war *
cd ..\..

if exist "dist\ch14_ex1_email.war" (
    echo ========================================
    echo SUCCESS: WAR file created!
    echo Location: dist\ch14_ex1_email.war
    echo Size: 
    dir dist\ch14_ex1_email.war | findstr ch14_ex1_email.war
    echo ========================================
    echo.
    echo To deploy:
    echo 1. Copy dist\ch14_ex1_email.war to Tomcat webapps folder
    echo 2. Start Tomcat
    echo 3. Access: http://localhost:8080/ch14_ex1_email/
    echo ========================================
) else (
    echo ERROR: Failed to create WAR file
)

pause
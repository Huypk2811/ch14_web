@echo off
echo ========================================
echo Building WAR with Maven
echo ========================================

rem Check if Maven is installed
mvn --version >nul 2>&1
if errorlevel 1 (
    echo ERROR: Maven is not installed or not in PATH
    echo Please install Maven from https://maven.apache.org/
    pause
    exit /b 1
)

echo Step 1: Clean previous builds...
mvn clean

echo Step 2: Compile and package...
mvn package

if exist "target\ch14_ex1_email.war" (
    echo ========================================
    echo SUCCESS: Maven WAR file created!
    echo Location: target\ch14_ex1_email.war
    echo ========================================
    
    rem Copy to dist folder for consistency
    if not exist "dist" mkdir dist
    copy "target\ch14_ex1_email.war" "dist\"
    
    echo File also copied to: dist\ch14_ex1_email.war
    echo ========================================
    echo.
    echo DEPLOYMENT OPTIONS:
    echo 1. Manual: Copy WAR to Tomcat webapps folder
    echo 2. Maven deploy: mvn tomcat7:deploy (if configured)
    echo.
    echo Access: http://localhost:8080/ch14_ex1_email/
    echo ========================================
) else (
    echo ERROR: Maven build failed
    echo Check the output above for errors
)

pause
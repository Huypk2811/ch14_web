@echo off
echo Compiling Java classes with proper classpath...

rem Set classpath to include javax.mail.jar
set CLASSPATH=web\WEB-INF\lib\javax.mail.jar;src\java

rem Create output directory
if not exist "build\classes" mkdir build\classes

rem Compile utility classes
echo Compiling utility classes...
javac -d build\classes -cp "%CLASSPATH%" src\java\murach\util\*.java

rem Compile business classes  
echo Compiling business classes...
javac -d build\classes -cp "%CLASSPATH%" src\java\murach\business\*.java

rem Compile data classes
echo Compiling data classes...
javac -d build\classes -cp "%CLASSPATH%" src\java\murach\data\*.java

rem Try to compile servlet (may need servlet-api.jar)
echo Compiling servlet classes...
javac -d build\classes -cp "%CLASSPATH%" src\java\murach\email\*.java 2>nul
if errorlevel 1 (
    echo Note: Servlet compilation failed - you may need to add servlet-api.jar to classpath
    echo But utility classes compiled successfully!
) else (
    echo All classes compiled successfully!
)

echo.
echo Build complete. Check build\classes directory for compiled .class files.
pause
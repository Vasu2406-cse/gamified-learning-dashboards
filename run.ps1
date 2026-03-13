# Set JAVA_HOME to Java 17
$env:JAVA_HOME = "C:\Program Files\Java\jdk-17"
$env:PATH = "$env:JAVA_HOME\bin;$env:PATH"

Write-Host "Using Java version:" -ForegroundColor Green
java -version

Write-Host "`nDownloading Maven..." -ForegroundColor Green
$mavenVersion = "3.9.5"
$mavenUrl = "https://archive.apache.org/dist/maven/maven-3/$mavenVersion/binaries/apache-maven-$mavenVersion-bin.zip"
$mavenZip = "maven.zip"
$mavenDir = "maven"

if (!(Test-Path "$mavenDir\apache-maven-$mavenVersion")) {
    Write-Host "Downloading from: $mavenUrl" -ForegroundColor Yellow
    Invoke-WebRequest -Uri $mavenUrl -OutFile $mavenZip
    Write-Host "Extracting Maven..." -ForegroundColor Yellow
    Expand-Archive -Path $mavenZip -DestinationPath $mavenDir -Force
    Remove-Item $mavenZip
    Write-Host "Maven downloaded successfully!" -ForegroundColor Green
} else {
    Write-Host "Maven already exists, skipping download." -ForegroundColor Yellow
}

$mvnCmd = "$mavenDir\apache-maven-$mavenVersion\bin\mvn.cmd"

Write-Host "`nBuilding project..." -ForegroundColor Green
& $mvnCmd clean install -DskipTests

if ($LASTEXITCODE -eq 0) {
    Write-Host "`nStarting Spring Boot application..." -ForegroundColor Green
    & $mvnCmd spring-boot:run
} else {
    Write-Host "`nBuild failed!" -ForegroundColor Red
}

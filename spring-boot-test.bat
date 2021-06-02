@echo off

REM 設定今天的日期 (ex.20210601)
SET today=%date:~0,4%%date:~5,2%%date:~8,2%

echo.
echo 今天的日期：%today%



REM "進到 spring boot test 目錄"
cd D:\Developers\SourceCodes\GitHub\Docker Project\MyDocker\spring-boot-test\


echo.
echo 01. 建置 Maven 專案
call mvn clean install


echo.
echo 02. 建置 docker image (kevinhung/spring-boot-test)
docker build -t kevinhung/spring-boot-test:%today% . --no-cache


echo.
echo 03. 查看 docker image 是否建立成功
docker images


echo.
echo 04. 執行 image 將外部 port 80 => 內部 port 8080
docker run -d -p 80:8080 kevinhung/spring-boot-test:%today%


echo.
echo 05. 登入 Docker Hub
docker login -u kevinhung


echo.
echo 06. 將 image push 到 Docker Hub
docker push kevinhung/spring-boot-test:%today%


echo.
echo 07. 刪除專案下的 target 目錄
rd /s/q target


REM "進到 spring boot test 目錄"
cd D:\Developers\SourceCodes\GitHub\Docker Project\MyDocker
echo.
echo 08. 將 spring-boot-test push 到 GitHub
git add .
git commit -m "spring-boot-test"
git push -u origin master


echo.
echo 已完成 docker image 全部建置
pause
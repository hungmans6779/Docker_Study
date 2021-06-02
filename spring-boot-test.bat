@echo off

REM �]�w���Ѫ���� (ex.20210601)
SET today=%date:~0,4%%date:~5,2%%date:~8,2%

echo.
echo ���Ѫ�����G%today%



REM "�i�� spring boot test �ؿ�"
cd D:\Developers\SourceCodes\GitHub\Docker Project\MyDocker\spring-boot-test\


echo.
echo 01. �ظm Maven �M��
call mvn clean install


echo.
echo 02. �ظm docker image (kevinhung/spring-boot-test)
docker build -t kevinhung/spring-boot-test:%today% . --no-cache


echo.
echo 03. �d�� docker image �O�_�إߦ��\
docker images


echo.
echo 04. ���� image �N�~�� port 80 => ���� port 8080
docker run -d -p 80:8080 kevinhung/spring-boot-test:%today%


echo.
echo 05. �n�J Docker Hub
docker login -u kevinhung


echo.
echo 06. �N image push �� Docker Hub
docker push kevinhung/spring-boot-test:%today%


echo.
echo 07. �R���M�פU�� target �ؿ�
rd /s/q target


REM "�i�� spring boot test �ؿ�"
cd D:\Developers\SourceCodes\GitHub\Docker Project\MyDocker
echo.
echo 08. �N spring-boot-test push �� GitHub
git add .
git commit -m "spring-boot-test"
git push -u origin master


echo.
echo �w���� docker image �����ظm
pause
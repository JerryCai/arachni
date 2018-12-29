# docker_arachni

### Welcome [Arachni](https://github.com/Arachni/arachni) Docker

#### Environment variables
| Name  | Default | Options |
| ------------- | ------------- | ------------- |
| SERVER_ROOT_PASSWORD | arachni | any |
| ARACHNI_USERNAME | arachni | any |
| ARACHNI_PASSWORD | password | any |
| DB_ADAPTER | sqlite | sqlite, postgresql |
| DB_HOST | {empty} | any |
| DB_NAME | {empty} | any |
| DB_USER | {empty} | any |
| DB_PASS | {empty} | any |

#### Usage Samples

- run docker with SSH2 enabled

```sh
docker run -d \
  -p 222:22 \
  -p 7331:7331 \
  -p 9292:9292 \
  --name arachni \
  arachni/arachni:latest
```
then you can use
```sh
ssh -p 222 root@docker-machineIP  with default password is "arachni"
```
meanwhile , for access arachni RESTful API default username and password is :
```text
username: arachni
password: password
```
Web-UI Admin's username and password
```text
username: admin@admin.admin
password: administrator
```
Web-UI User's username and password
```text
username: user@user.user
password: regular_user
```
RESTful API endpoint will be
```text
http://${docker-machineIP}:7331
```
Web endpoint can be access as:
```text
http://${docker-machineIP}:9292
```

- you can also customize arachni rest server like below:

```sh
docker run -d \
  -p 222:22 \
  -p 7331:7331 \
  -p 9292:9292 \
  --name arachni \
  -e SERVER_ROOT_PASSWORD="DockerArachniPWD" \
  -e ARACHNI_PARAMS="--authentication-username arachni --authentication-password Pass123 --only-positives"  \
  arachni:1.4
```
then you can use
```sh
ssh -p 222 root@docker-machineIP  with password is "DockerArachniPWD"
```
also , for access arachni RESTful API customized username and password is :
```text
username: arachni
password: Pass123
```

#### Using PostgreSQL
```sh
docker run -d \
  -e "DB_ADAPTER=postgresql" \
  -e "DB_HOST=sample_host" \
  -e "DB_NAME=sample_db_name" \
  -e "DB_USER=sample_db_user" \
  -e "DB_PASS=sample_db_pass" \
  -p 222:22 \
  -p 7331:7331 \
  -p 9292:9292 \
  --name arachni \
  arachni/arachni:latest
```

#### docker-compose
Sample [docker-compose.yaml](https://github.com/JerryCai/arachni/blob/master/docker-compose.yaml)
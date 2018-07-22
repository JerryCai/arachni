# docker_arachni

### Welcome [Arachni](https://github.com/Arachni/arachni) Docker


#### Usage Samples

- run docker with SSH2 enabled

```sh
docker run -d -p 222:22 -p 7331:7331 -p 9292:9292 --name arachni arachni/arachni:latest
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
docker run -d -p 222:22 -p 7331:7331 -p 9292:9292 --name arachni -e SERVER_ROOT_PASSWORD="DockerArachniPWD" -e ARACHNI_PARAMS="--authentication-username arachni --authentication-password Pass123 --only-positives"  arachni:1.4

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

# docker_arachni

### Welcome [Arachni](https://github.com/Arachni/arachni) Docker


#### Usage Samples

- run docker with SSH2 enabled

```sh
docker run -d -p 222:22 -p 7331:7331
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

- you can also customize arachni rest server like below:

```sh
docker run -d -p 222:22 -p 7331:7331 --name arachni -e ARACHNI_SERVER_ROOT_PASSWORD="DockerArachniPWD" -e ARACHNI_PARAMS="--authentication-username arachni --authentication-password Pass123 --only-positives"  arachni:1.4

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

# Prometeo Athenticating Proxy Docker Image

## Creating a container proxy

To create a container, for example run the following command:

```bash
docker run --name proxy -e DESTINATION_URL=http://docs.spring.io -e USER_PASSWORD=testing -p 8081:8081 -d prometeo-auth:0.0.1-0
```

To test the proxy, using an applications such as [postman](https://www.getpostman.com/) using the following parameters:

| Item  | Description |
|---|---|
| Method  |  GET |  
| URI  | http://localhost:8081/spring-boot/docs/current/reference/html/boot-features-security.html |   
| Header  | Authorization: Basic dXNlcjp0ZXN0aW5n  |   

The result should similar to using the [http://docs.spring.io/spring-boot/docs/current/reference/html/boot-features-security.html](http://localhost:8081/spring-boot/docs/current/reference/html/boot-features-security.html) URI.

or alternatively run a curl command such as:

```bash
$ curl -L -H "Authorization: Basic dXNlcjp0ZXN0aW5n" "http://localhost:8081/spring-boot/docs/current/reference/html/boot-features-security.html"
```
Which should provide the same result after following the proxy server redirect after the authentication suceeds.

**NOTE**: removing or chaning the Authorization header will produce a 404 Not Found result.

## Environment Variables
The following variables configure the behaviour of the proxy in the docker image:

| Environment Var  | Description  | Example  | Default |
|---|---|---|---|
| DESTINATION_URL   | The root of the site the proxy points to.  | http://docs.spring.io/  | None |
| URL_MAPPINGS  | The pattern for filtering the paths which are to be accessible.  | "/*" for everything  | /* |
| USER_PASSWORD  | The password to use for authenticating the "**user**" username. | e.g. testing  | None |
| HTTP_PORT  | The port the proxy is listening on. | 80  | 8081 |

**NOTE**: the username is always "user".
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

**NOTE**: removing or chaning the Authorization header will produce a 404 Not Found result.
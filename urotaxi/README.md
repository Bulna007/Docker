# A simple JAVA Web application 


### Verify the client is running

Open your browser and type `http://localhost:5173`

# Using Docker

### Create a network for the docker containers

`docker network create urotaxintw`

### Create a docker volume for mysql database

`docker volume create urotaxidbvol`

### Run the mysql database container

```sh
docker run --name mysql-db \
--network urotaxintw \
-v urotaxidbvol:/var/lib/mysql \
-v ./src/main/db/urotaxidb.sql:/docker-entrypoint-initdb.d/urotaxidb.sql \
-e MYSQL_ROOT_PASSWORD=welcome1 \
-d mysql:9.4.0
```

```sh
Here along with mounting the mysql database data directory onto the named volume, we mounted the db scheme sql script onto the docker-entrypoint-initdb.d/ directory so that mysql database executes the sql files under the directory as initial scripts while booting up the container. So that the application database schema (tables) will be created.
```

### Build java spring boot image

`docker build -t urotax:1.0 .`

### Run java spring boot container

```sh
docker run --name urotaxi \
--network urotaxintw \
-e SPRING_DATASOURCE_URL=jdbc:mysql://mysql-db:3306/urotaxidb \
-e SPRING_DATASOURCE_USERNAME=root \
-e SPRING_DATASOURCE_PASSWORD=welcome1 \
-p 8080:8080 \
-d urotaxi:1.0
```

### Verify the application is running

Open your browser and type `http://localhost:8080/urotaxi`

## Using Docker Compose

`docker compose up -d`

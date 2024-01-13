
# MLflow Tracking Server with PostgreSQL Backend
This README.md provides instructions on setting up and running a local MLflow tracking server with a PostgreSQL database backend using Docker Compose.

## Overview
The provided Docker Compose configuration (docker-compose.yml) sets up two main services:
* MLflow Database (mlflow-db): Utilizes the postgres:13.3 image to create a PostgreSQL database serving as the backend store for MLflow.
* MLflow Server (mlflow-server): A local MLflow tracking server built from the provided Dockerfile. This server interfaces with the PostgreSQL database and stores artifacts in a designated volume.
## Prerequisites
- Docker and Docker Compose installed on your system.
- Basic understanding of Docker, Docker Compose, and environment variables.
## Configuration
Before running the services, ensure the following:

- A .env file is created at the root of the project with necessary environment variables.
- The MLFLOW_ARTIFACT_STORE variable in the .env file specifies the path for MLflow artifact storage.
- The `LOCAL_DEV_MLFLOW_SERVER_PORT` variable in the .env file defines the port for accessing the MLflow server.
## Docker Compose File Overview
The docker-compose.yml file is structured as follows:

* Version: Specifies the Compose file version (3.8).
* Volumes: Defines two volumes:
* postgres-data: For persistent PostgreSQL database storage.
* artifact-store: For storing MLflow artifacts.
* Services:
  * mlflow-db: Configures the PostgreSQL database container.
  * mlflow-server: Sets up the MLflow tracking server with necessary build arguments, ports, dependencies, environment variables, and volumes.

## Running the Services
Start Services:
```
docker-compose up -d
```
This command will start the MLflow server and PostgreSQL database as background services.

Access MLflow Server:

Open your web browser and navigate to 
`http://localhost:<LOCAL_DEV_MLFLOW_SERVER_PORT>`, where `<LOCAL_DEV_MLFLOW_SERVER_PORT>` is the port number defined in your .env file.
Stop Services:
`docker-compose down`
Use this command to stop and remove the containers.
Customization

- Modify the .env file as needed to change environment variables.
- Update the Dockerfile or Docker Compose configuration for advanced customization.
## Important Notes
- Ensure all required environment variables are correctly defined in the .env file.
- For production use, consider additional security measures and configurations.
## Conclusion
This setup provides a convenient and isolated environment for MLflow tracking with a PostgreSQL backend, suitable for development and testing purposes.

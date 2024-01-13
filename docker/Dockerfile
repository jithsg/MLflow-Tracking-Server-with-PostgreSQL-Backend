# Use Python 3.10 slim image as the base
FROM python:3.10-slim

# Define build-time argument for MLflow artifact store
ARG MLFLOW_ARTIFACT_STORE

# Set environment variables
ENV PYTHONUNBUFFERED=1 \
    VIRTUAL_ENV="${HOME}/.venv" \
    PATH="${HOME}/.venv/bin:${PATH}" \
    LC_ALL=C.UTF-8 \
    LANG=C.UTF-8 \
    DEBIAN_FRONTEND=noninteractive \
    BUILD_POETRY_LOCK="${HOME}/poetry.lock.build"\
    MLFLOW_ARTIFACT_STORE="${MLFLOW_ARTIFACT_STORE}"

# Install git using apt-get and clean up afterwards
RUN apt-get update -qq \
    && apt-get install -y --no-install-recommends git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Create directories for MLflow backend store and app
RUN mkdir -p "${MLFLOW_ARTIFACT_STORE}" /app

# Copy the server run script to the container
COPY ./docker/run-server.sh /

# Make the run-server.sh script executable
RUN chmod +x /run-server.sh

# Install poetry in a temporary home directory
RUN HOME=/tmp pip install --no-cache-dir poetry==1.5.1

# Copy the Python project files to /app in the container
COPY ./pyproject.toml ./poetry.lock /app/

# Set the working directory to /app
WORKDIR /app

# Create a virtual environment and install dependencies with Poetry
RUN python3.10 -m venv "${VIRTUAL_ENV}" \
    && . "${VIRTUAL_ENV}/bin/activate" \
    && pip install --upgrade pip \
    && poetry install \
    && cp poetry.lock "${BUILD_POETRY_LOCK}" \
    && rm -rf "${HOME}/.cache/*"

# Set the command to run the server script
CMD ["/run-server.sh"]

import mlflow

from mlflow import log_metric, log_param, log_artifacts


if __name__ == "__main__":
    mlflow.set_tracking_uri("http://localhost:6101")
    mlflow.log_param("lr", 0.001)
    # Your ml code
# java-aws-app

A minimal **Spring Boot** Java REST API prepared for deployment to **AWS ECS / Fargate** (or any container platform).  
This repository includes:

- Spring Boot application (Java 21)
- Dockerfile (multi-stage)
- GitHub Actions workflow to build, Dockerize and push image to Docker Hub
- Instructions for deploying to AWS (manual + hints)

## Quick local run

### Prerequisites
- Java 21 SDK
- Maven 3.8+
- Docker (for building image)

### Run locally
```bash
# build
mvn -B package

# run
java -jar target/java-aws-app-0.0.1-SNAPSHOT.jar
# app will start on http://localhost:8080
```

### Docker (local)
```bash
docker build -t yourusername/java-aws-app:latest .
docker run -p 8080:8080 yourusername/java-aws-app:latest
```

## CI/CD (GitHub Actions)
Included: `.github/workflows/ci-cd.yml` which:
- builds the jar with Maven
- builds and pushes Docker image to Docker Hub

Set the following repository secrets:
- `DOCKERHUB_USERNAME`
- `DOCKERHUB_PASSWORD`
- Optionally: `AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`, `AWS_REGION` if you add AWS deploy step

## Deploy to AWS ECS (high level)
1. Push Docker image to ECR or Docker Hub.
2. Create an ECS cluster (Fargate) and task definition referencing the image.
3. Create an ALB, target group, and service to run the task.
4. Configure autoscaling and health checks.

For infrastructure-as-code, consider using **AWS CDK**, **Terraform**, or the AWS Console. This README contains basic steps and links.

---

Future reference - 
- Add an AWS CDK TypeScript or Java CDK project to fully provision ECS + ALB + RDS.
- Extend the app with DynamoDB examples or CloudWatch logging.

FROM openjdk:17-jdk AS builder

WORKDIR /build

COPY . .

RUN chmod +x mvnw
RUN ./mvnw clean package -DskipTests


FROM eclipse-temurin:17-jre-jammy AS app

WORKDIR /app

COPY --from=builder /build/target/*.jar app.jar

# 安裝 Terraform
RUN apt update && \
    apt install -y wget unzip && \
    wget https://releases.hashicorp.com/terraform/1.12.1/terraform_1.12.1_linux_amd64.zip && \
    unzip terraform_1.12.1_linux_amd64.zip && \
    mv terraform /usr/local/bin/ && \
    rm terraform_1.12.1_linux_amd64.zip

CMD ["java", "-jar", "app.jar", "--spring.profiles.active=production"]

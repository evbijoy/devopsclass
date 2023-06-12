FROM alpine/git
WORKDIR /app
RUN git clone https://github.com/spring-projects/spring-petclinic.git

FROM maven
WORKDIR /app
COPY --from=0 /app/spring-petclinic /app
RUN mvn install

FROM openjdk
WORKDIR /app
COPY --from=1 /app/target/*.jar /app
EXPOSE 8080
CMD ["java -jar spring-petclinic-1.5.1.jar"]

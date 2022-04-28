FROM java:8
WORKDIR /
ADD my-app/target/my-app-1.0-SNAPSHOT.jar chandani.jar
EXPOSE 8080
CMD java - jar chandani.jar

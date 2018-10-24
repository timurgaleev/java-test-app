FROM java:8
VOLUME /tmp
ADD target/aksisapp-1.0-SNAPSHOT.jar aksisapp-1.0-SNAPSHOT.jar
RUN bash -c 'touch /aksisapp-1.0-SNAPSHOT.jar'
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/aksisapp-1.0-SNAPSHOT.jar"]

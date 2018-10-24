FROM java:8
VOLUME /tmp
ADD aksisapp.jar aksisapp.jar
RUN bash -c 'touch /*.jar'
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/*.jar"]

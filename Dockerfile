FROM java:8
VOLUME /tmp
ADD *.jar 
RUN bash -c 'touch /*.jar'
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/*.jar"]

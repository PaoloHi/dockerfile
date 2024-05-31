FROM openjdk:17-jdk-alpine

WORKDIR /app

COPY target/third-party-transaction-auth-0.0.1-SNAPSHOT.jar blumonpay-app.jar

COPY certs/blumonpay.net.cer /app/blumonpay.net.cer 

RUN chmod +x blumonpay-app.jar

RUN cd /opt/openjdk-17/lib/security && keytool -import -noprompt -trustcacerts -alias https://sandbox-ecommerce.blumonpay.net/ecommerce/charge  -file /app/blumonpay.net.cer -keystore cacerts  -storepass changeit


ENTRYPOINT ["java","-jar", "blumonpay-app.jar"]

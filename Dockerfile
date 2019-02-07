FROM alpine:3.8
RUN apk add wget unzip openjdk8-jre \
&& wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-3.3.0.1492-linux.zip \
&& unzip sonar-scanner* \
&& mv sonar-scanner-3* sonar-scanner \
&& rm /sonar-scanner-cli* \
&& rm -rf /sonar-scanner/jre \
&& sed -i 's/use_embedded_jre=true/use_embedded_jre=false/g' /sonar-scanner/bin/sonar-scanner
ENV PATH="/sonar-scanner/bin:${PATH}"
RUN apk add nodejs npm

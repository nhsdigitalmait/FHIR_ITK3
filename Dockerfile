FROM nhsdigitalmait/tkw-x:d737cf8
ARG USER_ID

RUN useradd -rm -u $USER_ID service
RUN mkdir /home/service/data/ && chown service:service /home/service/data/
VOLUME /home/service/data
VOLUME /home/service/fhir
#RUN mkdir /home/service/MESH-DATA-HOME/ && chown service:service /home/service/MESH-DATA-HOME/
VOLUME /home/service/MESH-DATA-HOME
COPY . /home/service/TKW/config/FHIR_ITK3
WORKDIR /home/service/TKW/config/FHIR_ITK3
RUN mkdir /home/service/TKW/config/FHIR_ITK3/intermediary_temp/ && chown service:service /home/service/TKW/config/FHIR_ITK3/intermediary_temp/
RUN mkdir /home/service/TKW/config/FHIR_ITK3/messages_for_validation/
RUN sh set-all-configurations.sh

ENV MESH001=MESH001
ENV MESH002=MESH002
ENV MESH003=MESH003

USER service
ENTRYPOINT ["bash", "runtkwfhirvalidator.sh"]


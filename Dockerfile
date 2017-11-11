FROM coolq/wine-coolq

RUN apt update &&\
    apt -y install python3 &&\
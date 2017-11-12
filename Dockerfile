FROM coolq/wine-coolq

LABEL maintainer="Z4HD@outlook.com"
LABEL SourceCodeAutor="jqqqqqqqqqq@gmail.com"

WORKDIR /home/user

RUN apt update &&\
    apt -y install python3 python3-pip wget unzip&&\
    wget -O /tmp/CTBSource.zip https://github.com/jqqqqqqqqqq/coolq-telegram-bot/archive/dev.zip &&\
    sudo -Hu user unzip -d /home/user/ /tmp/CTBSource.zip &&\
    mv coolq-telegram-bot-dev coolq-telegram-bot &&\
    cd ./coolq-telegram-bot &&\
    mv bot_constant-json.py bot_constant.py &&\
    pip3 install -r requirements.txt &&\
    rm -f /tmp/CTBSource.zip

WORKDIR /home/user/coolq-telegram-bot

ENV CTB_JSON_SETTINGS_PATH="/home/user/coolq/bot_constant.json"

CMD [ "start && python3 daemon.py start" ]
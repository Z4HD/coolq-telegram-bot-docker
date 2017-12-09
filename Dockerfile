FROM richardchien/cqhttp

LABEL Maintainer="Z4HD@outlook.com"
LABEL SourceCodeAuthor="jqqqqqqqqqq@gmail.com"

WORKDIR /home/user

RUN sudo add-apt-repository ppa:deadsnakes/ppa &&\
    sudo apt-get update &&\
    sudo apt-get -y install python3.6 wget unzip &&\
    wget -O /tmp/get-pip.py https://bootstrap.pypa.io/get-pip.py &&\
    python3.6 /tmp/get-pip.py &&\
    rm -f /tmp/get-pip.py

RUN wget -O /tmp/CTBSource.zip https://github.com/jqqqqqqqqqq/coolq-telegram-bot/archive/master.zip &&\
    sudo -Hu user unzip -d /home/user/ /tmp/CTBSource.zip &&\
    mv coolq-telegram-bot-master coolq-telegram-bot &&\
    cd ./coolq-telegram-bot &&\
    mv bot_constant-json.py bot_constant.py &&\
    python3.6 -m pip install --upgrade pip &&\
    python3.6 -m pip install -r requirements.txt &&\
    rm -f /tmp/CTBSource.zip

WORKDIR /home/user/coolq-telegram-bot

ENV CTB_JSON_SETTINGS_PATH="/home/user/coolq/bot_constant.json"

FROM richardchien/cqhttp

LABEL Maintainer="Z4HD@outlook.com"
LABEL SourceCodeAuthor="jqqqqqqqqqq@gmail.com"

WORKDIR /home/user

RUN sudo add-apt-repository ppa:deadsnakes/ppa &&\
    sudo apt-get update &&\
    sudo apt-get -y install python3.6 wget unzip &&\
    sudo wget -O /tmp/get-pip.py https://bootstrap.pypa.io/get-pip.py &&\
    sudo python3.6 /tmp/get-pip.py &&\
    sudo rm -f /usr/bin/python3 &&\
    sudo ln -s /usr/bin/python3.6 /usr/bin/python3 &&\
    sudo rm -f /tmp/get-pip.py

RUN git clone -b master --depth 1 https://github.com/jqqqqqqqqqq/coolq-telegram-bot &&\
    cd ./coolq-telegram-bot &&\
    mv bot_constant-json.py bot_constant.py &&\
    pip3.6 install --upgrade pip &&\
    pip3.6 install -r requirements.txt &&\
    rm -f /tmp/CTBSource.zip

WORKDIR /home/user/coolq-telegram-bot

ENV CTB_JSON_SETTINGS_PATH="/home/user/coolq/bot_constant.json"

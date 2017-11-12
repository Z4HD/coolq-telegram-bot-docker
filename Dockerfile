FROM coolq/wine-coolq

RUN apt update &&\
    apt -y install python3 python3-pip wget unzip&&\
    mkdir -p /home/user/coolq-telegram-bot &&\
    wget -O /tmp/ https://github.com/jqqqqqqqqqq/coolq-telegram-bot/archive/dev.zip &&\
    sudo -Hu user unzip -d /home/user/ /tmp/dev.zip &&\
    


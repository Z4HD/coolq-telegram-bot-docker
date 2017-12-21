# coolq-telegram-bot-docker v3.x

使用Docker容器化的QQ和Telegram的消息互转机器人，本分支专为v3.x版本的coolq-telegram-bot设计。

Source: jqqqqqqqqqq/coolq-telegram-bot

镜像基于[richardchien/cqhttp](https://richardchien.github.io/coolq-http-api/3.3/#/Docker)构建

每次构建都会从[jqqqqqqqqqq/coolq-telegram-bot](https://github.com/jqqqqqqqqqq/coolq-telegram-bot)拉取最新的代码。

# 构建
>*表示死活登不上Docker.com的账号，因此暂时不发布至Docker Hub*，请手动构建，3Q2X。

进行下列操作前请先
```shell
git clone https://github.com/Z4HD/coolq-telegram-bot-docker
```

## 构建稳定版bot镜像（master分支）
```shell
sudo docker build -t "coolq-telegram-bot" .
```

## 构建测试版bot镜像（dev分支）
```shell
sudo docker build -t "coolq-telegram-bot-dev" -f Dockerfile-dev .
```

# 运行
使用与[coolq/wine-coolq](https://cqp.cc/t/34558)和[richardchien/cqhttp](https://richardchien.github.io/coolq-http-api/3.3/#/Docker)相同的指令启动。将下面示例中的中括号内的内容（包括中括号）按实际情况修改。

```shell
sudo docker run --name=ctb -d -p 【VNC页面端口号】:9000 -v 【酷Q数据目录】:/home/user/coolq -e VNC_PASSWD=【VNC页面密码】 -e COOLQ_ACCOUNT=【酷Q机器人的QQ账号】 coolq-telegram-bot
```

随后便可通过 `sudo docker stop ctb`等指令控制后台服务的运行。

参考coolq-http的的配置教程配置完coolq并启用CoolqHttpAPI插件后，输入下列指令开始bot的后台运行

```shell
#       docker exec -it ctb su
<容器内> python3 daemon.py start
<容器内> exit
```

使用`sudo docker exec -it ctb su`以root身份深入到容器内部

### 注意事项
1. 环境变量`CTB_JSON_SETTINGS_PATH`用于指定JSON格式转发Bot配置文件的路径（容器内），默认值`/home/user/coolq/bot_constant.json`。请将JSON格式配置文件重命名为`bot_constant.json`后放置于coolq数据目录下即可。
2. 您需要自行安装并启用[CQ http API](https://github.com/richardchien/coolq-http-api/)。[如何安装？](https://richardchien.github.io/coolq-http-api/)

# 更新

## 使用Json格式配置文件（默认）
使用tools/bot-upgrade.py升级，可在升级后保留对Json格式配置文件的支持。

```shell
sudo docker exec -it ctb sh -c "python3 tools/bot-upgrade.py"
```

## 使用Py格式配置文件
直接通过`git pull`升级至最新版本。

```shell
sudo docker exec -it ctb sh -c "git pull"
```

# Docker.com 一般的准则和建议
- [ ] 容器应该是短暂的
- [ ] 使用.dockerignore文件
- [ ] 避免安装不必要的包
- [ ] 每个容器只运行一个进程
- [ ] 最小化层的数量
- [x] 排序多行参数

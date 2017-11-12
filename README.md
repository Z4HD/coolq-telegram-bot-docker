# coolq-telegram-bot-docker (Deving)
使用Docker容器化的QQ和Telegram的消息互转机器人。Source: jqqqqqqqqqq/coolq-telegram-bot
镜像基于[coolq/wine-coolq](https://hub.docker.com/r/coolq/wine-coolq/)构建

每次构建都会从[jqqqqqqqqqq/coolq-telegram-bot](https://github.com/jqqqqqqqqqq/coolq-telegram-bot)的master分支拉取最新的代码。

# 重要警示
本容器正在开发中，切勿用于生产环境。

# 运行
使用与[coolq/wine-coolq](https://cqp.cc/t/34558)类似的指令启动。将下面示例中的中括号内的内容（包括中括号）按实际情况修改。

```shell
docker run --name=ctb -d -p 【VNC页面端口号】:9000 -v 【酷Q数据目录】:/home/user/coolq -e VNC_PASSWD=【VNC页面密码】 -e COOLQ_ACCOUNT=【酷Q机器人的QQ账号】 【构建的镜像hash或name】
```

随后便可通过 `docker stop ctb`等指令控制后台服务的运行。

参考wine-coolq的的配置教程配置完coolq并启用SocketAPI插件后，输入下列指令开始bot的后台运行

```
docker exec -i ctb "python3 daemon.py start"
```

输入`docker exec -it ctb su`以root身份深入到容器内部

### 注意事项
1. 环境变量`CTB_JSON_SETTINGS_PATH`用于指定JSON格式转发Bot配置文件的路径（容器内），默认值`/home/user/coolq/bot_constant.json`。请将JSON格式配置文件重命名为`bot_constant.json`后放置于coolq数据目录下即可。
2. 由于coolq数据卷不在容器内，您需要自行安装并启用jqqqqqqqqqq编译的[CQ Socket API](https://github.com/jqqqqqqqqqq/coolq-telegram-bot/releases/tag/v2.5.0)。[如何安装？](https://github.com/jqqqqqqqqqq/coolq-telegram-bot/tree/v2.5.0#安装酷q-socket-api)

# Docker.com 一般的准则和建议
- [ ] 容器应该是短暂的
- [ ] 使用.dockerignore文件
- [ ] 避免安装不必要的包
- [ ] 每个容器只运行一个进程
- [ ] 最小化层的数量
- [x] 排序多行参数
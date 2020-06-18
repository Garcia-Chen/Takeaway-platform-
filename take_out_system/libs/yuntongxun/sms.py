from .CCPRestSDK import REST
from django.conf import settings

accountSid = '8aaf07086e0115bb016e4dd7ca3a2bad'
# 说明：主账号，登陆云通讯网站后，可在控制台首页中看到开发者主账号ACCOUNT SID。

accountToken = 'c1ad1655081342a39504e02dfa509d5c'
# 说明：主账号Token，登陆云通讯网站后，可在控制台首页中看到开发者主账号AUTH TOKEN。

appId = '8aaf07086e0115bb016e4dd7ca902bb3'
# 请使用管理控制台中已创建应用的APPID。

serverIP = 'sandboxapp.cloopen.com'
# 说明：请求地址，生产环境配置成app.cloopen.com。

serverPort = '8883'
# 说明：请求端口 ，生产环境为8883.

softVersion = '2013-12-26'  # 说明：REST API版本号保持不变。


def sendTemplateSMS(to, datas, tempId):
    # 初始化REST SDK
    rest = REST(serverIP, serverPort, softVersion)
    rest.setAccount(accountSid, accountToken)
    rest.setAppId(appId)

    result = rest.sendTemplateSMS(to, datas, tempId)

    if result.get('statusCode') ==  '000000':
        print('发送成功')
        return True
    else:
        print('发送失败')
        return False

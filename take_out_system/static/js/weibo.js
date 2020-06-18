/media/tarena/LYRIC/secondary.jsfunction getQueryString(v){
        var query =window.location.search.substring(1);
        var data=query.split('&');
        for(var i=0;i<data.length;i++){
            //state=123
            var par=data[i].split('=');
            //[state,123]
            if (par[0]==v){
                return par[1] //code数据
            }
        }
        return null
    }
    $(function(){
        var code=getQueryString('code');
        console.log(code)
        $.ajax({
            type:'get',
            dataType:'json',
            url:'http://127.0.0.1:8000/user/weibo/token?code='+code,
            success:function(result){
                console.log(result)
                //1.已经在博客网站注册过 200
                if(result.code==200){
                    //走正常登录流程
                    window.localStorage.setItem('dnblog_token', result.data.token)
                    window.localStorage.setItem('dnblog_user', result.username)
                    window.location =  '/' + result.username + '/topics';
                }else if(result.code==10777){
                //还未在博客网站注册过 10777- 弹到注册页面 进行注册
                    var wuid=result.wuid
                    window.location='/registers/?wuid='+wuid
                }
            }
        })
    })


var userps=$("#userps").text()
$("#su").bind("click",function(){
    var　username=$("#username").val()
    var password=$("#userps").val()

    $.ajax({
        type:"POST",
        data:JSON.stringify({"username":username,"password":password}),
        url:"http://127.0.0.1:8000/user/login",
        contentType:"application/json",
        dataType:"json",
        success:function(data){
            if(data.code==200){
            window.localStorage.setItem("users",JSON.stringify(username))
           k= window.localStorage.getItem("k")
           if(k==null){

           window.location.href="http://127.0.0.1:8000/index"
           }else{
           swal({
            title: k+"已经存入你的账户！",
            text: "正在为你跳转到主页！",
            type: "success"},
            function(){
            window.location.href="http://127.0.0.1:8000/index"
            }
           )

            }



            }else{
              swal({
                title:data.error,
                text: "请确重新登录！",
                type: "warning",

              })
            }
        }

    })


})
function weibo(){
    	$.ajax({
    		type:'get',
    		dataType:'json',
    		url:'http://127.0.0.1:8000/user/weibo/url',
    		success:function(result){
    			if(result.code==200){
    				console.log(result)
    				window.location=result.oauth_url
    			}else{
    				alert('Get weibo url error')
    			}
    		}
    	})
    }


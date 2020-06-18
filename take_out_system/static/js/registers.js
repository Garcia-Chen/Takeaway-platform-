$("#chec_bu").bind("click",function(){

            var xhr = createXhr();
            xhr.open('get','/user/get_duanxin/',true);
            xhr.onreadystatechange = function(){
                if(xhr.readyState == 4 & xhr.status == 200){
                    console.log(xhr.responseText)
                }
            }
            xhr.send(null);
            k=60;
            var taskID=setInterval(function(){
                k-=1
                $("#chec_bu").text(k+"s")
                $("#chec_bu").attr('disabled',true)
            if (k==0) {
                clearInterval(taskID)
                $("#chec_bu").text("发送验证码")
                $("#chec_bu").attr('disabled',false)
        }

        },1000)

    })

$("#su").bind("click",function(){

    var inp =$("#chec").val()
    var username=$("#username").val()
    var password_1=$("#userps1").val()
    var password_2=$("#userps").val()
    var address=$("#address").val()

      $.ajax({
      type:"POST",
      url:"http://127.0.0.1:8000/user/"+username,
      dataType:"json",
      contentType:"application/json",
      data:JSON.stringify({
      "phone":inp,
      "username":username,
      "password_1":password_1,
      "password_2":password_2,
      "address":address,
      }),
      success:function(data){
      console.log(data)
        if(data.code==200){
            swal({
            title: "注册成功！",
            text: "正在为你跳转到主页",
            type: "success",
            })
           window.location.href="http://127.0.0.1:8000/index"
           window.localStorage.setItem("users",JSON.stringify(username))

        }else{
        swal({
            title: "注册失败！",
            text: data.error,
            type: "warning",
        })
        }
      }

      })

})

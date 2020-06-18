k1=window.localStorage.getItem("users")
var k=["5元优惠劵","3元优惠劵","6元优惠劵","8元优惠劵"]
v=k[Math.floor((Math.random()*k.length))]
console.log(v)
$(window).load(function() {
        $('#slider').nivoSlider();
//        个人登录状态校验..
        if(k1==null){
           swal({
            title:"恭喜您抽到"+v,
            text: "请登录领取！",
            type: "success",
            showCancelButton: true,
            confirmButtonColor: "rgba(55, 227, 88, 0.8)",
            confirmButtonText: "登录领取！",
            cancelButtonText: "暂不添加！,继续浏览网页！",
                },
             function(isConfirm){
            if (isConfirm) {
                window.location.href="http://127.0.0.1:8000/user/login"
                window.localStorage.setItem("k",JSON.stringify(v))


            }


            }


            )}else{
             $("#log1").removeAttr("onclick")
                $("#log1").text("欢迎用户"+k1)


            }


        html=""
        $.ajax({
//       请求方式
        type:"get",
//        请求头
        contentType:"application/json",

        dataType:"json",
// 把JS的对象或数组序列化一个json 字符串!!
//        data:JSON.stringify(post_data),
        url:"http://127.0.0.1:8000/index/m/display",
        success:function(data){
            if(data.code==200){

        $.each(data.msg,function(i,data){
            console.log(data.store)
             html+="<div class='two'>"
             html+="<div class='two_1'>"
             html+='<img class="cli" src="/'+data.img +'">'
             html+= "<div class='two_2'>"
             html+= '<a href="http://127.0.0.1:8000/secondary/'+data.id+'" value='+data.id+'">'+"商家名称:"+data
             .store+'</a>'
             html+="<ul>"
             html+="<li>"+'商家地址：'+data.address+"</li>"
             html+="<li>"+'商家评分：'+data.paise+"</li>"
             html+="<li>"+'商家销量：'+data.sales+"</li>"
             html+="</ul>"
             html+="</div>"
             html+="</div>"
             html+="</div>"
            })

             $(".two").html(html)
             }
           },

    })


    });

     $(document).on("click",".cli",function(){
     var p =$(".two_2 a").attr('href')
     window.location.href=p

   })
   $("#out").bind("click",function(){
    window.localStorage.clear()
    window.location.href="http://127.0.0.1:8000/index"

   })

   $("#sales").bind("click",function(){
        html=""
        $.ajax({
//       请求方式
        type:"get",
//        请求头
        contentType:"application/json",

        dataType:"json",
// 把JS的对象或数组序列化一个json 字符串!!
//        data:JSON.stringify(post_data),
        url:"http://127.0.0.1:8000/index/find/sales",
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

   })
   $("#good").bind("click",function(){
        html=""
        $.ajax({
//       请求方式
        type:"get",
//        请求头
        contentType:"application/json",

        dataType:"json",
// 把JS的对象或数组序列化一个json 字符串!!
//        data:JSON.stringify(post_data),
        url:"http://127.0.0.1:8000/index/find/good",
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

   })
   $("#area").bind("click",function(){
        html=""
        $.ajax({
//       请求方式
        type:"get",
//        请求头
        contentType:"application/json",

        dataType:"json",
// 把JS的对象或数组序列化一个json 字符串!!
//        data:JSON.stringify(post_data),
        url:"http://127.0.0.1:8000/index/find/area",
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

   })
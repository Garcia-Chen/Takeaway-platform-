//搜索功能实现　ajax　请求数据
$("#s_1").bind("click",function(){
    inp=$("#i_1").val()
    $.ajax({
        dataType:"json",
        type:"get",
        contentType:"application/json",
        url:"http://127.0.0.1:8000/find/"+inp,
//       回调函数
        success:function(data){
        if(data.code==200){
        console.log(data.msg)
            $.each(data.msg,function(i,data){
            console.log(typeof(data.store_status))
             if (data.store_status==true){
                data.store_status="营业中"
             }else{
               data.store_status="商家打烊"
                }
             html+="<div class='two'>"
             html+="<div class='two_1'>"
             html+='<img class="cli" src="/'+data.store_img +'">'
             html+= "<div class='two_2'>"
             html+='<a href="http://127.0.0.1:8000/secondary/'+data.id+'"  value='+data.id+'">'+"商家名称:"+data
             .store_name+'</a>'
             html+="<ul>"
             html+="<li>"+'营业状态：'+data.store_status+"</li>"
             html+="<li>"+'商家地址：'+data.store_adress+"</li>"
             html+="<li>"+'商家评分：'+data.store_paise+"</li>"
             html+="<li>"+'商家销量：'+data.store_sales+"</li>"
             html+="</ul>"
             html+="</div>"
             html+="</div>"
             html+="</div>"
            })
             $(".two").html(html)
             }
            }
    })
    })
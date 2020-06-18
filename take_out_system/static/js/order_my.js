users=window.localStorage.getItem("users")
$(function(){
window.scrollReveal=new scrollReveal({reset:true})
       html=""
       console.log(users)
       $.ajax({
            type:"GET",
            dataType:"json",
            contenType:"application/json",
            url:"http://127.0.0.1:8000/order/"+users,
            success:function(data){
            if(data.code==200){
                $("#sec").text(users)
                $.each(data.data,function(i,j){
                    html+='<div class="ltr01" data-scroll-reveal="bottom 5px 2 2">'
                    html+='<ul class="o_name">'
                    html+='<li>订单号：'+j.number +'</li>'
                    html+='<li>下单人：'+j.username +'</li>'
                    html+='<li>订单金额：'+j.price +'</li>'
                    html+='<li>商家名称：'+j.shop +'</li>'
                    html+='<li>商品名称：'+j.goodname +'</li>'
                    html+='<li>下单时间：'+j.time +'</li>'
                    html+='<li>下单数量：'+j.count +'</li>'
                    html+='</ul>'
                    html+='</div>'
                })
             $(".ltr01").html(html)
            }else{
                swal({
                 title: "你尚未下单",
                 text: "是否立即下单！",
//                 cancelButtonText: "取消购买！",
                 type: "warning",
                },
                function(isConfirm){
                if (isConfirm) {
                  window.location.href="http://127.0.0.1:8000/index"
       }})

       }


}}

)}
)
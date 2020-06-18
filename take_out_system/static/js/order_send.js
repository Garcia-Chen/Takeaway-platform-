
obj=window.localStorage.getItem("obj")
users=window.localStorage.getItem("users")
storename=window.localStorage.getItem("storename")
$(function(){
    order_num=getQueryString("out_trade_no")
    $.ajax({
      type:"POST",
      data:JSON.stringify({'obj':obj,"users":users,"order_num":order_num,"storename":storename}),
      contentType:"application/json",
      dataType:"json",
      url:"http://127.0.0.1:8000/order/",
      success:function(){
      }


    })
})
function getQueryString(v){
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
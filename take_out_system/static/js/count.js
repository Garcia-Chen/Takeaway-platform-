//购物车按钮事件
var arrayObj = new Array()
var obj={}

$(document).on("click",".num",function(){
    $(this).prev().css('display','inline-block')
    $(this).next().css('display','inline-block')
    $(this).css("position","relative")
    $(this).css("right","-75px")
    $(this).attr('disabled',true)
    $("#out_count").css('display','block')
    $("#in_count_one").css('display','block')
    $("#in_count_two").css('display','block')
    $("#co_bu").css('display','block')
    $("#in_count_three").css('display','block')
    $("#count_o").css('display','block')
    $("#count_n").css('display','block')
    $("#count_e").css('display','block')
    $("#h").css('display','block')
    $(".ll").css("background","transparent")
    $(this).text(1)
    count_o=parseFloat($(this).parent().prev().find(".j_c").first().text()).toFixed(2)
    name=$(this).parent().prev().parent().find(".bd_2").first().text()
    sales=$(this).parent().prev().parent().find(".sales").first().text()
    num=$(this).text()
    console.log(count_o)
    obj[name]=num+"&"+sales+"&"+count_o
    console.log(name)
    count_num(count_o)

})
 $(document).on("click",".add",function(){
    num=Number($(this).next(".num").text())
    num+=Number(1)
    $(this).next(".num").text(num)
//    获取到　要操作的元素对象　当前位置找到父级元素　再找到上一级元素再找到相邻元素的第一个元素
    var count_o=parseFloat($(this).next(".num").parent().prev().find(".j_c").first().text()).toFixed(2)
    name=$(this).next(".num").parent().prev().parent().find(".bd_2").first().text()
    num=$(this).next(".num").text()
    sales=$(this).next(".num").parent().prev().parent().find(".sales").first().text()
   obj[name]=num+"&"+sales+"&"+count_o
    console.log(num)
    count_num(count_o)



   })
$(document).on("click",".reduce",function(){
    num=Number($(this).prev(".num").text())
    num-=Number(1)
    $(this).prev(".num").text(num)

    var count_o=parseFloat( $(this).prev(".num").parent().prev().find(".j_c").first().text()).toFixed(2)
    name=$(this).prev(".num").parent().prev().parent().find(".bd_2").text()
    num=$(this).prev(".num").text()
    sales=$(this).prev(".num").parent().prev().parent().find(".sales").text()
    obj[name]=num+"&"+sales+"&"+count_o
    console.log(count_o)
    reduce(count_o)
    if(num==0){
        $(this).prev().attr('disabled',false)
        $(this).prev().text("添加到购物车")
        $(this).css('display','none')
        $(this).prev().prev().css('display','none')
        $(this).prev().css("right","-102px")
    }
    if(arrayObj.length==0){
        $("#out_count").css('display','none')
        $("#in_count_one").css('display','none')
        $("#in_count_two").css('display','none')
        $("#co_bu").css('display','none')
        $("#in_count_three").css('display','none')
        $("#count_o").css('display','none')
        $("#count_n").css('display','none')
        $("#count_e").css('display','none')
        $("#h").css('display','block')
       }
   })

count_num=function(count_o){
    arrayObj.push(count_o)
    p=ary(arrayObj)
    $("#count_n").text("￥"+String(p))
    $("#count_o").text("￥"+String(parseFloat(p*1.65).toFixed(2)))


    }

reduce=function(count_o){
    arrayObj.splice($.inArray(count_o,arrayObj),1)
//  不知道数组下标情况下删除指定的元素值　数组对象.splice($.inArray("删除元素",数组对象),"个数")
    console.log(arrayObj)
    p=ary(arrayObj)
    $("#count_n").text("￥"+String(p))
    $("#count_o").text("￥"+String(parseFloat(p*1.65).toFixed(2)))
    }

ary=function(arrayObj){
//   由于结果是浮点数jquery中浮点数不可以直接操作
//　 复写浮点数的加减运算
    var item=Number(0)
    var o=Number(0)
    var k=""
    $.each(arrayObj,function(i,j){
    item+=Number(j.toString().split(".")[0])
            o+=Number(j.split(".")[1])
    })
    var i=o/100
    i1=String(i).split(".")[0]

    if(i1==0){
        if(String(i).split(".")[1]==undefined){
            p=parseFloat(String(item)+'.'+"00").toFixed(2)
        }else{
        p=parseFloat(String(item)+'.'+String(i).split(".")[1]).toFixed(2)
        }
    }
    else{
//        将输出结果保留两位小数parseFloat().tofixed
        p=parseFloat(item+Number(i1)+"."+String(i).split(".")[1]).toFixed(2)
    }

    return p

}

$(document).on("click","#co_bu",function(){

            var c=$("#count_n").text()

            swal({
            title: "你当前下单总额为"+c,
            text: "请确定是否购买！",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "rgba(55, 227, 88, 0.8)",
            confirmButtonText: "确定购买！",
            cancelButtonText: "取消购买！",
            closeOnConfirm: false,
            closeOnCancel: false
            },
            function(isConfirm){
            if (isConfirm) {
                swal(
                {title: "购买成功",
                 text: "正在为你跳转到支付页面！",
                 type: "success",
                },
                function(){
                $.ajax({
                    url:"http://127.0.0.1:8000/alipay/",
                    type:"POST",
                    contentType:"application/json",
                    data:JSON.stringify({'data':c.split("￥")[1]}),
                    dataType:"json",
                    success:function(data){
                    if(data.code==200){
                    $.each(obj,function(i,j){
                      store_name=$("#sec").text()
                      window.localStorage.setItem("obj",JSON.stringify(obj))
                      window.localStorage.setItem("storename",JSON.stringify(store_name))
                      window.location.href=data.msg
                        console.log(j)

                    })
                   }
                    }
                   })
                  }
                );

                } else {
                swal("取消！", "已经为你取消订单！",
                "error");
                }
            }
            )
        })

    $('#nav_2 a').mousemove(function () {
            $('#self_info').show();

        })
        $('#nav_2 a').mouseleave(function () {
            $('#self_info').hide();
        })

    $(document).on("click","#co_bu1",function(){
        var c=$("#count_n").text()
        k=window.localStorage.getItem("k")
        console.log(k)
        o=Number(k.split('"')[1].substring(0,1))
        console.log(o)
        i=Number(c.split("￥")[1].split(".")[0])-o
        p=i+"."+c.split(".")[1]
        console.log(c.split(".")[0])
       swal({

            title: "你当前下单总额为"+c,
            text: "使用优惠劵后总额为"+p,
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "rgba(55, 227, 88, 0.8)",
            confirmButtonText: "确定购买！",
            cancelButtonText: "取消购买！",
            closeOnConfirm: false,
            closeOnCancel: false
            },
            function(isConfirm){
            if (isConfirm) {
                swal(
                {title: "购买成功",
                 text: "正在为你跳转到支付页面！",
                 type: "success",
                },
                function(){
                $.ajax({
                    url:"http://127.0.0.1:8000/alipay/",
                    type:"POST",
                    contentType:"application/json",
                    data:JSON.stringify({'data':c.split("￥")[1]}),
                    dataType:"json",
                    success:function(data){
                    if(data.code==200){
                    $.each(obj,function(i,j){
                      store_name=$("#sec").text()
                      window.localStorage.setItem("obj",JSON.stringify(obj))
                      window.localStorage.setItem("storename",JSON.stringify(store_name))
                      window.location.href=data.msg
                        console.log(j)

                    })
                   }
                    }
                   })
                  }
                );

                } else {
                swal("取消！", "已经为你取消订单！",
                "error");
                }
            }
            )












    })
$(function(){
    var k=$("#sec").text()
    var xxx=window.location.href
    console.log(xxx)
    html=""
    $.ajax({
        type:"get",
        url:"http://127.0.0.1:8000/secondary/"+k,
        contentType:"application/json",
        dataType:"json",
        success:function(data){
            if(data.code==200){
            $.each(data.msg,function(i,j){
                html+='<div class="body_1">'
                html+='<img src=/'+j.c_picture+'>'
                html+='<div class=body_2>'
                html+='<ul>'
                html+='<li><span class="bd_2">'+j.c_name+'（力荐）</span></li>'
                html+='<li><span class="y_l">主要原料：'+j.c_material+'</span></li>'
                html+='<li><span class="sales">月售：'+j.c_sales+'</span></li>'
                html+='<li><span id="bd_3">￥</span><span class="j_c">'+j.c_price+'</span></li>'
                html+='</ul>'
                html+='<div class="ll">'
                html+='<button class="add">+</button>'
                html+='<button class="num">添加到购物车</button>'
                html+='<button class="reduce">-</button>'
                html+='</div>'
                html+='</div>'
                html+='</div>'
            })
            $(".body_1").html(html)
            }
        }
        })

        $("#commentPage").on('click',function(){
            var username = window.localStorage.getItem('users')
            var shopname = window.localStorage.getItem('storename')
            $.ajax({
                type:'get',
                url:'/message/'+shopname,
//                data:{'username':username},
                success:function(result){
                    if(result.code==200){
                        html='<div id="myComment">';
                            html+='<div id="commentBox">';
                                html+='<div id="comments">';
                                   $.each(result.data,function(i,obj){
                                   html+='<div class="oneComment">';
                                            html+='<div class="cUser">';
                                                html+='<a href="#" class="cAvatar"></a>';
                                                html+='<a href="#" class="cUsername">'+ obj.publisher+':'+'</a>';
                                            html+='</div>';
                                            html+='<p class="commentArea">'+ obj.content +'</p>';
//                                            html+='<div class="commentRes">';
//                                                html+='<h4>商家回复:</h4>';
//                                                html+='<p class="resContent">好的,谢谢</p>';
//                                            html+='</div>';
                                        html+='</div>';
                                   })

                                html+='</div> ';
                            html+='</div>';
                           html+='<div id="releaseBox">';
                                html+='<div class="myrelease">';
                                   html+='<span>发表评论:</span>';
                                    html+='<div id="editor"></div>';
                                   html+='<button class="releaseBtn">发表</button>';
                               html+='</div>';
                            html+='</div>';
                        html+='</div>';
                        $(".body_1").html(html)
                        var E = window.wangEditor
                        editor = new E('#editor')
                        editor.create()

                        $('.releaseBtn').on('click', function(){

                          var content_text = editor.txt.text()
                          var content = editor.txt.html()


                          var post_data = {'content':content,'user':username}

                          $.ajax({
                          // 请求方式
                          type:"post",
                          // contentType
//                          contentType:"application/json",
                          // dataType
                          dataType:"json",
                          // url
                          url:"http://127.0.0.1:8000/message/" + shopname,
                          // 把JS的对象或数组序列化一个json 字符串
                          data:JSON.stringify(post_data),
                          // result 为请求的返回结果对象
                          success:function (result) {
                              if (200 == result.code){
                                    swal({
                                    title:"发布成功！",
                                    type: "success",
                                    showCancelButton: true,
                                    confirmButtonColor: "rgba(55, 227, 88, 0.8)",
                                    },
                                    function(isConfirm){
                                    if (isConfirm) {
                                         window.location.href =  xxx
                                        } else {
                                        swal("取消！", "已经为你取消订单！",
                                        "error");
                                        }
                                    }
                                    )
                                       }else{
                                                          alert(result.error)
                                                      }
                                                   }
                                                 })
                                            })
                        //
                        //
                                            }

                                        },
                                    })

                                })

                            })



//<div id="myComment">
//        <div id="commentBox">
//            <div id="comments">
//                <div class="oneComment">
//                    <div class="cUser">
//                            <a href="" class="cAvatar"></a>
//                            <a href="" class="cUsername">用户名</a>
//                    </div>
//                    <p class="commentArea">kdflaksfhgKSDFLKSDfjAH暗示健康都嘎哈是解放和高科技啊山东干即可哈时间肯定会给DFJJSDhflksdfhlksdnvgkshdlgjkh</p>
//                    <div class="commentRes">
//                        <h4>商家回复:</h4>
//                        <p class="resContent">好的</p>
//                    </div>
//                 </div>
//            </div>
//        </div>
//        <!-- 发表评论 -->
//        <div id='releaseBox'>
//            <div class="myrelease">
//                <span>发表评论:</span>
//                <div id="editor">
//
//                </div>
//                <button>发表</button>
//            </div>
//        </div>
//    </div>




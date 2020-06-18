        var keyWords = [];
        var txt = document.getElementById('i_1')
        var btn = document.getElementById('s_1')
        var box = document.getElementById('md_s')
        console.log(btn.value)
        console.log(txt.value)
        //先获取文本框,添加键盘抬起事件
        txt.onkeyup = function () {
        var dv = document.getElementById('dv')
//        待优化
         $.ajax({
//       请求方式
            type:"get",
    //        请求头
            contentType:"application/json",

            dataType:"json",
    // 把JS的对象或数组序列化一个json 字符串!!
    //        data:JSON.stringify(post_data),
            url:"http://127.0.0.1:8000/index/"+"s"+"/display",
            success:function(data){
                if(data.code==200){

                 console.log(data.msg)
                 keyWords=data.msg
             }
           },

    })





            if (dv) {
                //删除
                box.removeChild(dv);
            }
            //获取文本框中的值在数组中是否存在
            var tempArr = [];//临时数组(只存储文本框在数组中存在的内容)
            var text = this.value;//文本框的内容
            for (var i = 0; i < keyWords.length; i++) {
                if (keyWords[i].indexOf(text) == 0) {//证明用户输入的字符串在数组的某个元素的字符串的最开始出现了
                    tempArr.push(keyWords[i]);
                }
            }
            console.log(tempArr)

            console.log(txt.value)
            //如果文本框为空,或者临时数组无数组,则移除创建的div
            if (txt.value.length == "" || tempArr.length == 0) {
                if (dv) {
                    //移除
                    box.removeChild(dv);
                }
                return;
            }

            //创建div,把div加入到id为box的div中
            var dvObj = document.createElement("div");
            dvObj.id = "dv";//为创建的div添加一个id属性
            box.appendChild(dvObj);
            //设置样式
            dvObj.style.width = "350px";
            // dvObj.style.height="150px";
            dvObj.style.border = "1px solid #aaa";
            //遍历临时数组,取出里面的数据
            for (var i = 0; i < tempArr.length; i++) {
                //创建p
                var pObj = document.createElement("p");
                //加到新的div中
                dvObj.appendChild(pObj);
                pObj.className = 'p1';
                pObj.innerHTML = tempArr[i];
                pObj.style.margin = "0";
                pObj.style.marginTop = "3px";
                pObj.style.height = "24px";
                pObj.style.fontFamily = "微软雅黑";
                pObj.style.cursor = "pointer";
                pObj.style.fontSize = "19px";
                pObj.style.zIndex="10000";
                pObj.style.position="relative";
                pObj.style.color="rgba(93, 13, 223, 0.979)";
                pObj.style.fontWeight="650";
//                pObj.style.backgroundColor="white";

            }

            var elements = document.getElementsByClassName('p1');
            Array.prototype.forEach.call(elements, function (element) {
                element.onmouseover = function () {
                    this.style.backgroundColor = "yellow";
                };
                element.onmouseout = function () {
                    this.style.backgroundColor = "";
                };
                element.onclick = function () {

                    txt.value = this.innerText
                    console.log(this.innerText)
                    var dv1 = document.getElementById('dv')
                    box.removeChild(dv1);
                }

            });



        };

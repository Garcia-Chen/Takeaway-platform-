 var $pro=$("#pro")
            var $dn=$("#dn")
            var $status=$("#status")

            $(function()
            {console.log($pro.val())})
            var taskId=setInterval(function(){
               var k=$pro.val();
               k++;
               $pro.val(k);
               if(k>=100){
                $pro.val(0)
               }
            },20)

    var $all=$("#all");

    var i=0;
    var taskId=setInterval(function(){
       if (i%2==0) {
        $all.css( {"transform": "scale(1.5)"})
       }else{
        $all.css( {"transform": "scale(0.8)"})
       }
       i++
        },200)


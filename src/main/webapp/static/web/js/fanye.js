$(".slider").on("click",function(){
        // console.log($(".slider").length);
        var index=$(this).index();
        $(this).css('z-index',1);
        if(index<$(".slider").length-1){
            $(this).next().css('z-index',10);
        }else if(index=$(".slider").length-1){
            $(".slider_one").css('z-index',10);
        }
        if(index<$(".slider").length-1){
        $(this).animate({
              left:"500px"
        },1000);
        $(this).next().animate({
              left:"0"
        },1000);
        }else if(index=$(".slider").length-1){
            // console.log(1);
        $(this).animate({
              left:"500px"
        },1000);
        $(".slider_one").animate({
              left:"0"
        },1000);
        }
    })
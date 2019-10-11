/**
 * 
 */


$(document).ready(function(){
$(".slide-wrap").css({
    	"background":"url(/resources/img/noimg.jpg)", 
    	"background-repeat" : "none", 
    	"background-position":"center",
    	"background-size" : "cover"
    })
    $(".slide-wrap .flex-direction-nav").hide();
	
	var imgList = sendImg();
	var img = imgList.split("||");
	
	for (var w = 0; w < 3; w++) {
	    if (img[w] != 'x') { // 이미지가 있을경우
	    	
	    	$(".slide-wrap").css({
	    		"background":"none"
	    	});
	        $("#img" + eval(w + 1)).attr("src", "/uploadStorage/image" + eval(w + 1) + "/" + img[w]);
	    } else {
	    	$("#img" + eval(w + 1)).attr("src", "/resources/img/noimg.jpg");
	    }
	
	}
	
});
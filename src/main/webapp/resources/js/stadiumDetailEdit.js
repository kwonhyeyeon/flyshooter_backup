/**
 * 
 */

$(document).ready(function() {
	var img1 = $("#img1").val();
	var img2 = $("#img2").val();
	var img3 = $("#img3").val();
	
	// img1
	if(img1 != null || img1 != "") {
		
		var src = "/uploadStorage/image1/" + img1;
		
		$(".preview").show();
    	$("#fileImage1").attr({
    		src : "/uploadStorage/image1/" + img1
    	});
    	
    	var parent = $("#fileImage1").parent();
    	parent.css("background", "url(" + src + ") no-repeat center center").css("background-size", "cover");
        $("#fileImage1").remove();
        
    } else {
    	$(".preview").css("display", "none");
    }
	
	// img2
	if(img2 != null || img2 != "") {
    	
    	var src = "/uploadStorage/image2/" + img2;
		
		$(".preview").show();
    	$("#fileImage2").attr({
    		src : src
    	});
    	
    	var parent = $("#fileImage2").parent();
    	parent.css("background", "url(" + src + ") no-repeat center center").css("background-size", "cover");
        $("#fileImage2").remove();
        
    } else {
    	$(".preview img").remove();
    	$(".preview").css("display", "none");
    }
	
	// img3
	if(img3 != null || img3 != "") {
    	
    	var src = "/uploadStorage/image3/" + img3;
		
		$(".preview").show();
    	$("#fileImage3").attr({
    		src : src
    	});
    	
    	var parent = $("#fileImage3").parent();
    	parent.css("background", "url(" + src + ") no-repeat center center").css("background-size", "cover");
        $("#fileImage3").remove();
        
    } else {
    	$(".preview").css("display", "none");
    }
	
});

// 이미지 프리뷰
$(function() {
    function maskImgs() {
    	 $(".img-wrapper img").imagesLoaded({}, function() {
	        $.each($(".img-wrapper img"), function(index, img) {
	            var src = $(img).attr("src");
	            var parent = $(img).parent();
	            parent.css("background", "url(" + src + ") no-repeat center center").css("background-size", "cover");
	            $(img).remove();
	        });
        });
    }

    var preview = {
        init: function() {
            preview.setPreviewImg();
            preview.listenInput();
        },
        setPreviewImg: function(fileInput) {
            var path = $(fileInput).val();
            var uploadText = $(fileInput).siblings(".file-upload-text");

            if (!path) {
                $(uploadText).val("");
            } else {
                path = path.replace(/^C:\\fakepath\\/, "");
                $(uploadText).val(path);

                preview.showPreview(fileInput, path, uploadText);
            }
        },
        showPreview: function(fileInput, path, uploadText) {
            var file = $(fileInput)[0].files;

            if (file && file[0]) {
                var reader = new FileReader();

                reader.onload = function(e) {
                    var previewImg = $(fileInput).parents(".file-upload-wrapper").siblings(".preview");
                    var img = $(previewImg).find("img");

                    if (img.length == 0) {
                        $(previewImg).html('<img src="' + e.target.result + '" alt=""/>');
                    } else {
                        img.attr("src", e.target.result);
                    }
                	
                    uploadText.val(path);
                    maskImgs();
                };

                reader.onloadstart = function() {
                    $(uploadText).val("uploading..");
                };

                reader.readAsDataURL(file[0]);
            }
        },
        listenInput: function() {
            $(".file-upload-native").on("change", function() {
            	var area = $(this).parents(".file-upload-wrapper").siblings(".preview");
            	area.show();
                preview.setPreviewImg(this);
            });
        }
    };
    preview.init();
});
/**
 * 구장 등록 js
 */
// 등록 버튼 클릭 시 처리 이벤트
// 유효성 체크

function stadiumCheck() {
	
	var re = /^[0-9]{5,6}$/; // 구장요금 정규식
	var re1 = /^[0-9]{1,2}$/; // 수용인원 정규식
	
	
	var sdfee= document.getElementById("s_d_fee");
	var snfee= document.getElementById("s_n_fee");
	var sdfeew= document.getElementById("s_d_fee_w");
	var snfeew= document.getElementById("s_n_fee_w");
	var speople= document.getElementById("s_people");
	
	
	
	// 체크여부
	if(!check(re, sdfee, "평일 주간 요금(5자~6자 이내)을 확인해주세요")){  
		return false;
	}
	if(!check(re, snfee, "평일 야간 요금(5자~6자 이내)을 확인해주세요")){  
		return false;
	}
	if(!check(re, sdfeew, "주말 주간 요금(5자~6자 이내)을 확인해주세요")){  
		return false;
	}
	if(!check(re, snfeew, "주말 야간 요금(5자~6자 이내)을 확인해주세요")){  
		return false;
	}
	if (s_hours.value == "") {
		alert("최소 이용 가능 시간을 선택해주세요");
		return false;
	}
	if(!check(re1, speople, "수용인원을 확인해주세요(2자리이내)")){  
		return false;
	}
	if (s_name.value == "") {
		alert("경기장 이름을 넣어주세요");
		return false;
	}
	
	if (s_size.value == "") {
		alert("경기장 사이즈 선택해주세요");
		return false;
	}
	if (s_in_out.value == "") {
		alert("실내/외 선택해주세요");
		return false;
	}
	

	// file(s_register)type(gif, png, jpg) 제어 -> 이미지1
	if ($("#s_img1").val() != "") {
		var ext = $('#s_img1').val().split('.').pop().toLowerCase();
		if ($.inArray(ext, [ 'gif', 'png', 'jpg' ]) == -1) {
			alert('경기장 사진은 gif, png, jpg 파일만 업로드 가능 \n첫번째 사진을 교체해주세요');
			return false;
		}
	}
	// file(s_account_copy)type(gif, png, jpg) 제어 -> 이미지2
	if ($("#s_img2").val() != "") {
		var ext = $('#s_img2').val().split('.').pop().toLowerCase();
		if ($.inArray(ext, [ 'gif', 'png', 'jpg' ]) == -1) {
			alert('경기장 사진은 gif, png, jpg 파일만 업로드 가능 \n두번째 사진을 교체해주세요');
			return false;
		}
	}
	// file(s_property)type(gif, png, jpg) 제어 -> 이미지3
	if ($("#s_img3").val() != "") {
		var ext = $('#s_img3').val().split('.').pop().toLowerCase();
		if ($.inArray(ext, [ 'gif', 'png', 'jpg' ]) == -1) {
			alert('경기장 사진은 gif, png, jpg 파일만 업로드 가능 \n세번째 사진을 교체해주세요');
			return false;
		}
	}
	
	//check 정규식에 사용
	function check(re, what, message) {
	    if(re.test(what.value)) {
	        return true;
	    }
	    alert(message);
	    what.value = "";
	    what.focus();
	   // return false;
	  
	}
	
}

// 이미지 프리뷰
$(function() {
    function maskImgs() {
        //$(".img-wrapper img").imagesLoaded({}, function() {
	        $.each($(".img-wrapper img"), function(index, img) {
	            var src = $(img).attr("src");
	            var parent = $(img).parent();
	            parent.css("background", "url(" + src + ") no-repeat center center").css("background-size", "cover");
	            $(img).remove();
	        });
       //});
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


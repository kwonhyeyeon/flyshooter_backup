/**
 * 
 */

$(document).ready(function(){
	
	// 리스트 클릭시 상세페이지로 이동.
	$(".list-hover").click(function(){
		var index = $(".list-hover").index(this);
		
		$("#r_no").val($(".list-hover:eq("+index+")").attr("data-num"));
		

		$("#goDetail").attr({
			"method":"post",
			"action":"/user/rental/rentalDetail.do"
		});
			$("#goDetail").submit();
	});
	
	$("#cancleRental").click(function(){
		
		if( refundChk() ){
			
			$("#goUpdate").submit();

		}
		
		
	});
	
	
});


	function refundChk(){
		var total = $("#r_total_pay").val();
		var day = getDay();
		
		if(day < 0){
			alert("지나간 경기는 환불할수 없습니다.");
			return false;
		}else if(day == 0){
			alert("당일 취소는 불가합니다.");
			return false;
		}else if(day == 1){
			total = eval(total/2);
			$("#refund").val(total);
			return confirm(day+"일전 환불시 \n환불금액 : " + total + " 원\n진행하시겠습니까 ?");
		}else if(day > 1 && day < 6){
			total = eval(total * 0.6);
			$("#refund").val(total);
			return confirm(day+"일전 환불시 \n환불금액 : " + total + " 원\n진행하시겠습니까 ?");
		}else if(day > 5 && day < 11){
			total = eval(total * 0.7);
			$("#refund").val(total);
			return confirm(day+"일전 환불시 \n환불금액 : " + total + " 원\n진행하시겠습니까 ?");
		}else if(day >= 11){
			$("#refund").val(total);
			return confirm(day+"일전 환불시 \n환불금액 : " + total + " 원\n진행하시겠습니까 ?");
		}
			
			alert("환불이 불가합니다. \n관리자에게 문의하십시오.");
			return false;
	}


	function getNow(){
		 var now = new Date();

	      var year= now.getFullYear();
	      var mon = (now.getMonth()+1)>9 ? ''+(now.getMonth()+1) : '0'+(now.getMonth()+1);
	      var day = now.getDate()>9 ? ''+now.getDate() : '0'+now.getDate();
	              
	      var chan_val = year + '-' + mon + '-' + day;
	      
	      return chan_val;
	}
	
	function getDay(){
		var reserveDate = $("#r_reserve_date").val();
		var now = getNow();
		
		var res = reserveDate.split("-");
		var nd = now.split("-");
		
		var stDate = new Date(nd[0], (nd[1]-1), nd[2]);
	    var endDate = new Date(res[0], (res[1]-1), res[2]);
	    
	    var btMs = endDate.getTime() - stDate.getTime();
	    var btDay = btMs / (1000*60*60*24) ;
	 
	    return btDay;
	}
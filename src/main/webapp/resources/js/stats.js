/**
 * 
 * 
 */

window.onload = function () {
	
	
		/* 탭 관련 스크립트 */
	    $(".tab-content").hide();
	    $(".tab-content:first").show();
	
	    $("ul.tabs li").click(function () {
	        $("ul.tabs li").removeClass("active").css("color", "#333");
	        //$(this).addClass("active").css({"color": "darkred","font-weight": "bolder"});
	        $(this).addClass("active").css("color", "darkred");
	        
	        $(".tab-content").hide();
	        
	        var activeTab = $(this).attr("rel");
	        
			// 대관건수이며 전체구장일경우에만 실행.. (비동기로 했어야 하는데 통계늘릴걸 생각 못했기에 복잡해짐)
	        if( activeTab == 'tab1'){
						$("#selectedYear").val($("#year").val());
						// 선택된 구장에 등록된 경기장 통계를 가져오는 함수
						$("#search").attr({
							"method":"get",
							"action":"/mypage/stats.do"
						});
						$("#search").submit();
						
						return;
	        }
	        $("#" + activeTab).fadeIn();
	    });
	    /* 탭 관련 스크립트 */
	    
	    
	
	
	var index = sendIndex();
	if(sendYear()){
		$("#year").val(sendYear());
	}
	
	if(index){
	var column = [];
	var arr = [];
	var statisics = sendParam().split(",");
	
	
	column = makeColumnList(statisics);
	arr =  makeStatisics(statisics);
	
	drawChart(arr, column,  "구장별 대관현황", index);
	salesChart();
	}else{
		alert("조회된 구장이 없습니다.");
		location.href = "./";
	}
	
	$("#year").change(function(){
		
		var selected = $("#placeBox").val();
		
		if( selected != "전체구장" ) {
			
			getStadiumStatis();
			selectedPlaceChart();
			
			return;
		}
			if( $('#tab1').is(':visible') ){
				// 연도별 검색
				$("#selectedYear").val($("#year").val());
				
				$("#search").attr({
					"method":"get",
					"action":"/mypage/stats.do"
				});
					$("#search").submit();
					return; 
			}
		// 전체구장일경우 매출통계
		salesChart();
		return;
			
	});
	
	// 구장을 선택했을경우 비동기.
	$("#placeBox").change(function(){
		
		
		var selected = $("#placeBox").val();
		
			
			// 전체구장이 선택되고 탭1이 show일경우 submit실행.
			if( selected == "전체구장" ) {
				if( $('#tab1').is(':visible') ){
					
					$("#selectedYear").val($("#year").val());
					// 선택된 구장에 등록된 경기장 통계를 가져오는 함수
					$("#search").attr({
						"method":"get",
						"action":"/mypage/stats.do"
					});
					$("#search").submit();
					
					return;
				}
			}

			// 전체구장일경우 매출통계
			if( selected == "전체구장" ) {
				salesChart();
				return;
			}
			
			// 선택된 구장에 등록된 경기장 통계를 가져오는 함수
			getStadiumStatis();
			selectedPlaceChart();
			return;
			
		
		
		
	});
	
	
	
}

function selectedPlaceChart(){
	var stvo = {
			p_num : $("#placeBox").val(),
			year : $("#year").val()
			};
	
	
	$.ajax({
		type:"post",
		url:"/mypage/selectedPlaceSales.do",
		data:stvo,
		error: function() {
			 alert($("#placeBox option:selected").text() + "통계조회에 실패하였습니다. \n잠시후 다시 시도해주십시오.");
		},
		success:function(result){
			
			if(result == "Empty"){
				alert("조회된 데이터가 없습니다.");
				return;
			}
			barChart(result, $("#placeBox option:selected").text() + "의 " + $("#year").val() + "년 <경기장별> 매출");
		        
		}
		
	});
}

function salesChart() {
	
	var stvo = {
			p_num : $("#placeBox").val(),
			year : $("#year").val()
			};
	
	
	$.ajax({
		type:"post",
		url:"/mypage/allPlaceSalesStatis.do",
		data:stvo,
		error: function() {
			 alert($("#placeBox option:selected").text() + "통계조회에 실패하였습니다. \n잠시후 다시 시도해주십시오.");
		},
		success:function(result){
			
			if(result == "Empty"){
				alert("조회된 데이터가 없습니다.\n로그인상태를 확인해 주십시오.");
				return;
			}
			
			barChart(result, $("#year").val()+"<전체구장> 매출");
		         
		}
		
	});
}


	function barChart(salesList, title){
		
		var place = salesList.split("@@");
		
		var col = [];
		var arr2 = [];
		col.push("");
		for(var q = 0; q < place.length-1; q++){
			var name = place[q].split("!!");
			col.push(name[0]);
		}
		for( var w = 0; w <= 11; w++ ){
			
			
			var argument ="['" + eval(w+1) + "월'";
			var sum = 0;
			
			for( var q = 0; q < place.length-1; q++ ){
				
				var argu = place[q].split("!!");
				
				sum += eval(argu[w+1]);
				
				argument += ','+argu[w+1];
			
			}
			argument += ',' + sum + ']';
			arr2.push(argument);
		}
		
		col.push('합계');
		
		 var data = google.visualization.arrayToDataTable([
	          col,
	          eval(arr2[0]),
	          eval(arr2[1]),
	          eval(arr2[2]),
	          eval(arr2[3]),
	          eval(arr2[4]),
	          eval(arr2[5]),
	          eval(arr2[6]),
	          eval(arr2[7]),
	          eval(arr2[8]),
	          eval(arr2[9]),
	          eval(arr2[10]),
	          eval(arr2[11]),
	        ]);

	        var options = {
	        
	        chart: {
	            title: title,
	            /* subtitle: 'in millions of dollars (USD)' */
	          },
	          vAxis: {
	        	  format: 'decimal',
	              viewWindowMode:'explicit',
	              viewWindow: {
	                  min: 0
	              }
	             },
	             width: 750,
	             height: 550,
	          
	        };

	        var chart = new google.charts.Bar(document.getElementById('columnchart_material'));

	        chart.draw(data, google.charts.Bar.convertOptions(options));
	        
		
	
	
}

function getStadiumStatis(){
	var stadiumStatis = [];
	
	var stvo = {
			p_num : $("#placeBox").val(),
			year : $("#year").val()
			};
	
	
	// 선택된 경기장의 시간조회 비동기 처리
	$.ajax({
		type:"post",
		url:"/mypage/stadiumStats.do",
		data:stvo,
		error: function() {
			 alert($("#placeBox option:selected").text() + "통계조회에 실패하였습니다. \n잠시후 다시 시도해주십시오.");
		},
		success:function(result){
			
			if(result == "Empty"){
				alert("등록된 경기장이 없습니다.");
				return;
			}
			var str = result.slice(0,-2);
			stadiumStatis = str.split("@@");
			
			column = makeColumnList(stadiumStatis);
			arr =  makeStatisics(stadiumStatis);
			
			drawChart(arr, column, $("#placeBox option:selected").text(), stadiumStatis.length);
		}
		
	});
}


function drawChart(arr, column, title, index) {
	
    var data = new google.visualization.DataTable();
		data.addColumn('string', '');
		
		for(var q = 0; q < index; q++){
			data.addColumn('number', column[q]);
		}
		
		
	    data.addRows([
	     	eval(arr[0]),
	       	eval(arr[1]),
	       	eval(arr[2]),
	       	eval(arr[3]),
	       	eval(arr[4]),
	       	eval(arr[5]),
	       	eval(arr[6]),
	       	eval(arr[7]),
	       	eval(arr[8]),
	       	eval(arr[9]),
	       	eval(arr[10]),
	       	eval(arr[11]),
	      ]);
		

    var options = {
      chart: {
        title:  $("#year").val() + "년 " + title,
        /* subtitle: 'in millions of dollars (USD)' */
      },
      vAxis: {
    	  format: 'decimal',
          viewWindowMode:'explicit',
          viewWindow: {
              min: 0,
              max: 1000
          },
      },
      width: 750,
      height: 550,
      axes: {
        x: {
          0: {side: 'bottom'}
        }
      }

    };

    var chart = new google.charts.Line(document.getElementById('line_top_x'));

    chart.draw(data, google.charts.Line.convertOptions(options));
  }
	
	
// 통계시 컬럼 리스트
 	function makeColumnList(statisics){
 		
 		var colList = [];
 		
 		for( var i = 0; i < statisics.length; i++ ){
 			var splits = statisics[i].split("!!");
 			colList.push(splits[0]);
 		}
 		return colList;
 	}	

 	// 통계시 월별 값을 배열로 변환
 	function makeStatisics(statisics){
 		
 		var arg = [];
 		
 		for( var i = 0; i < 12; i++ ){
 			var param = "['"+(i+1)+"월'";
 			
 			for( var j = 0; j < statisics.length; j++ ){
 				var value = statisics[j].split("!!");
 				
 				param += ", "+value[i+1];	
 			}
 			
 					param += "]";
 				
 			arg.push(param);
 		}
 		
 		return arg;
 	}


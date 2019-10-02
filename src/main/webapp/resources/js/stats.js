/**
 * 
 * 
 */

window.onload = function () {
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
	
	drawChart(arr, column, "구장별 대관현황", index);
	
	}else{
		alert("조회된 구장이 없습니다.");
		location.href = "./";
	}
	
	$("#year").change(function(){
		
		var selected = $("#placeBox").val();
		
		if( selected != "전체구장" ) {
			// 선택된 구장에 등록된 경기장 통계를 가져오는 함수
			getStadiumStatis();
			return;
		}
		
		// 연도별 검색
		$("#selectedYear").val($(this).val());
		$("#search").attr({
			"method":"get",
			"action":"/mypage/stats.do"
		});
			$("#search").submit();
		
	});
	
	// 구장을 선택했을경우 비동기.
	$("#placeBox").change(function(){
		
		var selected = $("#placeBox").val();
		if( selected == "전체구장" ) {
			$("#selectedYear").val($("#year").val());
			// 선택된 구장에 등록된 경기장 통계를 가져오는 함수
			$("#search").attr({
				"method":"get",
				"action":"/mypage/stats.do"
			});
				$("#search").submit();
			
			return;
		}
		
		// 선택된 구장에 등록된 경기장 통계를 가져오는 함수
		getStadiumStatis();
		
		
	});
	
	
	
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
        title: title,
        /* subtitle: 'in millions of dollars (USD)' */
      },
      vAxis: {
    	  title:'대관',
    	  
          viewWindowMode:'explicit',
          viewWindow: {
              min: 0,
              max: 100
          },
      },
      width: 900,
      height: 500,
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


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
	
	
	column = makeColumnList(statisics, index);
	arr =  makeStatisics(statisics, index);
	
	drawChart(arr, column, "구장별 대관현황", index);
	
	}else{
		alert("조회된 구장이 없습니다.");
		location.href = "./";
	}
	
	$("#year").change(function(){
		
		var selected = $("#placeBox").val();
		
		if( selected != "구장선택" ) return;
		
		// 연도별 검색
		$("#selectedYear").val($(this).val());
		$("#search").attr({
			"method":"get",
			"action":"/mypage/stats.do"
		});
			$("#search").submit();
		
	});
	
	
	
}

function drawChart(arr, column, title, index) {
	
	
    var data = new google.visualization.DataTable();
		data.addColumn('number', 'month');
		
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
 			var param = "["+(i+1);
 			
 			for( var j = 0; j < statisics.length; j++ ){
 				var value = statisics[j].split("!!");
 				
 				param += ", "+value[i+1];	
 			}
 				param += "]";
 			arg.push(param);
 		}
 		
 		return arg;
 	}


/**
 * 
 */
window.onload = function () {
		var column = [];
		var arr = [];
		var statisics = sendParam().split(",");
		
		column = makeColumnList(statisics);
		arr =  makeStatisics(statisics);
		
		drawChart(arr, column, "현황 통계 그래프");

}

function drawChart(arr, column, title) {
	
    var data = new google.visualization.DataTable();
		data.addColumn('string', '');
		
		for(var q = 0; q < 1; q++){
			data.addColumn('number', '값');
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

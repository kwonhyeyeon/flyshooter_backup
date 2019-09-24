<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>경기장/구장 페이지</title>
<script src="http://code.jquery.com/jquery.min.js"></script>

<script type="text/javascript" src="/resources/js/stats.js"></script>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery.min.js"></script>
<!-- google charts -->
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>


</head>
<body>
	<div id="wrapper">
		<div>
			<c:choose>
				<c:when test="${not empty placeChoice}">
					<select name="placeChoice" id="placeChoice">
						<option selected value="선택">구장 선택</option>
						<c:forEach var="place" items="${placeChoice}">
							<option value="${place.p_num}">${place.p_name}</option>
						</c:forEach>
					</select>
				</c:when>
				<c:otherwise>
					<p>등록된 구장이 존재하지 않습니다.</p>
					<input type="button" value="구장 등록" id="placeInsert">
				</c:otherwise>
			</c:choose>
		</div>
		<div id="graph">
			<!-- Content -->
			<p>그래프 자리</p>
		</div>
		<h4>사이트 방문자 성별 현황 그래프</h4>

		<div id="Line_Controls_Chart">
			<!-- 라인 차트 생성할 영역 -->
			<div id="lineChartArea" style="padding: 0px 20px 0px 0px;"></div>
			<!-- 컨트롤바를 생성할 영역 -->
			<div id="controlsArea" style="padding: 0px 20px 0px 0px;"></div>
		</div>



	</div>
</body>
<script>
var chartDrowFun = {
		 
	    chartDrow : function(){
	        var chartData = '';
	 
	        //날짜형식 변경하고 싶으시면 이 부분 수정하세요.
	        var chartDateformat     = 'yyyy년MM월dd일';
	        //라인차트의 라인 수
	        var chartLineCount    = 10;
	        //컨트롤러 바 차트의 라인 수
	        var controlLineCount    = 10;
	 
	 
	        function drawDashboard() {
	 
	          var data = new google.visualization.DataTable();
	          //그래프에 표시할 컬럼 추가
	          data.addColumn('datetime' , '날짜');
	          data.addColumn('number'   , '남성');
	          data.addColumn('number'   , '여성');
	          data.addColumn('number'   , '전체');
	 
	          //그래프에 표시할 데이터
	          var dataRow = [];
	 
	          for(var i = 0; i <= 29; i++){ //랜덤 데이터 생성
	            var total   = Math.floor(Math.random() * 300) + 1;
	            var man     = Math.floor(Math.random() * total) + 1;
	            var woman   = total - man;
	 
	            dataRow = [new Date('2017', '09', i , '10'), man, woman , total];
	            data.addRow(dataRow);
	          }
	 
	 
	            var chart = new google.visualization.ChartWrapper({
	              chartType   : 'LineChart',
	              containerId : 'lineChartArea', //라인 차트 생성할 영역
	              options     : {
	                              isStacked   : 'percent',
	                              focusTarget : 'category',
	                              height          : 500,
	                              width              : '100%',
	                              legend          : { position: "top", textStyle: {fontSize: 13}},
	                              pointSize        : 5,
	                              tooltip          : {textStyle : {fontSize:12}, showColorCode : true,trigger: 'both'},
	                              hAxis              : {format: chartDateformat, gridlines:{count:chartLineCount,units: {
	                                                                  years : {format: ['yyyy년']},
	                                                                  months: {format: ['MM월']},
	                                                                  days  : {format: ['dd일']},
	                                                                  hours : {format: ['HH시']}}
	                                                                },textStyle: {fontSize:12}},
	                vAxis              : {minValue: 100,viewWindow:{min:0},gridlines:{count:-1},textStyle:{fontSize:12}},
	                animation        : {startup: true,duration: 1000,easing: 'in' },
	                annotations    : {pattern: chartDateformat,
	                                textStyle: {
	                                fontSize: 15,
	                                bold: true,
	                                italic: true,
	                                color: '#871b47',
	                                auraColor: '#d799ae',
	                                opacity: 0.8,
	                                pattern: chartDateformat
	                              }
	                            }
	              }
	            });
	 
	            var control = new google.visualization.ControlWrapper({
	              controlType: 'ChartRangeFilter',
	              containerId: 'controlsArea',  //control bar를 생성할 영역
	              options: {
	                  ui:{
	                        chartType: 'LineChart',
	                        chartOptions: {
	                        chartArea: {'width': '60%','height' : 80},
	                          hAxis: {'baselineColor': 'none', format: chartDateformat, textStyle: {fontSize:12},
	                            gridlines:{count:controlLineCount,units: {
	                                  years : {format: ['yyyy년']},
	                                  months: {format: ['MM월']},
	                                  days  : {format: ['dd일']},
	                                  hours : {format: ['HH시']}}
	                            }}
	                        }
	                  },
	                    filterColumnIndex: 0
	                }
	            });
	 
	            var date_formatter = new google.visualization.DateFormat({ pattern: chartDateformat});
	            date_formatter.format(data, 0);
	 
	            var dashboard = new google.visualization.Dashboard(document.getElementById('Line_Controls_Chart'));
	            window.addEventListener('resize', function() { dashboard.draw(data); }, false); //화면 크기에 따라 그래프 크기 변경
	            dashboard.bind([control], [chart]);
	            dashboard.draw(data);
	 
	        }
	          google.charts.setOnLoadCallback(drawDashboard);
	 
	      }
	    }
	 
	$(document).ready(function(){
	  google.charts.load('current', {'packages':['line','controls']});
	  chartDrowFun.chartDrow(); //chartDrow() 실행
	});

</script>


</html>
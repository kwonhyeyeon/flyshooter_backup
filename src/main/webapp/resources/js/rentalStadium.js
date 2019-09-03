/**
 * 
 */
$(document).ready(function(){
	var h_start = $('#holiday_start').val();
	var h_end = $('#holiday_end').val();
	var p_holiday = $('#holiday').val();
	var arr = holiDay();
	
				$("#datepicker").datepicker({
	               dateFormat : 'yy-mm-dd',
	               prevText : '이전 달',
	               nextText : '다음 달',
	               showOtherMonths : false //빈 공간에 현재월의 앞뒤월의 날짜를 표시
	               ,
	               showMonthAfterYear : true//년도 먼저 나오고, 뒤에 월 표시
	               ,
	               monthNamesShort : [ '1', '2', '3', '4', '5', '6', '7', '8',
	                     '9', '10', '11', '12' ] //달력의 월 부분 텍스트
	               ,
	               monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
	                     '8월', '9월', '10월', '11월', '12월' ] //달력의 월 부분 Tooltip 텍스트
	               ,
	               dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ] //달력의 요일 부분 텍스트
	               ,
	               dayNames : [ '일요일', '월요일', '화요일', '수요일', '목요일', '금요일',
	                     '토요일' ] //달력의 요일 부분 Tooltip 텍스트
					,
					minDate : 1
					,
					maxDate : "+1M"
					,
					constrainInput : false
					,
					beforeShowDay : disableSomeDay
					
				});		
					
				// 휴업시작일과 영업재개일 사이 기간을(Date) 구하여 리턴함.
				function dayCount(){
					
					var cnt = dateSplit(h_end, -1).getTime() - dateSplit(h_start, -1).getTime();
					
					return Math.floor(cnt / (24 * 60 * 60 * 1000));
				}
				
				// 휴업시작일부터 영업재개일동안의 1일단위 날짜 구하여 배열로 리턴
				function holiDay(){
					var arr = [];
					for(var i = 0; i < dayCount(); i++){
						arr[i] = dateSplit(h_start, i);
					}
					return arr;
				}
				

				//날짜를 나타내기 전에(beforeShowDay) 실행할 함수
				function disableSomeDay(date){
					var month = date.getMonth();
					var dates = date.getDate();
					var year = date.getFullYear();
					
					// 배열에 해당하는 날짜는 0번째 index에 false를 담아 리턴해준다.
					for(i = 0; i < arr.length; i++){
						if( ($.inArray( year + '-' + ( month + 1 ) + '-' + dates, arr ) != -1) ){
							return [false];
						}
					}
					
					return [date.getDay() != p_holiday, ''];
				}
				
				
				function dateSplit(arg, type){
					var param = arg.split('-');
					if( type == -1 ){
					return new Date( param[0], eval(param[1]-1), param[2] );
				}
					var argu = new Date( param[0], param[1], param[2]);
					argu.setMonth( eval( argu.getMonth() - 1 ) );
					argu.setDate( argu.getDate() + type );
					argu.setMonth( eval( argu.getMonth() + 1 ));
					return argu.getFullYear() + "-" + argu.getMonth() + "-" + argu.getDate() ;
				}
				
});


				

		



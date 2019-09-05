/**
 * 구장 등록 js
 */
function div_OnOff(v,id){
	//라디오 버튼 value값 조건 비교
	if(v == "1"){
		document.getElementById(id).style.display = "";//보여줌
	}else{
		document.getElementById(id).style.display = "none"; //숨김
	}
	
}
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FLY SHOOTER</title>
<link rel="stylesheet" href="/resources/css/reset.css" />
<link rel="stylesheet" href="/resources/css/style.css" />
<script src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="/resources/js/stadiumDetailEdit.js"></script>
<script type="text/javascript" src="/resources/js/common.js"></script>
</head>
<body>

	<div id="wrapper">
		
		<jsp:include page="../templates/header.jsp" flush="true" />
		
		<article id="contents">
			<h2 class="articleTit">${svo.s_name} 경기장 상세 정보 및 수정</h2>
		
			<form id="s_stadiumModifyForm" action="/mypage/stadiumModify.do" method="post" enctype="multipart/form-data">
				<input type="hidden" id="img1" value="${s_img1}" />
				<input type="hidden" id="img2" value="${s_img2}" />
				<input type="hidden" id="img3" value="${s_img3}" />
				<input type="hidden" id="s_no" name="s_no" value="${svo.s_no}" />
				<input type="hidden" id="s_name" name="s_name" value="${svo.s_name}" />
				
				<table class="detailTbl">
					<tr>
						<th>경기장 사이즈</th>
						<td>
							<select name="s_size" class="s_size" id="s_size">
								<option value="1">40*20</option>
								<option value="2">33*21</option>
								<option value="3">15*12</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>경기장 실내 / 외 선택</th>
						<td>
							<select name="s_in_out" class="s_in_out" id="s_in_out">
								<option value="1">실내</option>
								<option value="2">실외</option>
							</select>
						</td>
					</tr>
					
					<tr>
						<td colspan="2" class="blank"></td>
					</tr>
					
					<tr>
						<th rowspan="5">날짜 별 요금</th>
						<td class="feeArea">
							<p>입력된 요금은 1시간 기준 요금이며 최소 시간을 2시간 선택하여도 변하지 않습니다</p>
						</td>
					</tr>
					<tr>
						<td class="feeArea">
							<label>평일 주간 요금</label>
							<input type="text" value="${svo.s_d_fee}" name="s_d_fee" id="s_d_fee"/>
						</td>
					</tr>
					<tr>
						<td class="feeArea">
							<label>평일 야간 요금</label>
							<input type="text" value="${svo.s_n_fee}" name="s_n_fee" id="s_n_fee"/>
						</td>
					</tr>
					<tr>
						<td class="feeArea">
							<label>주말 주간 요금</label>
							<input type="text" value="${svo.s_d_fee_w}" name="s_d_fee_w" id="s_d_fee_w"/>
						</td>
					</tr>
					<tr>
						<td class="feeArea last">
							<label>주말 야간 요금</label>
							<input type="text" value="${svo.s_n_fee_w}" name="s_n_fee_w" id="s_n_fee_w"/>
						</td>
					</tr>
					<tr>
						<th>최소 이용 가능 시간</th>
						<td>
							<select name="s_hours" id="s_hours">
								<option value="1">1시간</option>
								<option value="2">2시간</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>수용 인원</th>
						<td><input type="text" value="${svo.s_people}" name="s_people" id="s_people"/></td>
					</tr>
					
					<tr>
						<td colspan="2" class="blank"></td>
					</tr>
					
					<tr>
						<th>경기장 상태</th>
						<td>
							<c:if test="${svo.s_status ne '0'}">
								<select name="s_status" id="s_status">
									<option value="-1">CLOSE</option>
									<option value="1">OPEN</option>
								</select>
							</c:if>
						</td>
					</tr>
					
					<tr>
						<th>경기장 이미지 1</th>
						<td>
							<div class="file-upload-wrapper">
			                	<input type="file" id="s_img1" name="file1" class="file-upload-native" accept="image/*" />
			                	<input type="text" class="file-upload-text" placeholder="이미지 찾기" disabled />
			                </div>
			                <div class="preview img-wrapper"><img id="fileImage1" src="" alt="" /></div>
						</td>
					</tr>
					<tr>
						<th>경기장 이미지 2</th>
						<td>
							<div class="file-upload-wrapper">
			                	<input type="file" id="s_img2" name="file2" class="file-upload-native" accept="image/*" />
			                	<input type="text" class="file-upload-text" placeholder="이미지 찾기" disabled />
			                </div>
			                <div class="preview img-wrapper"><img id="fileImage2" src="" alt="" /></div>
						</td>
					</tr>	
					<tr>
						<th>경기장 이미지 3</th>
						<td>
							<div class="file-upload-wrapper">
			                	<input type="file" id="s_img3" name="file3" class="file-upload-native" accept="image/*" />
			                	<input type="text" class="file-upload-text" placeholder="이미지 찾기" disabled />
			                </div>
			                <div class="preview img-wrapper"><img id="fileImage3" src="" alt="" /></div>
						</td>
					</tr>		
				</table>
				
				<div class="tblBtnArea space-between">
					<a href="/mypage/placeChoice.do">목록</a>
					<input type="submit" class="modify" value="수정하기">
				</div>

			</form>
		</article>

		<jsp:include page="../templates/footer.jsp" flush="true" />
			
	</div>
</body>
<script type="text/javascript">
	$(document).ready(function() {
	    $("#s_hours").val('${svo.s_hours}');
	    $("#s_size").val('${svo.s_size}');
	    $("#s_in_out").val('${svo.s_in_out}');
	    $("#s_status").val('${svo.s_status}');
	});
</script>
</html>
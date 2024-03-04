<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>

<body>
	<div class="container">
		<div class="text-center"><h3 class="mb-2">대전광역시 문화관광(관광지) 리스트</h3></div>
		<div id="item">
			<div id="item-template">
				<div class="row">
					<h3 class="tour-title"></h3>
					<table class="table table-striped">
						<tbody>
							<tr>
								<td class="col-md-2">관광지명</td>
								<td class="col-md-4 tour-name"></td>
								<td class="col-md-2">문의처</td>
								<td class="col-md-4 tour-phone"></td>
							</tr>
							<tr>
								<td>관광지 우편번호</td>
								<td class="tour-zipcode"></td>
								<td>관광지 상세주소</td>
								<td class="tour-address"></td>
							</tr>
							<tr>
								<td>운영시간</td>
								<td class="tour-time"></td>
								<td>관광지 이용 금액</td>
								<td class="tour-amount"></td>
							</tr>
							<tr>
								<td>주차 시설</td>
								<td class="tour-parking"></td>
								<td>편의 시설 안내</td>
								<td class="tour-facilities"></td>
							</tr>
							<tr>
								<td>관광지 요약</td>
								<td colspan="3" class="tour-content"></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		const template = (result) => {
			let $div = $('#item');
			
			let $element = $('#item-template').clone().removeAttr('id');
			$element.find('.tour-title').html(result.tourspotNm);
			
			$element.find('.tour-name').html(result.tourspotNm);
			
			$element.find('.tour-phone').html(result.refadNo);
			$element.find('.tour-zipcode').html(result.tourspotZip);
			$element.find('.tour-address').html(result.tourspotDtlAddr);
			$element.find('.tour-time').html(result.mngTime);
			$element.find('.tour-amount').html(result.tourUtlzAmt);
			$element.find('.tour-parking').html(result.pkgFclt);
			$element.find('.tour-facilities').html(result.cnvenFcltGuid);
			$element.find('.tour-content').html(result.tourspotSumm);
			
			/* $element.find('.tour-map').attr({
				"lat":result.mapLat,
				"lng":result.mapLot
			}); */
			
			$div.append($element);
		}
		
		$(function(){
			const url = "/data/daejeonTourList";
			$.getJSON(url, function(data){
				$(data.response.body.items).each(function(index){
					let value = {
							"tourspotNm":this.tourspotNm,
							"refadNo":this.refaNo,
							"tourspotZip":this.tourspotZip,
							"tourspotAddr":this.tourspotAddr,
							"mngTime":this.mngTime,
							"tourUtlzAmt":this.tourUtlzAmt,
							"pkgFclt":this.pkgFclt,
							"cnvenFcltGuid":this.cnvenFcltGuid,
							"tourspotSumm":this.tourspotSumm
					};
					//console.log(JSON.stringify(value));
					template(value);
				});
			}).fail(function(){
				alert("잠시후에 다시 시도해 주세요");
			});
		});
	</script>
</body>
</html>
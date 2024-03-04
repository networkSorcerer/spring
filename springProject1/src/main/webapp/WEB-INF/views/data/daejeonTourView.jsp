<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>

<body>
	<div class="container">
		<div class="text-center"><h3 class="mb-2">대전광역시 문화관광(관광지) 리스트</h3></div>
		
		<div class="container my-5">
			<div class = "p-5 text-center bg-body-tertiary rounded-3">
				<div id="map" style="width: 100%; height: 400px;"></div>
			</div>
		</div>
		
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
							<tr>
								<td class="link-primary tour-map"></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e606ce0c708054c07480dbc81c66db4b"></script>
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
			
			if(result.mapLat != 0.0 && result.mapLot != 0.0) {
				$element.find('.tour-map').attr({
					"lat":result.mapLat,
					"lng":result.mapLot
				});
				$element.find('.tour-map').html("[지도보기]");
			}
			$div.append($element);
		}
		function initMap(lat, lng) {
			const container = document.getElementById('map');
			
			const option = {
					center: new kakao.maps.LatLng(lat, lng),
					level: 5
			};
			
			const map = new kakao.maps.Map(container, option);
			
			let mapTypeControl = new kakao.maps.MapTypeControl();
			map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
			
			let zoomControl = new kakao.maps.ZoomControl();
			map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
			
			let marker = new kakao.maps.Marker({
				position: map.getCenter()
			});
			marker.setMap(map);
			
			/* let contentString ='<div style="width:150px; text-align:center;padding:6px 0;">위치</div>';
			let infowindow = new kakao.maps.InfoWindow({
				content: contentString,
				removable: true
			}); */
			
			/* let contentString = '<div class="card" style="width:450px;">';
			contentString += '<h5 class="card-header">' + nm + '</h5>';
			contentString += '<div class="card-body">';
			contentString += ' <p class="card-text text-start">주소: ' + addr + '<br/>Tel: ' + tel + '</p>';
			contentString += '</div>';
			contentString += '</div>';

			let infowindow = new kakao.maps.InfoWindow({
			    content: contentString,
			    removable: true
			});

			
			kakao.maps.event.addListener(marker, 'click', function(){
				infowindow.open(map,marker);
			}); */
			
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
							"tourspotSumm":this.tourspotSumm,
							"mapLat":this.mapLat,
							"mapLot":this.mapLot
					};
					//console.log(JSON.stringify(value));
					template(value);
				});
			}).fail(function(){
				alert("잠시후에 다시 시도해 주세요");
			});
			
			$(document).on("click", ".tour-map", function(){
				let lat = $(this).attr("lat");
				let lng = $(this).attr("lng");
				//console.log(lat, lng);
				initMap(lat, lng);
				/* if(lat != 0.0 && lng != 0.0) {
					initMap(lat, lng);
				}else {
					alert("위도, 경도 정보가 존재하지 않습니다");
				} */
			});
		});
	</script>
</body>
</html>
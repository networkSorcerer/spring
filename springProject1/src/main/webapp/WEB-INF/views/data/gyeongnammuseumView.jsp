<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
<body>
	  <div class="row row-cols-1 row-cols-md-3 mb-3 text-center" id="item">
			<div class="col" id="item-template">
				<div class="card mb-4 rounded-3 shadow-sm border-primary">
					<div class="card-header py-3 text-bg-primary border-primary">
						<h4 class="my-0 fw-normal item-title"></h4>
					</div>
					<div class="card-body">
						<h5 class="card-title pricing-card-title">
							<span class="item-sigungu"></span>
							<small class="text-body-secondary fw-light item-delegatee"></small>
						</h5>
						<ul class="list-unstyled mt-3 mb-4">
							<li class="item-tel"></li>
							<li class="item-homepage"></li>
							<li class="item-roadaddress"></li>
						</ul>
						<button type="button" class="w-100 btn btn-lg btn-primary goURL">사이트로 이동</button>
					</div>
				</div>
			</div>
		</div>
		<script>
			function template(entid, sigungu, title, delegatee, roadaddress, homepage, tel){
				let $div = $('#item');
				let $element = $('#item-template').clone().removeAttr('id');
				$element.find('.item-title').html(title);
				$element.find('.item-sigungu').html(sigungu);
				$element.find('.item-delegatee').html("/" + delegatee);
				$element.find('.item-tel').html(tel);
				$element.find('.item-homepage').html(homepage);
				$element.find('.item-roadaddress').html(roadaddress);
				
				$element.find('.goURL').attr("data-homepage", homepage);
				
				$div.append($element);
			}
			$(function(){
				const url = "/data/gyeongnammuseumList";
				$.getJSON(url, function(data) {
					$(data.gyeongnammuseumList.body.items.item).each(function(intex) {
						let entid = this.entid;
						let sigungu = this.sigungu;
						let title = this.title;
						let delegatee = this.delegatee;
						let roadaddress = this.roadaddress;
						let homepage = this.homepage;
						let tel = this.tel;
						
						template(entid, sigungu, title, delegatee, roadaddress, homepage, tel);
					});
				}).fail(function(){
					alert("잠시후에 다시 시도해 주세요");
				});
				
				$(document).on("click", ".goURL", function(){
					let homepage = $(this).attr("data-homepage");
					//console.log(homepage);
					if(homepage != '-'){
						if(homepage.indexOf("http://") == -1) {
							location.href = "http://" + homepage;
						} else if (homepage.indexOf("http://") == 0) {
							location.href = homepage;
						}
					} else {
						//alert("사이트 url이 존재하지 않습니다");
					}
				});
			});
		</script>
</body>
</html>
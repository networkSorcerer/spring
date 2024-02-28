<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>

	<!-- <link rel="stylesheet" type="text/css" href="/resources/include/css/chungnam.css"/> -->
	<link rel="stylesheet" type="text/css" href="/resources/include/css/lightbox.css"/>
	<link rel="stylesheet" type="text/css" href="/resources/include/css/openapi.css"/>

<body>
	<div class = "container">
		<div class="text-center"><h3 class="mb-2">대전 유기동물 공고</h3></div>
	
	<div class="row mb-2" id="list">
	    <div class="col-md-6" id="media-template">
	      <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
	        <div class="col p-4 d-flex flex-column position-static">
	          <strong class="d-inline-block mb-2 text-primary-emphasis item-place">World</strong>
	          <h3 class="mb-0 item-heading">Featured post</h3>
	          <div class="mb-1 text-body-secondary item-color">Nov 12</div>
	          <p class="card-text mb-auto item-memo">This is a wider card with supporting text below as a natural lead-in to additional content.</p>
	          <a href="#" class="icon-link gap-1 icon-link-hover ">
	            Continue reading
	           <!--  stretched-link<svg class="bi"><use xlink:href="#chevron-right"/></svg> -->
	          </a>
	        </div>
	        <div class="col-auto d-none d-lg-block">
	        <a class="media">
	        	<img class="media-object rounded" width="200" height="250"/>
	        </a>
			<!--<svg class="bd-placeholder-img" width="200" height="250" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>-->	       
 			</div>
	      </div>
	    </div>
	  </div>
	  </div>
	  <script src="/resources/include/js/lightbox.min.js"></script>
	  <script type="text/javascript">
	  function template(animalSeq, age, filePath, species, hairColor, memo, foundPlace, classification){
		let $div = $('#list');
		let $element = $('#media-template').clone().removeAttr('id');
		$element.addClass("animal-list");
		
		let img = "";
		if(filePath != ""){
			img = "http://www.daejeon.go.kr/"+filePath;
			$element.find('.media').attr({
				"href":img,
				"title":species,
				"data-lightbox":"roadtrip"
			});
			$element.find('.media > .media-object').attr("src", img);
		} else {
			//noanimal1.png noanimal2.png
			img = "/resources/images/common/noanimal" + classification + ".png";
			$element.find('.media-object').attr("src", img);
		}
		
		$element.find('.item-place').html(foundPlace);
		$element.find('.item-heading').html(species + "-" + age);
		
		$element.find('.item-color').html(hairColor);
		$element.find('.item-memo').html(memo);
		
		$div.append($element);
	  }
		$(function () {
		    data();
		});

		function data() {
		    $.ajax({
		        url: "/data/animalDaejeonList",
		        type: "get",
		        dataType: "xml",
		        success: function (data) {
		            $(data).find('items').each(function (index) {
		                let animalSeq = $(this).find("animalSeq").text();
		                let age = $(this).find("age").text();

		                let filePath = $(this).find("filePath").text();
		                let hairColor = $(this).find("hairColor").text();

		                let memo = $(this).find("memo").text();
		                let species = $(this).find("species").text();

		                let foundPlace = $(this).find("foundPlace").text();
		                let classification = $(this).find("classification").text();
		                
		                template(animalSeq, age, filePath, species, hairColor, memo, foundPlace, classification)
		            });
		        },
		        error: function(xhr, textStatus, errorThrown) {
		        	alert(textStatus + " (HTTP-" + xhr.status + "/" + errorThrown +")");
		        	}
		        });
			}
		
	  </script>
	</body>

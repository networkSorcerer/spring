function chkData(item, msg) {
	if($(item).val().replace(/\s/g,"")=="") {
		alert(msg + "입력해주세요");
		$(item).val("");
		$(item).focus();
		return false;
	} else {
		return true;
	}
}

function dataCheck(item, out, msg){
	if($(item).val().replace(/\s/g,"")==""){
		$(out).html(msg + " 입력해주세요");
		$(item).val("");
		return false;
	}else {
		return true;
	}
}
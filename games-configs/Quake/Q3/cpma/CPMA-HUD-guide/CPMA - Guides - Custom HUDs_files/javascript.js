function close(ele)
{
	$(ele).closest("table").find("tr").hide();
	$(ele).parent().show();
	$(ele).on("click",function(){
		open(this);
		return false;
	});
}
	
function open(ele)
{
	$(ele).closest("table").find("tr").show();
	$(ele).on("click",function(ev) {
		close(this);
		return false;
	});
}

function updateCarCount(nb)
{
	if(document.getElementById('carCounter') && document.getElementById('textToListen'))
	{
		if(parseInt(document.getElementById('textToListen').value.length) < parseInt(nb))
		{
			document.getElementById('carCounter').textContent = document.getElementById('textToListen').value.length+"/"+nb+" caracters";
		}
		else
		{
			document.getElementById('carCounter').innerHTML = "<span style='color:#990000;font-weight:bold;'>"+document.getElementById('textToListen').value.length+"</span>/"+nb+" caracters";
		}
	}
}

//hidden_menu_X
/*function showSubmenu(id)
{
	$("#hidden_menu_"+id).show();
}

function hideSubmenu(id)
{
	$("#hidden_menu_"+id).hide();
}
*/

function requestPost(ele,attempts) {
	if(ele.data('loaded') == '0') {
		$.get(ele.data("source-url"))
			.done(function(data){
				var contentElem=ele.closest(".minipostBlock").find(".panel-body").first();
				contentElem.html(data);
				ele.data('loaded','1');
				addPostSpoiler(contentElem);
				addObjSpoiler(contentElem);
				initQtip(contentElem);
			})
			.fail(function(data) {
				if(attempts < 3) {
					requestPost(ele,attempts+1);
				} else {
					$(this).closest(".minipostBlock").find(".panel-body").first().html("Failed to load the content.");
				}
			});
	}
}

function closeAllPosts() {
	$(".posts > .minipostBlock").each(function() {
		$(this).find(".minipostcontent").hide();
	});

	$(".miniPostControl").delegate(".openMiniPost","click",function() {
		requestPost($(this),0);
		openPost($(this).closest(".minipostBlock").find(".minipostcontent"));
	});
}

function openPost(ele) {
	ele.show(200);
	$(".miniPostControl").unbind('click');
	$(".miniPostControl").delegate(".openMiniPost","click",function() {
		closePost($(this).closest(".minipostBlock").find(".minipostcontent"));
	});
}

function closePost(ele) {
	ele.hide(200);
	$(".miniPostControl").unbind('click');
	$(".miniPostControl").delegate(".openMiniPost","click",function() {
		requestPost($(this),0);
		openPost($(this).closest(".minipostBlock").find(".minipostcontent"));
	});
}

function addErrors(ele) {
	ele.addClass("has-error");
	ele.find('.form-error').first().addClass("input-error");
	ele.find('div').first().append('<div class="glyphicon glyphicon-remove form-control-feedback"></div>');
}

function addPostSpoiler(ele)
{
	if(ele == -1) {
		ele=$(document);
	}
	ele.find(".tab_spoiler").find("tr").hide();
	ele.find(".tab_spoiler").find("tr th.th_spoiler").parent().show();
	ele.find(".th_spoiler").on("click",function(){
		open(this);
		return false;
	});
	
}

function addObjSpoiler(ele)
{
	if(ele == -1) {
		ele=$(document);
	}
	ele.find(".th_obj_spoiler").closest("table").find("tr").hide();
	ele.find(".th_obj_spoiler").parent().show();
	ele.find(".th_obj_spoiler").on("click",function(){
		open(this);
		return false;
	});
}

function updateObjSpoiler(id,op)
{
	if(!op)
		$("#"+id).find("tr").hide();
	$("#"+id).find(".th_obj_spoiler").parent().show();
	$("#"+id).find(".th_obj_spoiler").on("click",function(){
		open(this);
		return false;
	});
}

function initQtip(ele) {
	if(ele == -1) {
		ele=$(document);
	}
	ele.find('.decoda-smallmap').each(function() { 
	    $(this).qtip({
	        content: {
	            text: $(this).next('div') // Use the "div" element next to this for the content
	        },
	        style: { classes: 'qtip-youtube qtip-shadow' }
	    });
	});
}

$(document).ready(function() {

	initQtip(-1);

	if($(".posts")) {
		closeAllPosts();
	}

	$('.form-error:has(ul)').each(function() {
		addErrors($(this).closest('.form-group'));
	});

	addPostSpoiler(-1);
	addObjSpoiler(-1);
	//hideSubmenu(1);
	
});	
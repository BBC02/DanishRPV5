

window.addEventListener('message', function(event) {
	let item = event.data;

	if (item.response == 'openTarget') {
		$(".target-label").html("");
		
		$('.target-wrapper').show();

		$(".target-eye").css("color", "rgba(66, 66, 66, 0.8)");
	} else if (item.response == 'closeTarget') {
		$(".target-label").html("");

		$('.target-wrapper').hide();
	} else if (item.response == 'validTarget') {
		$(".target-label").html("");

		$.each(item.data, function (index, item) {
			$(".target-label").append("<div class='target-item' id='target-"+index+"'<li><i id='target-icon-" + index + "' class='" + item.icon + " fa-fw fa-pull-left'></i>" + item.label + "</li></div>");
            $("#target-"+index).hover((e)=> {
                $("#target-"+index).css("color",e.type === "mouseenter" ? "rgb(252, 84, 84)" : "white")
                $("#target-icon-"+index).css("color",e.type === "mouseenter" ? "rgb(252, 84, 84)" : "white")
            })
			
			$("#target-"+index+"").css("padding-top", "7px");

			$("#target-"+index).data('TargetData', item);
		});

		$(".target-eye").css("color", "rgba(255, 255, 255, 0.8)");
	} else if (item.response == 'leftTarget') {
		$(".target-label").html("");

		$(".target-eye").css("color", "rgba(66, 66, 66, 0.8)");
	}
});

$(document).on('mousedown', (event) => {
	let element = event.target;
	let split = element.id.split("-")

	if(split[1] === 'icon') {
		split[1] = split[2]
    }
	
	if (split[0] === 'target') {
		$(".target-label").html("");
		$('.target-wrapper').hide();
		switch (event.which) {
			case 1:
				$.post('http://qtarget/selectTarget', JSON.stringify(Number(split[1]) + 1));
			case 3:
				$.post('http://qtarget/closeTarget');
			break;
		}
	}
});

$(document).on('keydown', function(e) {
	if (e.key == 'Escape') {
		$(".target-label").html("");
		$('.target-wrapper').hide();
		$.post('http://qtarget/closeTarget');
	}
});

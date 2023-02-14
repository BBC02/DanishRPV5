
var rgbStart = [139,195,74]
var rgbEnd = [183,28,28]

const formatter = new Intl.NumberFormat('da-DK', {
	style: 'currency',
	currency: 'DKK',
	minimumFractionDigits: 0,
	maximumFractionDigits: 0,
})

$(function(){
	window.addEventListener('message', function(event) {
		if (event.data.action == "setValue"){
			if (event.data.key == "job"){
				setJobIcon(event.data.icon)
			}
			setValue(event.data.key, event.data.value)

		}else if (event.data.action == "updateStatus"){
			updateStatus(event.data.status);
		}else if (event.data.action == "toggle"){
			if (event.data.show){
				$('#ui').show();
			} else{
				$('#ui').hide();
			}
		} else if (event.data.action == "toggleCar"){
			if (event.data.show){
				//$('.carStats').show();
			} else{
				//$('.carStats').hide();
			}
		}else if (event.data.action == "updateCarStatus"){
			updateCarStatus(event.data.status)
		/*}else if (event.data.action == "updateWeight"){
			updateWeight(event.data.weight)*/
		}else if (event.data.action == "boss"){
			if (event.data.value == 'yes') {
				$('#societymoney').show();
			} else {
				$('#societymoney').hide();
			}
		}
	});

});

function updateWeight(weight){
	var bgcolor = colourGradient(weight/100, rgbEnd, rgbStart)
	$('#weight .bg').css('height', weight+'%')
	$('#weight .bg').css('background-color', 'rgb(' + bgcolor[0] +','+ bgcolor[1] +','+ bgcolor[2] +')')
}

function updateCarStatus(status){
	var gas = status[0]
	$('#gas .bg').css('height', gas.percent+'%')
	var bgcolor = colourGradient(gas.percent/100, rgbStart, rgbEnd)
	//var bgcolor = colourGradient(0.1, rgbStart, rgbEnd)
	//$('#gas .bg').css('height', '10%')
	$('#gas .bg').css('background-color', 'rgb(' + bgcolor[0] +','+ bgcolor[1] +','+ bgcolor[2] +')')
}

function setValue(key, value){
	if (key == 'job') {
		$('#'+key+' span').html(value.replace(/^[ -]+/,'').replace(/[ -]+$/,''))
	} else {
		$('#'+key+' span').html(formatter.format(value))
	}
}

function setJobIcon(value){
	$('#job img').attr('src', 'assets/img/jobs/'+value+'.png')
}

function updateStatus(status){
	var hunger = status[0]
	var thirst = status[1]
	var drunk = status[2]
	$('#hunger .bg').css('height', hunger.percent+'%')
	$('#water .bg').css('height', thirst.percent+'%')
	$('#drunk .bg').css('height', drunk.percent+'%');
	if (drunk.percent > 0){
		$('#drunk').show();
	} else{
		$('#drunk').show();
	}
}

function setProximity(value){
	var color;
	var speaker;
	if (value == "whisper"){
		color = "#FFEB3B";
		speaker = 1;
	}else if (value == "normal"){
		color = "#81C784"
		speaker = 2;
	}else if (value == "shout"){
		color = "#e53935"
		speaker = 3;

	}
	$('#voice img').attr('src', 'assets/img/speaker'+speaker+'.png');
}	

function setRadio(value){
	$('.quick-icon2').show()
	$('#radiochannel').text(value)
}

function leaveRadio(){
	$('.quick-icon2').hide()
}

function setTalking(value){
	if (value){
		//#64B5F6
		$('#voice').css('outline', '3px solid #03A9F4')
	}else{
		//#81C784
		$('#voice').css('outline', 'none')
	}
}

function setTalkingRadio(value){
	if (value){
		//#64B5F6
		$('#radio').css('outline', '3px solid #03A9F4')
	}else{
		//#81C784
		$('#radio').css('outline', 'none')
	}
}

function colourGradient(p, rgb_beginning, rgb_end){
    var w = p * 2 - 1;

    var w1 = (w + 1) / 2.0;
    var w2 = 1 - w1;

    var rgb = [parseInt(rgb_beginning[0] * w1 + rgb_end[0] * w2),
        parseInt(rgb_beginning[1] * w1 + rgb_end[1] * w2),
            parseInt(rgb_beginning[2] * w1 + rgb_end[2] * w2)];
    return rgb;
};
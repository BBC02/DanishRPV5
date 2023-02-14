var hasRadio = false
var speaker = 2;

$(document).ready(function () {
    window.addEventListener('message', function (event) {
        if(event.data.action == undefined) {
            onData(event.data);
        }
        if (event.data.action == "enableCrosshair") {
            $("#player-crosshair").css("display", "flex");
        }

        if (event.data.action == "disableCrosshair") {
            $("#player-crosshair").css("display", "none");
        }
        if (event.data.action == "toggleWindow") {
            displayPluginScreen(event.data.display);
            $("#Ts3State").html(event.data.label);

            if(event.data.micStatus) $("#TSMic").html(event.data.micStatus);
            if(event.data.soundStatus) $("#TSSound").html(event.data.soundStatus);
        }
        
        if(event.data.action == 'togglehud') {
            if(event.data.show == true) {
                $("body").css("display", event.data.show = "block");
            } else {
                $("body").css("display", event.data.show = "none");
            }
        } else if(event.data.action == 'updateStatusHud') {
            $("#boxSetHealth").css("width", event.data.health + "%");

            if (event.data.health <= 40.0) {
                if ($("#healthIcon").hasClass("pulse") == false) {
                    $("#healthIcon").addClass("pulse");
                }
            } else {
                if ($("#healthIcon").hasClass("pulse") == true) {
                    $("#healthIcon").removeClass("pulse");
                }
            }

            $("#boxSetArmour").css("width", event.data.armour + "%");
        } else if(event.data.action == 'updateVehicleHud') {
            $("#vehicleHud").css("display", event.data.pedInVeh ? "block" : "none");
            
            $("#clock").text(event.data.time);
            $("#speed").text(event.data.speed);
            $("#fuel").text(event.data.fuel + " %");
            $("#location").text(event.data.location);

            if (event.data.pedInVeh != true) {
                toggleSeatbelt(false);
            }
        } else if(event.data.action == 'setTalking') {
            setTalking(event.data.value);
        } else if (event.data.action == "setTalkingRadio"){
            setTalkingRadio(event.data.value);
        } else if(event.data.action == 'setProximity') {
            setProximity(event.data.value);
        } else if (event.data.action == "joinRadio"){
            joinRadio();
        } else if (event.data.action == "leaveRadio"){
            leaveRadio();
        } else if (event.data.action == "toggleSeatbelt"){
            toggleSeatbelt(event.data.value);
        }
    });
});

function displayPluginScreen(toggle) {
	document.getElementById('pluginScreen').style.display = (toggle) ? 'block' : 'none';
}

function widthHeightSplit(value, ele) {
    let height = 25.5;
    let eleHeight = (value / 100) * height;
    let leftOverHeight = height - eleHeight;

    ele.css("height", eleHeight + "px");
    ele.css("top", leftOverHeight + "px");
};

function setTalking(value) {
	if (value) {
		$('#varVoice > #boxSetVoice').css('background', 'rgb(66, 137, 255)')
	} else {
        if(hasRadio) {
            $('#varVoice > #boxSetVoice').css('background', 'rgb(59, 177, 116)')
        } else {
            $('#varVoice > #boxSetVoice').css('background', 'rgb(177, 59, 59)')
        }
	}
}

function setTalkingRadio(value){
	if (value == true){
        state = 'walkie'
    } else {
        state = 'speaker' + speaker
    }
    
	$('#varVoice img').attr('src', 'img/' + state + '.png');
}

function setProximity(value) {
	$('#varVoice img').attr('src', 'img/speaker' + (value + 1) + '.png');
}

function toggleSeatbelt(value) {
	var state;
    
	if (value == true){
        state = 'white'
    } else {
        state = 'red'
    }
    
	$('.seatbelt img').attr('src', 'img/' + state + '.png');
}

function joinRadio() {
    hasRadio = true
}

function leaveRadio() {
    hasRadio = false
}

let status = []
let renderStatus = function() {
    $('#status_list').html('');
    for(let i=0; i<status.length; i++){
        if(status[i].name == "hunger") {
            var percent = status[i].percent
            widthHeightSplit(percent, $("#boxSetHunger"));

            if (percent <= 10.0) {
                if ($("#burgerIcon").hasClass("pulse") == false) {
                    $("#burgerIcon").addClass("pulse");
                }
            } else {
                if ($("#burgerIcon").hasClass("pulse") == true) {
                    $("#burgerIcon").removeClass("pulse");
                }
            }
        }
        if(status[i].name == "thirst") {
            var percent = status[i].percent
            widthHeightSplit(percent, $("#boxSetThirst"));

            if (percent <= 10.0) {
                if ($("#thirstIcon").hasClass("pulse") == false) {
                    $("#thirstIcon").addClass("pulse");
                }
            } else {
                if ($("#thirstIcon").hasClass("pulse") == true) {
                    $("#thirstIcon").removeClass("pulse");
                }
            }
        }
    }
}

window.onData = function(data) {
    if(data.update) {
        status.length = 0;
        for(let i=0; i<data.status.length; i++)
            status.push(data.status[i])
        renderStatus();
    }
}

function hsvToRgb(hue, saturation, value) {
  hue = (hue / 360) * 6;
  saturation /= 100;
  value /= 100;

  const i = Math.floor(hue);

  const f = hue - i;
  const p = value * (1 - saturation);
  const q = value * (1 - f * saturation);
  const t = value * (1 - (1 - f) * saturation);

  const mod = i % 6;
  const red = [value, q, p, p, t, value][mod];
  const green = [t, value, value, q, p, p][mod];
  const blue = [p, p, t, value, value, q][mod];

  // let color = [];
  // color['r'] = Math.round(red * 255);
  // color['g'] = Math.round(green * 255);
  // color['b'] = Math.round(blue * 255);

  return {"r": Math.round(red * 255), "g": Math.round(green * 255), "b": Math.round(blue * 255)};
}

var color;
var colorType = '';
var dark_color_picker;

function buy() {
  $.post('http://drp_lscustom/event', JSON.stringify({colorChange: color, type: colorType, action: 'buy'}));
}

function cancel() {
  $.post('http://drp_lscustom/event', JSON.stringify({colorChange: color, type: colorType, action: 'cancel'}));
}

function showColorWheel(currentColor) {
  //console.log(currentColor[0] + ' ' + currentColor[1] + ' ' + currentColor[2])
  dark_color_picker = new ColorPickerControl({
    container: document.querySelector('.color-picker-dark-theme'),
    theme: 'dark',
    color: {
      r: currentColor[0],
      g: currentColor[1],
      b: currentColor[2]
    }
  });

  dark_color_picker.on('change', (color) => {
    color = hsvToRgb(color.h, color.s, color.v);
    $.post('http://drp_lscustom/event', JSON.stringify({colorChange: color, type: colorType}));
  });

  changeTheme = (e) =>
    (document.querySelector('.flip-container').dataset.flipped =
      e.value == 'light');
}

window.addEventListener('message', (event) => {
  if (event.data.ui === 'open') {
    if (event.data.type !== '') {
      colorType = event.data.type;
      showColorWheel(event.data.currentColor);
      $("#buy").bind("click", buy);
      $("#cancle").bind("click", cancel);
    }
  }

  if (event.data.ui === 'close') {
    colorType = '';
    dark_color_picker.dispose();
    $("#buy").unbind("click", buy);
    $("#cancle").unbind("click", cancel);
  }
});

window.onkeyup = function (e) {
  var key = e.keyCode ? e.keyCode : e.which;

  if (key == 78) {
    $.post('http://drp_lscustom/event', JSON.stringify({freecam: "true"}));
  }
};

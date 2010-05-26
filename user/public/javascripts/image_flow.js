  // target frames per second
MYAPP = {};
MYAPP.FPS = 50;
var x = 0;
var y = 0;
var cell_width = 360;
var cell_height = 240;
var xDirection = 1;
var yDirection = -1;

var canvas = null;
var context2D = null;

window.onload = init;

function init()
{
  MYAPP.intervalID && clearInterval(MYAPP.intervalID);
  canvas = document.getElementById('canvas');
  canvas.addEventListener("click", function(e) {
                          alert("x:" + (e.clientX)
                                +" y:" + (e.clientY) + " id:" + calcPosition(e) + " now:" + y);
                          //                          window.location = "/contents/" + (calcPosition(e) + 1) + ".html";
                          }, false);
  //  canvas.addEventListener("mousemove", function(e) {
  //                          this.drawRect(360 * (calcPosition(e) % 3), 240 * (calcPosition(e) / 3), 360, 240);
  //                          }, false);
  context2D = canvas.getContext('2d');
  context2D.clearRect(0, 0, canvas.width, canvas.height);
  MYAPP.intervalID = setInterval(draw, 2000 / MYAPP.FPS);
}

function calcPosition(e)
{
  var pos_y = e.clientY-canvas.offsetTop;
  var pos_x = e.clientX-canvas.offsetLeft;
  var i = null;
  var j = null;

  if (pos_y <= cell_height + y) i = 0;
  else if (pos_y <= cell_height*2 + y) i = 1;
  else if (pos_y <= cell_height*3 + y) i = 2;
  else if (pos_y <= cell_height*4 + y) i = 3;
  else if (pos_y <= cell_height*5 + y) i = 0;
  else if (pos_y <= cell_height*6 + y) i = 1;
  else if (pos_y <= cell_height*7 + y) i = 2;
  else i = 3;

  if (pos_x <= cell_width) j = 0;
  else if (pos_x <= cell_width*2) j = 1;
  else j = 2;

  return 3*i + j; 
}

// Preloading the images used for the slider handle
var imgList = ["slider-disabled.png", "slider-disabled-1.png", "slider.png", "slider-1.png"];
var preloadImg = []
for(var i = 0, imgSrc; imgSrc = imgList[i]; i++) {
  preloadImg[i] = new Image();
  preloadImg[i].src = "stylesheets/" + imgSrc;
};

function changeScrollSpeed()
{
  var v = parseInt(document.getElementById('slider').value);
  MYAPP.FPS = v;
  init();
};


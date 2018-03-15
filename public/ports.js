app.ports.begin.subscribe(function() {
  window.requestAnimationFrame(function() {
    var element = document.getElementsByClassName("makecarousel")[0];
    console.log("ELEMENT", element);
    var flkty = new Flickity(element, {
      lazyLoad: true,
      adaptiveHeight: true,
      wrapAround: true,
      prevNextButtons: false,
      pageDots: true
    });
  });
});

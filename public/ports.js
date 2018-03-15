window.onload = function() {
  var avatar = document.getElementById('avatar');
  var svgDoc = avatar.contentDocument;
  var head = svgDoc.getElementById('feet-hotspot');
  var bounding = head.getBoundingClientRect();
  var coords = {
    bottom: bounding.bottom,
    height: bounding.height,
    left: bounding.left + window.scrollX,
    right: bounding.right,
    top: bounding.top + window.scrollY,
    width: bounding.width,
    x: bounding.x,
    y: bounding.y
  };
  app.ports.recieveHotspotCoords.send(coords);
};

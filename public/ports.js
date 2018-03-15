window.onload = function() {
  var avatar = document.getElementById('avatar');
  var svgDoc = avatar.contentDocument;
  var hotspotBodyParts = [
    'feet',
    'legs',
    'hands',
    'belly',
    'arms',
    'chest',
    'shoulders',
    'face',
    'head'
  ];
  var hotspotCoords = hotspotBodyParts.map(function(bodypart) {
    var hotspot = svgDoc.getElementById(bodypart + '-hotspot');
    var bounding = hotspot.getBoundingClientRect();
    var coords = {
      name: bodypart,
      bottom: bounding.bottom,
      height: bounding.height,
      left: bounding.left + window.scrollX,
      right: bounding.right,
      top: bounding.top + window.scrollY,
      width: bounding.width,
      x: bounding.x,
      y: bounding.y
    };
    return coords;
  });
  console.log('coords', hotspotCoords);
  app.ports.recieveHotspotCoords.send(coords);
};

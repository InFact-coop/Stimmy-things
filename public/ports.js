window.onload = function() {
  var avatar = document.getElementById('avatar');
  var svgDoc = avatar.contentDocument;
  var hotspotBodyParts = [
    'head',
    'face',
    'shoulders',
    'chest',
    'arms',
    'belly',
    'hands',
    'legs',
    'feet'
  ];
  var hotspotCoords = hotspotBodyParts.reduce(function(acc, bodypart) {
    var hotspot = svgDoc.getElementById(bodypart + '-hotspot');
    var bounding = hotspot.getBoundingClientRect();
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
    acc[bodypart] = coords;
    return acc;
  }, {});
  console.log('coords', hotspotCoords);
  app.ports.recieveHotspotCoords.send(hotspotCoords);
};

import app from './elm-init';

const hotspotBodyParts = [
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

const initHotspots = () => {
  const avatar = document.getElementById('avatar');
  const svgCoords = avatar.getBoundingClientRect();

  const getSvgDoc = cb => {
    let svg = avatar.getSVGDocument();
    if (svg === null) {
      setTimeout(() => {
        getSvgDoc(cb);
      }, 300);
    } else {
      cb();
    }
  };

  const createHotspotCoords = () => {
    const hotspotCoords = hotspotBodyParts.reduce((acc, bodypart) => {
      const svgDoc = avatar.contentDocument;
      const hotspot = svgDoc.getElementById(bodypart + '-hotspot');
      const bounding = hotspot.getBoundingClientRect();
      const coords = {
        name: bodypart,
        bottom: bounding.bottom,
        height: bounding.height,
        left: bounding.left + window.scrollX + svgCoords.left,
        right: svgCoords.right - bounding.right - 16,
        top: bounding.top + window.scrollY + svgCoords.top - 16,
        width: bounding.width,
        x: bounding.x,
        y: bounding.y
      };
      acc[bodypart] = coords;
      return acc;
    }, {});

    app.ports.receiveHotspotCoords.send(hotspotCoords);
  };

  getSvgDoc(createHotspotCoords);
};

export default { initHotspots };

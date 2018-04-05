import app from '../elm-init';

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
  const getSvgDoc = cb => {
    const avatar = document.getElementById('avatar');
    if (avatar === null) {
      setTimeout(() => getSvgDoc(cb), 300);
    } else {
      const svgDoc = avatar.contentDocument;
      const hotspot = svgDoc.getElementById('feet-hotspot');
      if (hotspot === null) {
        setTimeout(() => getSvgDoc(cb), 300);
      } else {
        setTimeout(() => {
          cb();
        }, 500);
      }
    }
  };

  const createHotspotCoords = () => {
    const avatar = document.getElementById('avatar');
    const container = document.getElementById('container');
    const containerCoords = container.getBoundingClientRect();
    const svgCoords = avatar.getBoundingClientRect();
    console.log('containerCoords', containerCoords);
    console.log('svgCoords', svgCoords);
    const svgDoc = avatar.contentDocument;
    const hotspotCoords = hotspotBodyParts.reduce((acc, bodypart) => {
      const hotspot = svgDoc.getElementById(bodypart + '-hotspot');
      const bounding = hotspot.getBoundingClientRect();
      const coords = {
        name: bodypart,
        bottom:
          containerCoords.bottom -
          svgCoords.bottom +
          (svgCoords.height - bounding.bottom) -
          32,
        height: bounding.height,
        left: bounding.left + window.scrollX + svgCoords.left - 16,
        right: svgCoords.right - window.scrollY - bounding.right - 16,
        top: bounding.top + window.scrollY + svgCoords.top - 16,
        width: bounding.width,
        x: bounding.x,
        y: bounding.y
      };
      acc[bodypart] = coords;
      return acc;
    }, {});

    app.ports.receiveHotspotCoords.send(hotspotCoords);
    console.log('final coords', hotspotCoords.legs.bottom);
  };

  getSvgDoc(createHotspotCoords);
};

export default { initHotspots };

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

const initHotspots = skinColour => {
  const getSvgDoc = cb => {
    const avatar = document.getElementById('avatar');
    if (avatar === null) {
      setTimeout(() => getSvgDoc(cb), 0);
    } else {
      const svgDoc = avatar.contentDocument;
      const hotspot = svgDoc.getElementById('feet-hotspot');
      if (hotspot === null) {
        setTimeout(() => getSvgDoc(cb), 0);
      } else {
        setTimeout(() => {
          cb();
        }, 0);
      }
    }
  };

  const createHotspotCoords = () => {
    const avatar = document.getElementById('avatar');
    const container = document.getElementById('container');
    const containerCoords = container.getBoundingClientRect();
    const svgCoords = avatar.getBoundingClientRect();
    const svgDoc = avatar.contentDocument;

    const skinColours = svgDoc.getElementById('body_change_colour');
    skinColours.setAttribute('fill', skinColour);

    if (svgDoc.getElementById('head')) {
      const headColour = svgDoc.getElementById('head');
      headColour.setAttribute('fill', skinColour);
    }

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
  };

  getSvgDoc(createHotspotCoords);
};

export default { initHotspots };

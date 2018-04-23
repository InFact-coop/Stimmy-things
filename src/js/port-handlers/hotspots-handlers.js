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
      return setImmediate(() => getSvgDoc(cb));
    }
    const svgDoc = avatar.contentDocument;
    const hotspot = svgDoc.getElementById('feet-hotspot');
    if (hotspot === null) {
      return setImmediate(() => getSvgDoc(cb));
    }
    cb(avatar, svgDoc);
  };

  const createHotspotCoords = (avatar, svgDoc) => {
    svgDoc
      .getElementById('body_change_colour')
      .setAttribute('fill', skinColour);

    svgDoc.getElementById('head').setAttribute('fill', skinColour);

    const svgCoords = avatar.getBoundingClientRect();
    const container = document.getElementById('container');
    const containerCoords = container.getBoundingClientRect();

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

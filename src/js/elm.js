import Flickity from 'flickity';
import Dexie from 'dexie';
import idb from './idb';

const Elm = require('../elm/Main.elm');
const app = Elm.Main.fullscreen();
const db = new Dexie('stimmy_things');

app.ports.initCarousel.subscribe(() => {
  window.requestAnimationFrame(() => {
    const carouselElement = document.querySelector('.makecarousel');
    const flkty = new Flickity(carouselElement, {
      lazyLoad: true,
      adaptiveHeight: true,
      wrapAround: true,
      prevNextButtons: false,
      pageDots: true
    });
  });
});

app.ports.initHotspots.subscribe(() => {
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

  const createHotspotCoords = () => {
    const svgDoc = avatar.contentDocument;
    const hotspotCoords = hotspotBodyParts.reduce((acc, bodypart) => {
      const hotspot = svgDoc.getElementById(bodypart + '-hotspot');
      const bounding = hotspot.getBoundingClientRect();
      const coords = {
        bottom: bounding.bottom,
        height: bounding.height,
        left: bounding.left + window.scrollX + svgCoords.left,
        right: bounding.right,
        top: bounding.top + window.scrollY + svgCoords.top,
        width: bounding.width,
        x: bounding.x,
        y: bounding.y
      };
      acc[bodypart] = coords;
      return acc;
    }, {});

    app.ports.recieveHotspotCoords.send(hotspotCoords);
  };

  getSvgDoc(createHotspotCoords);
});

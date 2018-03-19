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
  window.onload = function() {
    const avatar = document.getElementById('avatar');
    const svgDoc = avatar.contentDocument;
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

    const hotspotCoords = hotspotBodyParts.reduce((acc, bodypart) => {
      const hotspot = svgDoc.getElementById(bodypart + '-hotspot');
      const bounding = hotspot.getBoundingClientRect();
      const coords = {
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
    app.ports.recieveHotspotCoords.send(hotspotCoords);
  };
});

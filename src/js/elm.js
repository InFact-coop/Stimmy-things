import Flickity from 'flickity';
import Dexie from 'dexie';
import idb from './idb';

const Elm = require('../elm/Main.elm');
const app = Elm.Main.fullscreen();
const db = new Dexie('stimmy_things');

app.ports.initCarousel.subscribe(function() {
  window.requestAnimationFrame(function() {
    var carouselElement = document.getElementsByClassName('makecarousel')[0];
    var flkty = new Flickity(carouselElement, {
      lazyLoad: true,
      adaptiveHeight: true,
      wrapAround: true,
      prevNextButtons: false,
      pageDots: true
    });
  });
});

app.ports.saveLog.subscribe(log => {
  console.log(log);
});

import Elm from '../elm/Main.elm';
import Flickity from 'flickity';
import Dexie from 'dexie';
import idb from './idb';

const app = Elm.Main.fullscreen();
const db = new Dexie('stimmy_things');

idb.createTables(db);

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
  log.dateTime = Date.now();
  idb
    .addLog(db, log)
    .then(() => idb.getAllLogs(db))
    .then(logs => app.ports.receiveUpdatedLogs.send(logs))
    .catch(err => console.log('Error: ', err));
});

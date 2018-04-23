import app from './elm-init';

import idb from './port-handlers/idb-handlers';
import flickity from './port-handlers/flickity-handlers';
import hotspots from './port-handlers/hotspots-handlers';
import firebase from './port-handlers/firebase-handlers';

import defaultStims from '../json/defaultStims.json';

app.ports.initCarousel.subscribe(flickity.initCarousel);
app.ports.videoCarousel.subscribe(flickity.videoCarousel);
app.ports.retrieveChosenAvatar.subscribe(flickity.retrieveChosenAvatar);
app.ports.retrieveChosenVideo.subscribe(flickity.retrieveChosenVideo);

app.ports.initHotspots.subscribe(hotspots.initHotspots);
app.ports.initDB.subscribe(() => idb.initDB(defaultStims));

app.ports.saveLog.subscribe(idb.saveLog);
app.ports.saveStim.subscribe(idb.saveStim);
app.ports.saveOrUpdateUser.subscribe(idb.saveOrUpdateUser);
app.ports.deleteStim.subscribe(idb.deleteStim);
app.ports.fetchFirebaseStims.subscribe(() => firebase.getFirebaseStims());
app.ports.shareStim.subscribe(stim => firebase.addFirebaseStim(stim));

app.ports.changeSkinColour.subscribe(arrayHexClass => {
  const getSvgDoc = cb => {
    let currentAvatar = document.querySelector(arrayHexClass[1]);
    if (arrayHexClass[1] == '.is-selected') {
      currentAvatar = currentAvatar.firstElementChild;
    }
    if (currentAvatar === null) {
      setTimeout(() => getSvgDoc(cb), 300);
    } else {
      const svgDoc = currentAvatar.contentDocument;
      const bodyElements = svgDoc.getElementById('body_change_colour');
      if (bodyElements === null) {
        setTimeout(() => getSvgDoc(cb), 300);
      } else {
        cb();
      }
    }
  };

  const updateSkinColour = () => {
    let currentAvatar = document.querySelector(arrayHexClass[1]);

    if (arrayHexClass[1] == '.is-selected') {
      currentAvatar = currentAvatar.firstElementChild;
    }

    const svgDoc = currentAvatar.contentDocument;

    if (svgDoc.getElementById('body_change_colour')) {
      svgDoc
        .getElementById('body_change_colour')
        .setAttribute('fill', arrayHexClass[0]);
    }
    if (svgDoc.getElementById('head')) {
      svgDoc.getElementById('head').setAttribute('fill', arrayHexClass[0]);
    }
  };
  getSvgDoc(updateSkinColour);
});

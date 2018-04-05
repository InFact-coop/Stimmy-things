import app from './elm-init';

import idb from './port-handlers/idb-handlers';
import flickity from './port-handlers/flickity-handlers';
import hotspots from './port-handlers/hotspots-handlers';
import firebase from './port-handlers/firebase-handlers';

import defaultStims from '../json/defaultStims.json';

app.ports.initCarousel.subscribe(flickity.initCarousel);
app.ports.videoCarousel.subscribe(flickity.videoCarousel);
app.ports.retrieveChosenAvatar.subscribe(flickity.retrieveChosenAvatar);

app.ports.initHotspots.subscribe(hotspots.initHotspots);
app.ports.initDB.subscribe(() => idb.initDB(defaultStims));

app.ports.saveLog.subscribe(idb.saveLog);
app.ports.saveStim.subscribe(idb.saveStim);
app.ports.saveOrUpdateUser.subscribe(idb.saveOrUpdateUser);

app.ports.fetchFirebaseStims.subscribe(() => firebase.getFirebaseStims());
app.ports.shareStim.subscribe(stim => firebase.addFirebaseStim(stim));

app.ports.changeSkinColour.subscribe(hex => {
  const getSvgDoc = cb => {
    const currentAvatar = document.querySelector('.is-selected')
      .firstElementChild;
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
    const currentAvatar = document.querySelector('.is-selected')
      .firstElementChild;
    const svgDoc = currentAvatar.contentDocument;

    svgDoc.getElementById('body_change_colour').setAttribute('fill', hex);

    if (svgDoc.getElementById('head')) {
      svgDoc.getElementById('head').setAttribute('fill', hex);
    }
  };
  getSvgDoc(updateSkinColour);
});

app.ports.changeHeadSkinColour.subscribe(hex => {
  const getSvgHead = cb => {
    const currentAvatarHead = document.getElementById('avatarHead');

    if (currentAvatarHead === null) {
      setTimeout(() => getSvgHead(cb), 300);
    } else {
      const svgDoc = currentAvatarHead.contentDocument;

      const bodyElements = svgDoc.getElementById('body_change_colour');

      if (bodyElements === null) {
        setTimeout(() => getSvgHead(cb), 300);
      } else {
        cb();
      }
    }
  };

  const updateSkinColour = () => {
    const currentAvatarHead = document.getElementById('avatarHead');

    const svgDoc = currentAvatarHead.contentDocument;

    const skinColours = svgDoc.getElementById('head');

    skinColours.setAttribute('fill', hex);
  };

  getSvgHead(updateSkinColour);
});

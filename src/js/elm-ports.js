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

app.ports.fetchFirebaseStims.subscribe(() => firebase.getFirebaseStims());
app.ports.shareStim.subscribe((stim, userInfo) =>
  firebase.addFirebaseStim(stim, userInfo)
);

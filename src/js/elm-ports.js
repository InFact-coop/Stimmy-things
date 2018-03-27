import app from './elm-init';

import idb from './idb-handlers';
import flickity from './flickity-handlers';
import hotspots from './hotspots-handlers';
import defaultStims from '../json/defaultStims.json';
import firebase from './firebase';

app.ports.initCarousel.subscribe(flickity.initCarousel);
app.ports.videoCarousel.subscribe(flickity.videoCarousel);
app.ports.retrieveChosenAvatar.subscribe(flickity.retrieveChosenAvatar);

app.ports.initHotspots.subscribe(hotspots.initHotspots);
app.ports.initDB.subscribe(() => idb.initDB(defaultStims));

app.ports.saveLog.subscribe(idb.saveLog);
app.ports.saveStim.subscribe(idb.saveStim);

app.ports.fetchFirebaseStims.subscribe(() => firebase.getFirebaseStims());

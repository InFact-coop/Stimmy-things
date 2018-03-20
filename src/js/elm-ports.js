import app from './elm-init';

import idb from './idb-handlers';
import flickity from './flickity-handlers';
import hotspots from './hotspots-handlers';
import defaultStims from '../json/defaultStims.json';

app.ports.initCarousel.subscribe(flickity.initCarousel);
app.ports.initHotspots.subscribe(hotspots.initHotspots);
app.ports.initDB.subscribe(() => idb.initDB(defaultStims));

app.ports.saveLog.subscribe(idb.saveLog);

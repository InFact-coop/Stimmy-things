import Dexie from 'dexie';
import idb from './idb';
import app from './elm-init';
import flickity from './flickity';
import hotspots from './hotspots';

const db = new Dexie('stimmy_things');

app.ports.initCarousel.subscribe(flickity.initCarousel);
app.ports.initHotspots.subscribe(hotspots.initHotspots);

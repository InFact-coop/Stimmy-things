var firebase = require('firebase/app');
require('firebase/auth');
require('firebase/database');

import { config } from './firebase-config.js';

var fb = firebase.initializeApp({ config });

const getFirebaseStims = () => {
  return fb.ref('stimId');
};

const addFirebaseStim = stim => {
  return fb.stims.push(stim);
};

export default { fb, getFirebaseStims, addFirebaseStim };

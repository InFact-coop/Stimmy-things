import firebase from 'firebase/app';
import 'firebase/database';
import _ from 'lodash';
import app from '../elm-init';

import { config } from '../firebase-config.js';

const fb = firebase.initializeApp(config()).database();

const getFirebaseStims = () => {
  return fb
    .ref()
    .once('value')
    .then(snapshot => _.map(snapshot.val()))
    .then(stims => app.ports.receiveFirebaseStims.send(stims))
    .catch(err => console.log('Error retreiving stims from Firebase', err));
};

const addFirebaseStim = stim => {
  return fb.ref().push(stim);
};

export default { fb, getFirebaseStims, addFirebaseStim };

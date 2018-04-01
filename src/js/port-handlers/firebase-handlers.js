import firebase from 'firebase/app';
import 'firebase/database';
import app from '../elm-init';

import { config } from '../firebase-config.js';

const fb = firebase.initializeApp(config()).database();

const getFirebaseStims = () => {
  return fb
    .ref()
    .once('value')
    .then(snapshot => Object.values(snapshot.val()))
    .then(stims => app.ports.receiveFirebaseStims.send(stims))
    .catch(err => console.log('Error retreiving stims from Firebase', err));
};

const addFirebaseStim = stimAndUserInfo => {
  const firebaseStimUser = {
    stim: stimAndUserInfo[0],
    user: stimAndUserInfo[1]
  };
  firebaseStimUser.stim.shared = true;
  return fb.ref().push(firebaseStimUser);
};

export default { fb, getFirebaseStims, addFirebaseStim };

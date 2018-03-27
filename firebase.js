import firebase from 'firebase/app';
import 'firebase/database';
import { config } from './firebase-config.js';

export function initFirebaseDB() {
  firebase.initializeApp(config());
  return firebase.database();
}

export const firebaseDB = initFirebaseDB();

export function addNewStim(db, stim) {
  return db.stims.push(stim);
}

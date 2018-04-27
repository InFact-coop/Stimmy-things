import firebase from './firebase-handlers';
import app from '../elm-init';
import helpers from '../idb-helpers';

const initDB = defaultStims => {
  const db = helpers.createDB();

  const stimPromises = defaultStims.map(stim => helpers.addStim(db, stim));

  Promise.all(stimPromises)
    .then(() => helpers.getAllTheData(db))
    .then(data => app.ports.receiveInitialData.send(data))
    .catch(err => console.log('Failure', err));
};

const saveStim = stim => {
  const db = helpers.createDB();
  if (stim.stimId === '') stim.stimId = helpers.generateId('_stim-');

  helpers
    .addStim(db, stim)
    .then(() => helpers.getAllStims(db))
    .then(stims => app.ports.receiveUpdatedStims.send(stims))
    .catch(err => console.log('Error saving stim: ', err));
};

const shareStim = stim => {
  const db = helpers.createDB();
  const stimClone = { ...stim, shared: true };
  helpers
    .addStim(db, stimClone)
    .then(() => firebase.addFirebaseStim(stimClone))
    .then(() => helpers.getAllStims(db))
    .then(stims => app.ports.receiveUpdatedStims.send(stims))
    .catch(err => console.log('Error sharing stim: ', err));
};

const saveOrUpdateUser = user => {
  const db = helpers.createDB();
  const id = user.userId === '' ? helpers.generateId('_user-') : user.userId;
  helpers
    .createOrUpdateUser(db, { ...user, userId: id })
    .then(() => helpers.getUser(db))
    .then(user => app.ports.receiveUserSaveSuccess.send(true))
    .catch(err => {
      console.log('Error saving user: ', err);
      app.ports.receiveUserSaveSuccess.send(false);
    });
};

const deleteStim = stimId => {
  const db = helpers.createDB();
  helpers
    .deleteStim(db, stimId)
    .then(() => {
      app.ports.receiveDeleteStimSuccess.send(true);
    })
    .catch(err => {
      console.log('Error deleting stim: ', err);
      app.ports.receiveDeleteStimSuccess.send(false);
    });
};

export default {
  saveStim,
  saveOrUpdateUser,
  initDB,
  shareStim,
  deleteStim
};

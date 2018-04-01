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

const saveLog = log => {
  const db = helpers.createDB();

  log.dateTime = Date.now();
  helpers
    .addLog(db, log)
    .then(() => helpers.getAllLogs(db))
    .then(logs => app.ports.receiveUpdatedLogs.send(logs))
    .catch(err => console.log('Error saving log: ', err));
};

const saveStim = stim => {
  const db = helpers.createDB();
  const id = helpers.generateId('_stim-');
  stim.stimId = id;
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

export default {
  saveLog,
  saveStim,
  saveOrUpdateUser,
  initDB,
  shareStim
};

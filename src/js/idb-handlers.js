import helpers from './idb-helpers';
import app from './elm-init';
import firebase from './firebase-handlers';

const initDB = defaultStims => {
  const db = helpers.createDB();

  const stimPromises = defaultStims.map(stim => helpers.addStim(db, stim));

  Promise.all(stimPromises)
    .then(() => {
      return helpers.createOrUpdateUser(db, {
        userId: '234234',
        avatar: 'avatar1',
        skinColour: 'skinColour1',
        name: 'Neil'
      });
    })
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
    .then(() => {
      return helpers.getAllStims(db);
    })
    .then(stims => {
      return new Promise((resolve, reject) => {
        app.ports.receiveUpdatedStims.send(stims);
      });
    })
    .catch(err => console.log('Error sharing stim: ', err));
};

export default { saveLog, saveStim, initDB, shareStim };

import helpers from './idb-helpers';
import app from './elm-init';

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

  helpers
    .addStim(db, stim)
    .then(() => helpers.getAllStims(db))
    .then(stims => app.ports.receiveUpdatedStims.send(stims))
    .catch(err => console.log('Error saving stim: ', err));
};

const saveUser = user => {
  const db = helpers.createDB();

  helpers
    .createOrUpdateUser(db, user)
    .then(() => helpers.getUser(db))
    .then(user => app.ports.userSaveSuccess.send(true))
    .catch(err => {
      console.log('Error saving stim: ', err);
      app.ports.userSaveSuccess.send(false);
    });
};

export default { saveLog, saveStim, initDB };

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
  helpers
    .addStim(db, stim)
    .then(() => helpers.getAllStims(db))
    .then(stims => app.ports.receiveUpdatedStims.send(stims))
    .catch(err => console.log('Error saving stim: ', err));
};

const saveUser = user => {
  const db = helpers.createDB();
  const id = helpers.generateId('_user-');
  helpers
    .createOrUpdateUser(db, { userId: id, ...user })
    .then(() => helpers.getUser(db))
    .then(user => app.ports.receiveUserSaveSuccess.send(true))
    .catch(err => {
      console.log('Error saving user: ', err);
      app.ports.receiveUserSaveSuccess.send(false);
    });
};

export default { saveLog, saveStim, saveUser, initDB };

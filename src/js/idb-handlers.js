import helpers from './idb-helpers';
import app from './elm-init';

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

export default { saveLog, initDB };
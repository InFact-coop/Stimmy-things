import helpers from './idb-helpers';
import app from './elm-init';

const saveLog = log => {
  const db = helpers.createDB();

  log.dateTime = Date.now();
  helpers
    .addLog(db, log)
    .then(() => helpers.getAllLogs(db))
    .then(logs => app.ports.receiveUpdatedLogs.send(logs))
    .catch(err => console.log('Error saving log: ', err));
};

const initDB = defaultStims => {
  const db = helpers.createDB();

  const stimPromises = defaultStims.map(stim => helpers.addStim(db, stim));

  Promise.all(stimPromises)
    .then(() => helpers.getAllStims(db))
    .then(logs => console.log('Success!', logs))
    .catch(err => console.log('Failure', err));
};

export default { saveLog, initDB };

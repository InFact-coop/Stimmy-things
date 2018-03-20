const createTables = db => {
  return db.version(1).stores({
    user: 'userId, avatar, skinColour, name',
    stims: 'stimId, stimName, bodyPart, instructions, videoSrc, userId, shared',
    logs:
      '++id, stimId, timeTaken, preFace, postFace, preFeelings, postFeelings, dateTime'
  });
};

const createOrUpdateUser = (db, { userId, avatar, skinColour, name }) => {
  return db.user.put({ userId, name, avatar, skinColour });
};

const getUser = db => {
  return db.user.toArray().then(users => users[0]);
};

const addStim = (
  db,
  { stimId, stimName, bodyPart, instructions, videoSrc, userId, shared }
) => {
  return db.stims.put({
    stimId,
    stimName,
    bodyPart,
    instructions,
    videoSrc,
    userId,
    shared
  });
};

const addLog = (
  db,
  { stimId, timeTaken, preFace, postFace, preFeelings, postFeelings, dateTime }
) => {
  return db.logs.put({
    stimId,
    timeTaken,
    preFace,
    postFace,
    preFeelings,
    postFeelings,
    dateTime
  });
};

const getAllStims = db => {
  return db.stims.toArray();
};

const getAllLogs = db => {
  return db.logs.toArray();
};

const deleteStim = stimId => {
  return db.stims.delete(stimId);
};

const getAllTheData = db => {
  return db.transaction('r', [db.user, db.stims, db.logs], async () => {
    const user = await getUser();
    const stims = await getAllStims();
    const logs = await getAllLogs();

    return { user, stims, logs };
  });
};

export default {
  createTables,
  createOrUpdateUser,
  getUser,
  addStim,
  addLog,
  getAllLogs,
  getAllTheData
};

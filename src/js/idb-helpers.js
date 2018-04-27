import Dexie from 'dexie';

const createTables = db => {
  return db.version(1).stores({
    user: 'userId, avatar, skinColour, name',
    stims: 'stimId, stimName, bodyPart, instructions, videoSrc, userId, shared'
  });
};

const createDB = () => {
  const db = new Dexie('stimmy_things');
  createTables(db);
  return db;
};

const createOrUpdateUser = (db, { userId, avatar, skinColour, name }) => {
  return db.user.put({ userId, avatar, skinColour, name });
};

const getUser = db => {
  return db.user.toArray().then(users => users[0]);
};

const addStim = (
  db,
  {
    stimId,
    stimName,
    bodyPart,
    instructions,
    videoSrc,
    userId,
    shared,
    thumbnail
  }
) => {
  return db.stims.put({
    stimId,
    stimName,
    bodyPart,
    instructions,
    videoSrc,
    userId,
    shared,
    thumbnail
  });
};

const getAllStims = db => {
  return db.stims.toArray();
};

const deleteStim = (db, stimId) => {
  return db.stims.delete(stimId);
};

const getAllTheData = db => {
  return db.transaction('r', [db.user, db.stims], async () => {
    const user = await getUser(db);
    const stims = await getAllStims(db);

    return { user, stims };
  });
};

const generateId = prefix => {
  const uniqueString = Math.random()
    .toString(36)
    .substr(2, 9);
  return prefix + uniqueString;
};

export default {
  createOrUpdateUser,
  getUser,
  generateId,
  createDB,
  getAllStims,
  addStim,
  deleteStim,
  getAllTheData
};

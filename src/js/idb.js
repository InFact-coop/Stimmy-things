const createTables = db => {
  return db.version(1).stores({
    user: 'user_id, avatar, skin_colour, name',
    stims:
      'stim_id, stim_name, body_part, instructions, video_src, user_id, shared',
    logs:
      '++id, stim_id, time_taken, pre_face, post_face, pre_feelings, post_feelings, date_time'
  });
};

const createOrUpdateUser = (db, { user_id, avatar, skin_colour, name }) => {
  return db.user.put({ user_id, name, avatar, skin_colour });
};

const getUser = db => {
  return db.user.toArray().then(users => users[0]);
};

const addStim = (
  db,
  { stim_id, stim_name, body_part, instructions, video_src, user_id, shared }
) => {
  return db.stims.put({
    stim_id,
    stim_name,
    body_part,
    instructions,
    video_src,
    user_id,
    shared
  });
};

const addLog = (
  db,
  {
    stim_id,
    time_taken,
    pre_face,
    post_face,
    pre_feelings,
    post_feelings,
    date_time
  }
) => {
  return db.logs.put({
    stim_id,
    time_taken,
    pre_face,
    post_face,
    pre_feelings,
    post_feelings,
    date_time
  });
};

const getAllStims = db => {
  return db.stims.toArray();
};

const getAllLogs = db => {
  return db.logs.toArray();
};

const deleteStim = stim_id => {
  return db.stims.delete(stim_id);
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
  getAllTheData
};

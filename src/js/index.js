import Dexie from 'dexie';
import idb from './idb';

const db = new Dexie('stimmy_things');

idb.createTables(db);

idb.createOrUpdateUser(db, {
  name: 'Ivan',
  avatar: 'alien',
  skin_colour: 'skin_colour1',
  user_id: 323423
});

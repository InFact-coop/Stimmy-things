// import QUnit from "qunit";
import idb from '../../src/js/idb';
import Dexie from 'dexie';

const db = new Dexie('test_db');
idb.createTables(db);

let tableNames = [];
let tableKeys = [];

function checkName() {
  console.log('checkName', db.name);
  return db.name;
}

function returnTableNames() {
  tableNames = Object.keys(db._allTables);
  return tableNames;
}

function getUserKeys() {
  return (tableKeys = db.user.schema.indexes.map(function(element) {
    return element.name;
  }));
}

function getStimsKeys() {
  return (tableKeys = db.stims.schema.indexes.map(function(element) {
    return element.name;
  }));
}

function getLogsKeys() {
  return (tableKeys = db.logs.schema.indexes.map(function(element) {
    return element.name;
  }));
}

function checkUserDetails(callback) {
  idb
    .createOrUpdateUser(db, {
      name: 'Ivan',
      avatar: 'alien',
      skin_colour: 'skin_colour1',
      user_id: 323423
    })
    .then(res1 => db.user.toArray())
    .then(user => {
      console.log('user', user[0]);
      return user[0];
    })
    .then(res2 => {
      console.log('res', res);
      callback(res);
    });
}

QUnit.test('hello test', function(assert) {
  assert.ok(1 == '1', 'Passed!');
});

QUnit.test('correct database name', function(assert) {
  assert.ok(checkName() === 'test_db', 'Passed!');
});

QUnit.test('correct number of tables', function(assert) {
  returnTableNames();
  assert.ok(tableNames.length === 3, 'Passed!');
});

QUnit.test('tables exist with correct names', function(assert) {
  returnTableNames();
  assert.deepEqual(tableNames, ['user', 'stims', 'logs'], 'Passed!');
});

QUnit.test('user table exists with correct indices', function(assert) {
  getUserKeys();
  assert.deepEqual(tableKeys, ['avatar', 'skin_colour', 'name'], 'Passed!');
});

QUnit.test('stims table exists with correct indices', function(assert) {
  getStimsKeys();
  assert.deepEqual(
    tableKeys,
    [
      'stim_name',
      'body_part',
      'instructions',
      'video_src',
      'user_id',
      'shared'
    ],
    'Passed!'
  );
});

QUnit.test('logs table exists with correct indices', function(assert) {
  getLogsKeys();
  assert.deepEqual(
    tableKeys,
    [
      'stim_id',
      'time_taken',
      'pre_face',
      'post_face',
      'pre_feelings',
      'post_feelings',
      'date_time'
    ],
    'Passed!'
  );
});

// QUnit.test("checks that user has been created", function(assert) {
//   checkUserDetails(
//     assert.deepEqual(res, {
//       name: "Ivan",
//       avatar: "alien",
//       skin_colour: "skin_colour1",
//       user_id: 323423
//     })
//   );
// });

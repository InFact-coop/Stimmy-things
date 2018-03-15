// import QUnit from "qunit";
import idb from "./idb";
import Dexie from "dexie";

const db = new Dexie("test_db");

function checkName() {
  console.log("checkName", db.name);
  return db.name;
}

function correctNumberOfTables() {
  console.log("number of tables", db.Table.length);
  return db.Table.length;
}

function allTablesExist() {
  console.log("keys", Object.keys(db._allTables));
  return Object.keys(db._allTables);
}

function userDetailsCorrect() {
  db.user.toArray().then(user => {
    console.log("user", user[0]);
    return (username = user[0].name);
  });
}

QUnit.test("hello test", function(assert) {
  assert.ok(1 == "1", "Passed!");
});

QUnit.test("correct name", function(assert) {
  assert.ok(checkName() === "test_db", "Passed!");
});

QUnit.test("correct number of tables", function(assert) {
  assert.ok(correctNumberOfTables() === 3, "Passed!");
});

QUnit.test("all tables exist with correct names", function(assert) {
  assert.deepEqual(allTablesExist(), ["user", "stims", "logs"], "Passed!");
});

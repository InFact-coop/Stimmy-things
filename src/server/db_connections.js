const pgp = require("pg-promise")();
const url = require("url");
require("env2")("config.env");

let DB_URL = process.env.DATABASE_URL;

if (!DB_URL) {
  throw new Error("Environment variable DATABASE_URL must be set");
}

const params = url.parse(DB_URL);
const [username, password] = params.auth.split(":");

const options = {
  host: params.hostname,
  port: params.port,
  database: params.pathname.split("/")[1],
  max: process.env.DB_MAX_CONNECTIONS || 2
};

if (username) {
  options.user = username;
}
if (password) {
  options.password = password;
}

options.ssl = options.host !== "localhost";

module.exports = pgp(options);

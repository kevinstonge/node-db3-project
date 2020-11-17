// scheme-model
const db = require("../data/db-config.js");

const find = () => {
  return db("schemes");
};

const findById = (id) => {
  return db("schemes").where({ id });
};

module.exports = { find, findById };

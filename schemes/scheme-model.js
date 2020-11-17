// scheme-model
const db = require("../data/db-config.js");

const find = () => {
  return db("schemes");
};

const findById = async (id) => {
  try {
    const [result] = await db("schemes").where({ id });
    return result ? result : Promise.resolve(null);
  } catch (error) {
    throw error;
  }
};

const findSteps = async (id) => {
  try {
    const result = await db("steps")
      .where({ scheme_id: id })
      .orderBy("step_number");
    return result;
  } catch (error) {
    throw error;
  }
};

const add = async (schemeObject) => {
  try {
    const result = await db("schemes").insert(schemeObject);
    return result;
  } catch (error) {
    throw error;
  }
};

const update = async (updateObject, id) => {
  try {
    const result = await db("schemes").update(updateObject).where({ id });
    return result;
  } catch (error) {
    throw error;
  }
};

const remove = async (id) => {
  try {
    const result = await db("schemes").where({ id }).del();
    return result;
  } catch (error) {
    throw error;
  }
};

module.exports = { find, findById, findSteps, add, update, remove };

const express = require("express");
const cors = require("cors");
const SchemeRouter = require("./schemes/scheme-router.js");

const server = express();

server.use(express.json());
server.use(cors());
server.use("/api/schemes", SchemeRouter);

module.exports = server;

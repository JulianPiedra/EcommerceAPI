require('dotenv').config();
const { sequelize } = require('./Database/Models');

sequelize.authenticate()
  .then(() => {
    console.log('Database connected successfully.');
    return sequelize.sync(); 
  })
  .then(() => {
    console.log('Models synchronized.');
  })
  .catch(err => {
    console.error('Unable to connect to the database:', err);
  });
const express = require('express');
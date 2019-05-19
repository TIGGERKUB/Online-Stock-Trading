var express = require("express");
var mysql      = require('mysql');

var connection = mysql.createConnection({
    host:"localhost",
    user     : 'root',
    password : '',
    database : 'online_trading'
  });

connection.connect(function(err){
    if(err){
        console.log("pls check your DB");
        throw err;
    }else{
        console.log("Connected DB");
    }
});

  module.exports = connection;
var express = require("express");
var router = express.Router();
const connection = require("../../connection/connection");

router.get("/",function(req,res){
    res.render("portfolio/index");
})

module.exports = router;
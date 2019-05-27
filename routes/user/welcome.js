var express = require("express");
var router = express.Router();
const connection = require("../../connection/connection");

router.get("/:id1/:id2", function (req, res) {
    req.session.currentAccount = req.params.id1;
    req.session.currentBalance = req.params.id2;
    console.log("Welcome "+ req.session.currentAccount+" Your Balance: "+ req.session.currentBalance);
    res.redirect("/");
})

module.exports = router;
var express = require("express");
var router = express.Router();
const connection = require("../../connection/connection");

router.get("/show/member", function (req, res) {
    var findMember = "SELECT * FROM trader_data"
    connection.query(findMember, function (err, foundMember) {
        if (err) {
            throw err;
        }
        res.render("admin/show/browse/member", {
            members: foundMember
        });
    });
})

router.get("/member/:id/edit", function (req, res) {
    console.log(req.params.id);
    var edit = req.params.id;
    var find = "SELECT * FROM trader_data WHERE Trader_Personal_ID =" + edit + " ";
    connection.query(find, function (err, foundAccounts) {
        if (err) {
            throw err;
        }
        console.log(foundAccounts);
        res.render("admin/edit/member", {
            traders: foundAccounts[0]
        });
    })
})

router.put("/member/update/:id", function (req, res) {
    console.log(req.params.id);
    var edit = req.params.id;
    // var findIndex = "SELECT * FROM trader_data WHERE Trader_Personal_ID =" +req.body.Username+ " ";
    var find = "SELECT * FROM trader_data WHERE Trader_Personal_ID =" + edit + " ";
    connection.query(find, function (err, foundID) {
        if (err) {
            throw err;
        }
        var updateID = "UPDATE trader_data SET Username = '" + req.body.Username + "',Password = '" + req.body.Password + "',Trader_Fname = '" + req.body.Trader_Fname + "',Trader_Lname = '" + req.body.Trader_Lname + "',Trader_Age = '" + req.body.Trader_Age + "',Trader_Address = '" + req.body.Trader_Address + "',Trader_Email = '" + req.body.Trader_Email + "',Trader_Phone = '" + req.body.Trader_Phone + "' WHERE Trader_Personal_ID = " + foundID[0].Trader_Personal_ID + " ";
        connection.query(updateID, function (err, updateDone) {
            if (err) {
                throw err;
            }
            res.redirect("/admin/show/member");
        });
    });
})

router.get("/show/search/member", function (req, res) {
    var foundMember = "";
    res.render("admin/show/search/member", {
        members: foundMember
    });
})

router.post("/show/search/member", function (req, res) {
    var find = "SELECT * FROM trader_data WHERE Trader_Personal_ID =" + req.body.searchPersonalID + " ";
    connection.query(find, function (err, found) {
        if (err) {
            throw err;
        }
        res.render("admin/show/search/member", {
            members: found
        });
    });

})


router.get("/show/insert/member", function (req, res) {
    res.render("admin/show/insert/member");
})



module.exports = router;
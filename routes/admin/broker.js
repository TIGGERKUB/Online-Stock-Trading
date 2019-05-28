var express = require("express");
var router = express.Router();
const connection = require("../../connection/connection");

router.get("/show/broker", function (req, res) {
    var findBroker = "SELECT * FROM broker"
    connection.query(findBroker, function (err, foundBroker) {
        if (err) {
            throw err;
        }
        res.render("admin/show/browse/broker", {
            brokers: foundBroker
        });
    });
})

router.get("/broker/:id/edit", function (req, res) {
    console.log(req.params.id);
    var edit = req.params.id;
    var find = "SELECT * FROM broker WHERE Broker_Symbol = '" + edit + "' ";
    connection.query(find, function (err, foundBroker) {
        if (err) {
            throw err;
        }
        res.render("admin/edit/broker", {
            brokers: foundBroker[0]
        });
    })
})
router.put("/broker/update/:id", function (req, res) {
    console.log(req.params.id);
    var edit = req.params.id;
    var find = "SELECT * FROM broker WHERE Broker_Symbol = '" + edit + "' ";

    connection.query(find, function (err, foundBroker) {
        if (err) {
            throw err;
        }
        var updateBroker = "UPDATE broker SET Broker_Name = '" + req.body.Broker_Name + "',Broker_Address = '" + req.body.Broker_Address + "',Broker_Email = '" + req.body.Broker_Email + "',Broker_Phone = '" + req.body.Broker_Phone + "',Broker_Commission	 = '" + req.body.Broker_Commission	 + "' WHERE Broker_Symbol = '" + foundBroker[0].Broker_Symbol + "' ";
        connection.query(updateBroker, function (err, updateBroker) {
            if (err) {
                throw err;
            }
            res.redirect("/admin/show/broker");
        });
    });
})

router.get("/show/insert/broker", function (req, res) {
    var findPersonalID = "SELECT Trader_Personal_ID FROM trader_data"
    connection.query(findPersonalID, function (err, foundPersonalID) {
        if (err) {
            throw err;
        }
        var findStock = "SELECT Broker_Symbol FROM broker"
        connection.query(findStock, function (err, foundStock) {
            if (err) {
                throw err;
            }
            res.render("admin/show/insert/account", {
                personalIDs: foundPersonalID,
                stocks: foundStock
            });
        });
    });
})

module.exports = router;
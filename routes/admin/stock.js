var express = require("express");
var router = express.Router();
const connection = require("../../connection/connection");


router.get("/show/stock", function (req, res) {
    var findstock = "SELECT * FROM stock_symbol"
    connection.query(findstock, function (err, foundStock) {
        if (err) {
            throw err;
        }
        res.render("admin/show/browse/stock", {
            stocks: foundStock
        });
    });
})


router.get("/stock/:id/edit", function (req, res) {
    console.log(req.params.id);
    var edit = req.params.id;
    var find = "SELECT * FROM stock_symbol WHERE Stock_Symbol ='"+ edit + "' ";
    connection.query(find, function (err, foundStock) {
        if (err) {
            throw err;
        }
        res.render("admin/edit/stock", {
            stocks: foundStock[0],
        });
    })
})


module.exports = router;
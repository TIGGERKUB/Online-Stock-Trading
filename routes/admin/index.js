var express = require("express");
var router = express.Router();
const connection = require("../../connection/connection");

router.get("/", function (req, res) {
    var findOrder = "SELECT * FROM stock_order"
    var findTransaction = "SELECT * FROM transaction"
    connection.query(findTransaction, function (err, foundTransaction) {
        if (err) {
            throw err;
        }
        connection.query(findOrder, function (err, foundOrder) {
            if (err) {
                throw err;
            }
            res.render("admin/index", {
                orders: foundOrder,
                transactions: foundTransaction
            });
        });
    });
})

router.get("/show/member", function (req, res) {
    var findMember = "SELECT * FROM trader_data"
    connection.query(findMember, function (err, foundMember) {
        if (err) {
            throw err;
        }
        res.render("admin/show/member", {
            members: foundMember
        });
    });
})


router.get("/show/account", function (req, res) {
    var findAccount = "SELECT * FROM trader_account"
    connection.query(findAccount, function (err, foundAccount) {
        if (err) {
            throw err;
        }
        res.render("admin/show/account", {
            accounts: foundAccount
        });
    });
})

router.get("/show/transaction", function (req, res) {
    var findTransaction = "SELECT * FROM transaction"
    connection.query(findTransaction, function (err, foundTransaction) {
        if (err) {
            throw err;
        }
        res.render("admin/show/transaction", {
            transactions: foundTransaction
        });
    });
})

//search Broker
router.get('/searchBroker', function (req, res) {
    var search = 'SELECT Broker_Symbol from trader_account where Broker_Symbol like "%' + req.query.key + '%"'
    connection.query(search, function (err, rows, fields) {
        if (err) throw err;
        var data = [];
        for (i = 0; i < rows.length; i++) {
            data.push(rows[i].Broker_Symbol);
        }
        res.end(JSON.stringify(data));
    });
});

//search PersonalID
router.get('/searchPersonalID', function (req, res) {
    var search = 'SELECT Trader_Personal_ID from trader_data where Trader_Personal_ID like "%' + req.query.key + '%"'
    connection.query(search, function (err, rows, fields) {
        if (err) throw err;
        var data = [];
        for (i = 0; i < rows.length; i++) {
            data.push(rows[i].Trader_Personal_ID);
        }
        res.end(JSON.stringify(data));
    });
});

//search Account ID
router.get('/searchAccountID', function (req, res) {
    var search = 'SELECT Account_ID from trader_account where Account_ID like "%' + req.query.key + '%"'
    connection.query(search, function (err, rows, fields) {
        if (err) throw err;
        var data = [];
        for (i = 0; i < rows.length; i++) {
            data.push(rows[i].Account_ID);
        }
        res.end(JSON.stringify(data));
    });
});

module.exports = router;
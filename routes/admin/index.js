var express = require("express");
var router = express.Router();
const connection = require("../../connection/connection");


router.get("/", function (req, res) {
    var page = "";
    req.session.page = page;
    res.redirect('/admin/index');

})

router.get("/show/account1", function (req, res) {
    var page = "account";
    req.session.page = page;
    res.redirect('/admin/show/account');

})

router.get("/show/member1", function (req, res) {
    var page = "member";
    req.session.page = page;
    res.redirect('/admin/show/member');
})

router.get("/show/stock1", function (req, res) {
    var page = "stock";
    req.session.page = page;
    res.redirect('/admin/show/stock');
})

router.get("/show/market1", function (req, res) {
    res.redirect('/admin');
})

router.get("/show/order1", function (req, res) {
    res.redirect('/admin');
})

router.get("/show/Transaction1", function (req, res) {
    res.redirect('/admin');
})

router.get("/show/bank1", function (req, res) {
    res.redirect('/admin');
})

router.get("/show/broker1", function (req, res) {
    var page = "broker";
    req.session.page = page;
    res.redirect('/admin/show/broker');
})

router.get("/show/company1", function (req, res) {
    res.redirect('/admin');
})




router.get("/index", function (req, res) {
    var findOrder = "SELECT * FROM stock_order ORDER BY Order_Time DESC"
    var findTransaction = "SELECT * FROM transaction ORDER BY Transaction_Timestamp DESC"
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
var express = require("express");
var router = express.Router();
const connection = require("../../connection/connection");

router.get("/show/account", function (req, res) {
    var findAccount = "SELECT * FROM trader_account"
    connection.query(findAccount, function (err, foundAccount) {
        if (err) {
            throw err;
        }
        res.render("admin/show/browse/account", {
            accounts: foundAccount
        });
    });
})
router.get("/show/search/account", function (req, res) {
    var findAccount = "SELECT * FROM trader_account"
    connection.query(findAccount, function (err, foundAccount) {
        if (err) {
            throw err;
        }
        res.render("admin/show/search/account", {
            accounts: foundAccount
        });
    });
})

router.post("/show/search/account", function (req, res) {
    var Account_type = req.body.Account_type;
    var Broker_Symbol = req.body.searchStock;
    if (Account_type && Broker_Symbol) {
        var findAccount = "SELECT * FROM trader_account WHERE Account_type = '" + Account_type + "' AND Broker_Symbol ='" + Broker_Symbol + "'";
    } else if (Account_type && !Broker_Symbol) {
        var findAccount = "SELECT * FROM trader_account WHERE Account_type = '" + Account_type + "'";
    } else if (!Account_type && Broker_Symbol) {
        var findAccount = "SELECT * FROM trader_account WHERE Broker_Symbol = '" + Broker_Symbol + "'";
    } else {
        var findAccount = "SELECT * FROM trader_account ";
    }
    connection.query(findAccount, function (err, foundAccount) {
        if (err) {
            throw err;
        }
        res.render("admin/show/search/account", {
            accounts: foundAccount
        });
    });
})

router.get("/show/insert/account", function (req, res) {
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

router.post("/show/insert/test", function (req, res) {
    var test = req.body.name;
    console.log(test);
    res.redirect("/admin/show/insert/account");
})

router.post("/show/insert/account", function (req, res) {
    var PINArr = req.body.PIN;
    console.log(PINArr);
    var Account_BalanceArr = req.body.Account_Balance;
    console.log(Account_BalanceArr);
    var Account_TypeArr = req.body.Account_Type;
    console.log(Account_TypeArr);
    var Trader_Personal_IDArr = req.body.Trader_Personal_ID;
    console.log(Trader_Personal_IDArr);
    var Broker_SymbolArr = req.body.Broker_Symbol;
    console.log(Broker_SymbolArr);
    var i = 0 ;
    for(i =0 ; i < PINArr.length;i++){
        var PIN = PINArr[i];
        console.log(PIN);
        var Account_Balance = Account_BalanceArr[i];
        console.log(Account_Balance);
        var Account_Type = Account_TypeArr[i];
        console.log(Account_Type);
        var Trader_Personal_ID = Trader_Personal_IDArr[i];
        console.log(Trader_Personal_ID);
        var Broker_Symbol = Broker_SymbolArr[i];
        console.log(Broker_Symbol);

        var sql = "INSERT INTO trader_account(PIN,Account_Balance,Account_Type,Trader_Personal_ID,Broker_Symbol) values(" + PIN + "," + Account_Balance + ",'" + Account_Type + "','" + Trader_Personal_ID + "','" + Broker_Symbol + "')";
        connection.query(sql, function (err, result) {
            if (err) {
                throw err;
            }
            console.log("Open Account Success");
        });
    }
    res.redirect("/admin/show/insert/account");
})

router.get("/accounts/:id/edit", function (req, res) {
    console.log(req.params.id);
    var edit = req.params.id;
    var find = "SELECT * FROM trader_account WHERE Account_ID =" + edit + " ";
    connection.query(find, function (err, foundAccounts) {
        if (err) {
            throw err;
        }
        console.log(foundAccounts);
        res.render("admin/edit/account", {
            account: foundAccounts[0]
        });
    })
})

router.put("/accounts/update/:id", function (req, res) {
    console.log(req.params.id);
    var edit = req.params.id;
    var find = "SELECT * FROM trader_account WHERE Account_ID =" + edit + " ";

    connection.query(find, function (err, foundAccounts) {
        if (err) {
            throw err;
        }
        var updateBalance = "UPDATE trader_account SET Account_Balance = " + req.body.Account_Balance + " WHERE Account_ID = " + foundAccounts[0].Account_ID + " ";
        connection.query(updateBalance, function (err, updateDone) {
            if (err) {
                throw err;
            }
            res.redirect("/admin/show/account");
        });
    });
})


router.delete("/accounts/:id", function (req, res) {
    console.log("delete " + req.params.id);
    var remove = "DELETE FROM trader_account WHERE Account_ID = " + req.params.id + " ";
    connection.query(remove, function (err, foundAccounts) {
        if (err) {
            throw err;
        }
        console.log("delete success");
        res.redirect("/admin/show/account");
    })
})

module.exports = router;
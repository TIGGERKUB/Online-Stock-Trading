var express = require("express");
var router = express.Router();
const connection = require("../../connection/connection");

router.get("/accounts", function (req, res) {
    var find = "SELECT a.Account_ID,a.Account_Balance FROM trader_account a,trader_data d WHERE a.Trader_Personal_ID = d.Trader_Personal_ID AND d.Username ='" + req.session.username + "' ";
    connection.query(find, function (err, result) {
        req.session.allAccount = result;
        if (result.length > 0) {
            req.session.currentAccount = result[0].Account_ID;
            req.session.currentBalance = result[0].Account_Balance;
        } else {
            req.session.currentAccount = -1;
            req.session.currentBalance = -1;
        }
        res.redirect("/profiles/accounts/index");
    })
})

router.get("/accounts/index", function (req, res) {
    var find = "SELECT * FROM trader_account a, trader_data d where a.Trader_Personal_ID = d.Trader_Personal_ID AND  d.Username ='" + req.session.username + "'";
    connection.query(find, function (err, foundAccounts) {
        if (err) {
            throw err;
        }
        // console.log(foundAccounts);
        res.render("profiles/showAccount", {
            accounts: foundAccounts
        });
    })
})

router.get("/accounts/new", function (req, res) {
    var find = "SELECT Broker_Symbol FROM broker";
    connection.query(find, function (err, foundBroker) {
        if (err) {
            throw err;
        }
        res.render("profiles/newAccount", {
            brokers: foundBroker
        });
    });
});

router.post("/accounts/new", function (req, res) {
    var broker = req.body.broker;
    var accountType = req.body.Account_type;
    var PIN = req.body.PIN;
    var accountBalance = 0;
    var find = "SELECT Trader_Personal_ID FROM trader_data where username = '" + req.session.username + "'";
    connection.query(find, function (err, foundID) {
        if (err) {
            throw err;
        }
        var ID = foundID[0].Trader_Personal_ID;
        var sql = "INSERT INTO trader_account(PIN,Account_Balance,Account_Type,Trader_Personal_ID,Broker_Symbol) values(" + PIN + "," + accountBalance + ",'" + accountType + "','" + ID + "','" + broker + "')";
        connection.query(sql, function (err, result) {
            if (err) {
                throw err;
            }
            // console.log("Open Account Success");
            res.redirect("/profiles/accounts");
        });
    })
});

router.delete("/accounts/:id", function (req, res) {
    console.log("delete " + req.params.id);
    var remove = "DELETE FROM trader_account WHERE Account_ID = " + req.params.id + " ";
    connection.query(remove, function (err, foundAccounts) {
        if (err) {
            throw err;
        }
        // console.log("delete success");
        res.redirect("/profiles/accounts");
    })
})

router.get("/accounts/:id/edit", function (req, res) {
    // console.log(req.params.id);
    var edit = req.params.id;
    var find = "SELECT * FROM trader_account WHERE Account_ID =" + edit + " ";
    connection.query(find, function (err, foundAccounts) {
        if (err) {
            throw err;
        }
        // console.log(foundAccounts);
        res.render("profiles/edit", {
            account: foundAccounts[0]
        });
    })
})

router.put("/accounts/updatepin/:id", function (req, res) {
    // console.log(req.params.id);
    var edit = req.params.id;
    var find = "SELECT * FROM trader_account WHERE Account_ID =" + edit + " ";

    connection.query(find, function (err, foundAccounts) {
        if (err) {
            throw err;
        }
        var updatePIN = "UPDATE trader_account SET PIN = " + req.body.newPIN + " WHERE Account_ID = " + foundAccounts[0].Account_ID + " ";
        connection.query(updatePIN, function (err, updateDone) {
            if (err) {
                throw err;
            }
            res.redirect("/profiles/accounts");
        });
    });
})

router.get("/transaction", function (req, res) {
    res.render("profiles/transaction");
})

router.post("/transaction", function (req, res) {
    var Transaction_Type = req.body.Transaction_Type;
    var Transaction_Amount = req.body.Transaction_Amount;

    //console.log(Transaction_Type);
    //console.log(Transaction_Amount);
    //console.log(Account_ID);

    var findBalance = "SELECT Account_Balance FROM trader_account WHERE Account_ID =" + req.session.currentAccount + "";
    connection.query(findBalance, function (err, foundBalance) {
        if (err) {
            throw err;
        }
        //console.log(foundBalance[0].Account_Balance);
        if (Transaction_Type === 'Deposit') {
            foundBalance[0].Account_Balance += Number(Transaction_Amount);
            //console.log(foundBalance[0].Account_Balance);
        } else if (Transaction_Type === 'Withdraw') {
            foundBalance[0].Account_Balance = foundBalance[0].Account_Balance - Transaction_Amount;
        } else {
            //console.log("err foundBalance");
            res.redirect("/profiles/transaction");
        }

        if (foundBalance[0].Account_Balance < 0) {
            console.log("err Account_Balance must greater than 0");
            res.redirect("/profiles/transaction");
        }
        var insertTransaction = "INSERT INTO transaction(Transaction_Type,Transaction_Amount,Account_ID) VALUES ('" + Transaction_Type + "'," + Transaction_Amount + "," + req.session.currentAccount + ")";
        connection.query(insertTransaction, function (err, foundTransaction) {
            if (err) {
                throw err;
            }
            var updateBalance = "UPDATE trader_account SET 	Account_Balance = " + foundBalance[0].Account_Balance + " WHERE Account_ID = " + req.session.currentAccount + " ";
            connection.query(updateBalance, function (err, foundupdateBalance) {
                if (err) {
                    throw err;
                }
                res.redirect("/profiles/accounts");
            })
        })
    })
})


router.get("/history", function (req, res) {
    var findTransaction = "SELECT * FROM transaction WHERE Account_ID = '" + req.session.currentAccount + "'";
    var findOrder = "SELECT * FROM stock_order WHERE Order_Status !='Q' AND Account_ID = '" + req.session.currentAccount + "'";
    connection.query(findTransaction, function (err, foundfindTransactions) {
        if (err) throw err;
        connection.query(findOrder, function (err, foundOrder) {
            if (err) throw err;
            res.render("profiles/history", {
                transactions: foundfindTransactions,
                orders: foundOrder,
            });
        })
    })
})

router.get("/portfolio", function (req, res) {
    var sql = "SELECT * FROM portfolio WHERE Account_ID = '" + req.session.currentAccount + "' "
    connection.query(sql, function (err, portfolio) {
        if (err) throw err;
        res.render("profiles/portfolio",{portfolios:portfolio});
    })
})

module.exports = router;
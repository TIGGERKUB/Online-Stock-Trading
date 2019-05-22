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
router.get("/show/search/account",function(req,res){
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

router.post("/show/search/account",function(req,res){
    var Account_type = req.body.Account_type;
    var Broker_Symbol = req.body.searchStock;
    if(Account_type && Broker_Symbol){
        var findAccount = "SELECT * FROM trader_account WHERE Account_type = '"+Account_type+"' AND Broker_Symbol ='"+Broker_Symbol+"'";
    }else if(Account_type && !Broker_Symbol){
        var findAccount = "SELECT * FROM trader_account WHERE Account_type = '"+Account_type+"'";
    }else if(!Account_type && Broker_Symbol){
        var findAccount = "SELECT * FROM trader_account WHERE Broker_Symbol = '"+Broker_Symbol+"'";
    }else{
        var findAccount = "SELECT * FROM trader_account ";
    }
    connection.query(findAccount,function(err,foundAccount){
        if(err){
            throw err;
        }
        res.render("admin/show/search/account",{accounts:foundAccount});
    });
})

router.get("/show/insert/account",function(req,res){
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

router.get("/accounts/:id/edit",function(req,res){
    console.log(req.params.id);
    var edit = req.params.id;
    var find = "SELECT * FROM trader_account WHERE Account_ID ="+edit+" ";
    connection.query(find,function(err,foundAccounts){
        if(err){
            throw err;
        }
        console.log(foundAccounts);
        res.render("admin/edit/account",{account:foundAccounts[0]});
    })
})

router.put("/accounts/update/:id",function(req,res){
    console.log(req.params.id);
    var edit = req.params.id;
    var find = "SELECT * FROM trader_account WHERE Account_ID ="+edit+" ";

    connection.query(find,function(err,foundAccounts){
            if(err){
                throw err;
            }
            var updateBalance = "UPDATE trader_account SET Account_Balance = "+req.body.Account_Balance+" WHERE Account_ID = "+foundAccounts[0].Account_ID+" ";
            connection.query(updateBalance,function(err,updateDone){
                if(err){
                    throw err;
                }
                res.redirect("/admin/show/account");
            });
        });
})


router.delete("/accounts/:id",function(req,res){
    console.log("delete " +req.params.id);
    var remove = "DELETE FROM trader_account WHERE Account_ID = "+req.params.id+" ";
    connection.query(remove,function(err,foundAccounts){
        if(err){
            throw err;
        }
        console.log("delete success");
        res.redirect("/admin/show/account");
    })
})

module.exports = router;
var express = require("express");
var router = express.Router();
const connection = require("../../connection/connection");

router.get("/",function(req,res){
    var findOrder = "SELECT * FROM stock_order"
    var findTransaction = "SELECT * FROM transaction"
    connection.query(findTransaction,function(err,foundTransaction){
        if(err){
            throw err;
        }
        connection.query(findOrder,function(err,foundOrder){
            if(err){
                throw err;
            }
            res.render("admin/index",{orders:foundOrder,transactions:foundTransaction});
        });
    });
})

router.get("/show/member",function(req,res){
    var findMember = "SELECT * FROM trader_data"
    connection.query(findMember,function(err,foundMember){
        if(err){
            throw err;
        }
        res.render("admin/show/member",{members:foundMember});
    });
})


router.get("/show/account",function(req,res){
    var findAccount = "SELECT * FROM trader_account"
    connection.query(findAccount,function(err,foundAccount){
        if(err){
            throw err;
        }
        res.render("admin/show/account",{accounts:foundAccount});
    });
})
router.get('/search',function(req,res){
    connection.query('SELECT Broker_Symbol from trader_account where Broker_Symbol like "%'+req.query.key+'%"', function(err, rows, fields) {
          if (err) throw err;
        var data=[];
        for(i=0;i<rows.length;i++)
          {
            console.log(rows[i].Broker_Symbol);
            data.push(rows[i].Broker_Symbol);
          }
          res.end(JSON.stringify(data));
        });
    });

router.post("/show/account",function(req,res){
    var Account_type = req.body.Account_type;
    var Broker_Symbol = req.body.searchStock;
    if(Account_type && Broker_Symbol){
        var findAccount = "SELECT * FROM trader_account WHERE Account_type = '"+Account_type+"' AND Broker_Symbol ='"+Broker_Symbol+"'";
    }else if(Account_type && !Broker_Symbol){
        var findAccount = "SELECT * FROM trader_account WHERE Account_type = '"+Account_type+"'";
    }else if(!Account_type && Broker_Symbol){
        var findAccount = "SELECT * FROM trader_account WHERE Broker_Symbol = '"+Broker_Symbol+"'";
    }else{
        var findAccount = "SELECT * FROM trader_account WHERE Account_type = '"+Account_type+"'";
    }
    connection.query(findAccount,function(err,foundAccount){
        if(err){
            throw err;
        }
        res.render("admin/show/account",{accounts:foundAccount});
    });
})


router.get("/show/transaction",function(req,res){
    var findTransaction = "SELECT * FROM transaction"
    connection.query(findTransaction,function(err,foundTransaction){
        if(err){
            throw err;
        }
        res.render("admin/show/transaction",{transactions:foundTransaction});
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
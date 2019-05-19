var express = require("express");
var router = express.Router();
const connection = require("../../connection/connection");


router.get("/",function(req,res){
    var findStock = "SELECT * FROM stock_symbol";
    connection.query(findStock,function(err,foundSymbols){
        if(err){
            throw err;
        }
        var findAccounts = "SELECT * FROM trader_account a, trader_data d where a.Trader_Personal_ID = d.Trader_Personal_ID AND  d.Username ='"+req.session.username+"'";
        connection.query(findAccounts,function(err,foundAccounts){
            if(err){
                throw err;
            }
            var findOrder = "SELECT * FROM stock_order o, trader_account a, trader_data d where o.Account_ID = a.Account_ID AND a.Trader_Personal_ID = d.Trader_Personal_ID AND  d.Username ='"+req.session.username+"';"
            connection.query(findOrder,function(err,foundOrder){
                if(err){
                    throw err;
                }
                console.log(foundOrder);
            res.render("trade",{stock:"",symbols:foundSymbols,accounts:foundAccounts,orders:foundOrder});
            })
        })
    })
})

router.post("/",function(req,res){
    var findStock = "SELECT * FROM stock_symbol";
    var PIN = req.body.PIN;
    var findAccounts = "SELECT * FROM trader_account a, trader_data d where a.Trader_Personal_ID = d.Trader_Personal_ID AND  d.Username ='"+req.session.username+"'";
    connection.query(findAccounts,function(err,foundAccounts){
        if(err){
            throw err;
        }
        connection.query(findStock,function(err,foundSymbols){
            if(err){
                throw err;
            }
            var searchStock = req.body.searchStock;
            console.log(searchStock);
            var findStock = "SELECT * FROM stock_symbol WHERE Stock_Symbol = '"+searchStock+"' ";
            connection.query(findStock,function(err,foundStocks){
                if(err){
                    throw err;
                }
                if(PIN){
                    var Order_No = Math.floor(Math.random() * 999999) + 100000;
                    var Order_Type = req.body.Order_Type;
                    var Stock_Symbol = req.body.Stock_Symbol;
                    var Order_Price = req.body.Order_Price;
                    var Order_Volume = req.body.Order_Volume;
                    var Order_Status = "Q";
                    var Account_ID = req.body.Account_ID;
                    console.log(Order_No);
                    console.log(Order_Type);
                    console.log(Stock_Symbol);
                    console.log(Order_Price);
                    console.log(Order_Volume);
                    console.log(Order_Status);
                    console.log(Account_ID);
                    var saveOrder = "INSERT INTO stock_order(Order_No,Order_Status,Order_Price,Order_Type,Order_Volume,Stock_Symbol,Account_ID) VALUES("+Order_No+",'"+Order_Status+"',"+Order_Price+",'"+Order_Type+"','"+Order_Volume+"','"+Stock_Symbol+"','"+Account_ID+"')";
                    connection.query(saveOrder,function(err,foundsaveOrder){
                        if(err){
                            throw err;
                        }
                    });
                }
                // res.render("trade",{stock:foundStocks[0],symbols:foundSymbols,accounts:foundAccounts});
                res.redirect("/trade");
            })
        });
    });
})


module.exports = router;
var express = require("express");
var router = express.Router();
const connection = require("../../connection/connection");




router.get("/", function (req, res) {
    var date = today();
    cancelOrderDate();
    matchOrder();
    var findOrder = "SELECT Order_No,TIME(Order_Time) as Order_Time,Order_Status,Order_Price,Order_Type,Order_Volume,Stock_Symbol,Account_ID FROM stock_order where Account_ID = '" + req.session.currentAccount + "' AND DATE(Order_Time) = '" + date + "' AND Order_Status ='Q'"
    connection.query(findOrder, function (err, foundOrder) {
        if (err) {
            throw err;
        }
        res.render("trade", {
            stock: "",
            orders: foundOrder
        })
    })
})

router.post("/", function (req, res) {
    var PIN = req.body.PIN;
    var searchStock = req.body.searchStock;
    console.log(searchStock);
    var findStock = "SELECT * FROM stock_symbol WHERE Stock_Symbol = '" + searchStock + "' ";
    connection.query(findStock, function (err, foundStocks) {
        if (err) {
            throw err;
        }
        if (PIN) {
            var Order_Type = req.body.Order_Type;
            var Stock_Symbol = req.body.Stock_Symbol;
            var Order_Price = req.body.Order_Price;
            var Order_Volume = req.body.Order_Volume;
            var Order_Status = "Q";

            // console.log(Order_Type);
            // console.log(Stock_Symbol);
            // console.log(Order_Price);
            // console.log(Order_Volume);
            // console.log(Order_Status);
            // console.log(Account_ID);
            var checkSymbol = "SELECT Stock_Symbol FROM stock_symbol WHERE Stock_Symbol = '" + Stock_Symbol + "'"
            connection.query(checkSymbol, function (err, check) {
                if (err) {
                    throw err;
                }
                console.log(check.length);
                if (check.length > 0) {
                    var saveOrder = "INSERT INTO stock_order(Order_Status,Order_Price,Order_Type,Order_Volume,Stock_Symbol,Account_ID) VALUES('" + Order_Status + "'," + Order_Price + ",'" + Order_Type + "','" + Order_Volume + "','" + Stock_Symbol + "','" + req.session.currentAccount + "')";
                    connection.query(saveOrder, function (err, foundsaveOrder) {
                        if (err) throw err;
                    });
                }
                console.log("Sorry -- Symbol is not found");
            })
        }
        matchOrder();
        var date = today();
        var findOrder = "SELECT Order_No,TIME(Order_Time) as Order_Time,Order_Status,Order_Price,Order_Type,Order_Volume,Stock_Symbol,Account_ID FROM stock_order where Account_ID = '" + req.session.currentAccount + "' AND DATE(Order_Time) = '" + date + "' AND Order_Status ='Q'"
        connection.query(findOrder, function (err, foundOrder) {
            if (err) {
                throw err;
            }
            res.render("trade", {
                stock: foundStocks[0],
                orders: foundOrder
            });
            // res.redirect("/trade");
        })
    })
})


router.put("/cancel/:id", function (req, res) {
    var cancel = req.params.id;
    var updateCancel = "UPDATE stock_order SET Order_Status = 'C'  WHERE Order_No = " + cancel + " ";
    connection.query(updateCancel, function (err, foundOrder) {
        if (err) throw err;
        res.redirect("/trade");
    })
})

function today() {
    var today = new Date();
    var dd = String(today.getDate()).padStart(2, '0');
    var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
    var yyyy = today.getFullYear();
    today = yyyy + '-' + mm + '-' + dd;
    return (today);
}

function matchOrder() {
    var date = today();
    console.log(date);
    var sellOrders = "SELECT * FROM stock_order WHERE Order_Status ='Q' AND DATE(Order_Time) = '" + date + "' AND Order_Type = 'Sell'"
    var buyOrders = "SELECT * FROM stock_order WHERE Order_Status ='Q' AND DATE(Order_Time) = '" + date + "' AND Order_Type = 'Buy'"
    connection.query(sellOrders, function (err, foundSells) {
        if (err) throw err;
        connection.query(buyOrders, function (err, foundBuys) {
            if (err) throw err;
            foundSells.forEach(function (sell) {
                foundBuys.forEach(function (buy) {
                    if (sell.Order_Price === buy.Order_Price) {
                        var saveMatchData = "INSERT INTO match_data(Match_Price,Match_Volume) VALUES('" + sell.Order_Price + "','" + sell.Order_Volume + "')"
                        connection.query(saveMatchData, function (err, save) {
                            if (err) throw err;
                        })
                        var findMatchID = "SELECT MAX(Match_ID) AS Match_ID FROM match_data"
                        connection.query(findMatchID, function (err, foundMatchID) {
                            if (err) throw err;
                            var matchID = foundMatchID[0].Match_ID;
                            var saveMatchOrderSell = "INSERT INTO match_order(Order_No,Match_No) VALUES('" + sell.Order_No + "','" + matchID + "')"
                            connection.query(saveMatchOrderSell, function (err, MatchOrderSell) {
                                if (err) throw err;
                                console.log("kuy");
                            })
                            var saveMatchOrderBuy = "INSERT INTO match_order(Order_No,Match_No) VALUES('" + buy.Order_No + "','" + matchID + "')"
                            connection.query(saveMatchOrderBuy, function (err, MatchOrderBuyy) {
                                if (err) throw err;
                                var updateStatus = "UPDATE stock_order SET Order_Status = 'M' WHERE Order_No ='" + sell.Order_No + "' OR Order_No ='" + buy.Order_No + "' "
                                connection.query(updateStatus, function (err, updateM) {
                                    if (err) throw err;
                                    console.log("Match No : " + matchID + " Order sell : " + sell.Order_No + " Order buy : " + buy.Order_No);
                                })
                            })
                        })
                    }
                })
            })
        })
    })
}

function cancelOrderDate() {
    var findOrder = "SELECT Order_No FROM stock_order WHERE DATE(Order_Time) != CURDATE() AND Order_Status= 'Q' "
    connection.query(findOrder, function (err, foundOrder) {
        if (err) throw err;
        foundOrder.forEach(function (OrderNo) {
            var updateStatus = "UPDATE stock_order SET Order_Status = 'C' WHERE Order_No = '" + OrderNo.Order_No + "'"
            connection.query(updateStatus, function (err, foundOrder) {
                if (err) throw err;
            })
        })
    })
}


// middlewareObj.isLoggedIn = function(req,res,next){
//     if(req.isAuthenticated()){
//         return next();
//     }
//     req.flash("error","YOU NEED TO BE LOGGED IN TO DO THAT!");
//     res.redirect("/login");
// }



module.exports = router;
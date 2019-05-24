var express = require("express");
var router = express.Router();
const connection = require("../../connection/connection");


router.get("/",function(req,res){
    res.render("marketData/index",{stock:""});
})

router.post("/",function(req,res){
    var searchStock = req.body.searchStock;
    console.log("search  = ",searchStock);
    var findStock = "SELECT * FROM stock_symbol WHERE Stock_Symbol = '"+searchStock+"' ";
    connection.query(findStock,function(err,foundStocks){
        if(err){
            throw err;
        }
        console.log(foundStocks[0]);
        res.render("marketData/index",{stock:foundStocks[0]});
    })
})

router.get('/search',function(req,res){
    connection.query('SELECT Stock_Symbol from stock_symbol where Stock_Symbol like "%'+req.query.key+'%"', function(err, rows, fields) {
          if (err) throw err;
        var data=[];
        for(i=0;i<rows.length;i++)
          {
            console.log(rows[i].Stock_Symbol);
            data.push(rows[i].Stock_Symbol);
          }
          res.end(JSON.stringify(data));
        });
    });

module.exports = router;
var express = require("express");
var router = express.Router();
const connection = require("../../connection/connection");


router.get("/", function (req, res) {
    res.render("marketData/index", {
        stock: ""
    });
})

router.post("/", function (req, res) {
    var searchStock = req.body.searchStock;
    console.log("search  = ", searchStock);
    var sqlGraphStock = "SELECT DAY(stock_date) as day,last_price FROM stock_data WHERE Stock_Symbol = '"+searchStock+"'"
    connection.query(sqlGraphStock, function (err, graph) {
        if (err) throw err;
        var day=[];
        var price = [];
        for (var i = 0; i < graph.length; i++) {
            day[i] = graph[i].day;
            price[i] = graph[i].last_price;
        }
        console.log(day);
        console.log(price);
        var findStock = "SELECT * FROM last_price_stock WHERE Stock_Symbol = '" + searchStock + "' ";
        var historyPrice = "SELECT * FROM `stock_data` WHERE Stock_Symbol = '" + searchStock + "' ORDER BY stock_date DESC"
        var company = "SELECT c.Company_Name,c.volume,c.Company_Owner_Name,c.Company_Address,c.Company_Phone,c.Company_Industry_group FROM company c,stock_symbol s WHERE c.Company_Name = s.Company_Name AND s.Stock_Symbol = '" + searchStock + "'"
        connection.query(findStock, function (err, foundStocks) {
            if (err) throw err;
            connection.query(historyPrice, function (err, foundhistoryPrice) {
                if (err) throw err;
                connection.query(company, function (err,foundcompany) {
                    if (err) throw err;
                    // console.log(foundStocks[0]);
                    console.log(foundcompany[0]);
                    res.render("marketData/index", {
                        stock: foundStocks[0],
                        historyPrice:foundhistoryPrice,
                        company:foundcompany[0],
                        day:day,
                        price:price
                    });
                })
            })
        })
    })
})

router.get('/search', function (req, res) {
    connection.query('SELECT Stock_Symbol from stock_symbol where Stock_Symbol like "%' + req.query.key + '%"', function (err, rows, fields) {
        if (err) throw err;
        var data = [];
        for (i = 0; i < rows.length; i++) {
            console.log(rows[i].Stock_Symbol);
            data.push(rows[i].Stock_Symbol);
        }
        res.end(JSON.stringify(data));
    });
});

module.exports = router;
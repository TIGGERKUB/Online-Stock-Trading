var express = require("express");
var router = express.Router();
const connection = require("../../connection/connection");


router.get("/", function (req, res) {
    var today = new Date();
    today = convertDate(today);
    console.log("today " + today);
    var SET = "SELECT * FROM market_data WHERE Market_Type = 'SET' ORDER BY `market_data`.`stock_date` ASC";
    var mai = "SELECT * FROM market_data WHERE Market_Type = 'mai' ORDER BY `market_data`.`stock_date` ASC";
    connection.query(SET, function (err, foundSET) {
        if (err) throw err;
        connection.query(mai, function (err, foundmai) {
            if (err) throw err;
            var lastArrSET = foundSET.length;
            var lastArrMai = foundmai.length;
            var topGainer = "SELECT d.Stock_Symbol,d.last_price,d.price_change,d.stock_value,d.stock_volume FROM stock_data d,stock_symbol s WHERE d.Stock_Symbol = s.Stock_Symbol AND s.Market_Type = 'SET' GROUP BY d.Stock_Symbol ORDER BY `d`.`price_change` DESC"
            connection.query(topGainer, function (err,top_Gainer) {
                if (err) throw err;
                res.render("home/index", {
                    market_SET: foundSET[lastArrSET - 1],
                    market_mai: foundmai[lastArrMai - 1],
                    topGainers:top_Gainer
                });
            })
        })
    })
})


function convertDate(getDate) {
    var dateFormat = new Date(getDate);
    var dd = String(dateFormat.getDate()).padStart(2, '0');
    var mm = String(dateFormat.getMonth() + 1).padStart(2, '0'); //January is 0!
    var yyyy = dateFormat.getFullYear();
    dateFormat = yyyy + '-' + mm + '-' + dd;
    return (dateFormat);
}


module.exports = router;
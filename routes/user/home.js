var express = require("express");
var router = express.Router();
const connection = require("../../connection/connection");

router.get("/", function (req, res) {
    var sqlGraphSET = "SELECT DAY(stock_date) as day,last_price FROM market_data WHERE Market_Type = 'SET'"
    connection.query(sqlGraphSET, function (err, graphSET) {
        if (err) throw err;
        var sqlGraphmai = "SELECT DAY(stock_date) as day,last_price FROM market_data WHERE Market_Type = 'mai'"
        connection.query(sqlGraphmai, function (err, graphMAI) {
            if (err) throw err;
            var daySET = [];
            var priceSET = [];
            var dayMAI = [];
            var priceMAI = [];
            for (var i = 0; i < graphSET.length; i++) {
                daySET[i] = graphSET[i].day;
                priceSET[i] = graphSET[i].last_price;
            }
            for (var i = 0; i < graphMAI.length; i++) {
                dayMAI[i] = graphMAI[i].day;
                priceMAI[i] = graphMAI[i].last_price;
            }
            // console.log(daySET);
            // console.log(priceSET);
            // console.log(dayMAI);
            // console.log(priceMAI);
            var lastMarket = "SELECT * FROM last_price_market"
            connection.query(lastMarket, function (err, market) {
                if (err) throw err;
                var search = "SELECT * FROM last_price_stock l,stock_symbol s WHERE l.Stock_Symbol = s.Stock_Symbol AND s.Market_Type = 'SET' ORDER BY l.price_change DESC"
                connection.query(search, function (err, top) {
                    if (err) throw err;
                    res.render("home/index", {
                        daySET: daySET,
                        priceSET: priceSET,
                        dayMAI: dayMAI,
                        priceMAI: priceMAI,
                        markets: market,
                        tops: top,
                        currentMarket: "SET",
                        currentTop: "gainer",
                        currentTopShow: "Top 10 gainer"
                    });
                })
            })
        })
    })
})

router.get("/index/SET/gainer", function (req, res) {
    var sqlGraphSET = "SELECT DAY(stock_date) as day,last_price FROM market_data WHERE Market_Type = 'SET'"
    connection.query(sqlGraphSET, function (err, graphSET) {
        if (err) throw err;
        var sqlGraphmai = "SELECT DAY(stock_date) as day,last_price FROM market_data WHERE Market_Type = 'mai'"
        connection.query(sqlGraphmai, function (err, graphMAI) {
            if (err) throw err;
            var daySET = [];
            var priceSET = [];
            var dayMAI = [];
            var priceMAI = [];
            for (var i = 0; i < graphSET.length; i++) {
                daySET[i] = graphSET[i].day;
                priceSET[i] = graphSET[i].last_price;
            }
            for (var i = 0; i < graphMAI.length; i++) {
                dayMAI[i] = graphMAI[i].day;
                priceMAI[i] = graphMAI[i].last_price;
            }
            // console.log(daySET);
            // console.log(priceSET);
            // console.log(dayMAI);
            // console.log(priceMAI);
            var lastMarket = "SELECT * FROM last_price_market"
            var search = "SELECT * FROM last_price_stock l,stock_symbol s WHERE l.Stock_Symbol = s.Stock_Symbol AND s.Market_Type = 'SET' ORDER BY l.price_change DESC"
            connection.query(lastMarket, function (err, market) {
                if (err) throw err;
                connection.query(search, function (err, top) {
                    if (err) throw err;
                    res.render("home/index", {
                        daySET: daySET,
                        priceSET: priceSET,
                        dayMAI: dayMAI,
                        priceMAI: priceMAI,
                        markets: market,
                        tops: top,
                        currentMarket: "SET",
                        currentTop: "gainer",
                        currentTopShow: "Top 10 gainer"
                    });
                })
            })
        })
    })
})



router.get("/index/SET/top_volume", function (req, res) {
    var sqlGraphSET = "SELECT DAY(stock_date) as day,last_price FROM market_data WHERE Market_Type = 'SET'"
    connection.query(sqlGraphSET, function (err, graphSET) {
        if (err) throw err;
        var sqlGraphmai = "SELECT DAY(stock_date) as day,last_price FROM market_data WHERE Market_Type = 'mai'"
        connection.query(sqlGraphmai, function (err, graphMAI) {
            if (err) throw err;
            var daySET = [];
            var priceSET = [];
            var dayMAI = [];
            var priceMAI = [];
            for (var i = 0; i < graphSET.length; i++) {
                daySET[i] = graphSET[i].day;
                priceSET[i] = graphSET[i].last_price;
            }
            for (var i = 0; i < graphMAI.length; i++) {
                dayMAI[i] = graphMAI[i].day;
                priceMAI[i] = graphMAI[i].last_price;
            }
            // console.log(daySET);
            // console.log(priceSET);
            // console.log(dayMAI);
            // console.log(priceMAI);
            var lastMarket = "SELECT * FROM last_price_market"
            var search = "SELECT * FROM last_price_stock l,stock_symbol s WHERE l.Stock_Symbol = s.Stock_Symbol AND s.Market_Type = 'SET' ORDER BY l.stock_volume DESC"
            connection.query(lastMarket, function (err, market) {
                if (err) throw err;
                connection.query(search, function (err, top) {
                    if (err) throw err;
                    res.render("home/index", {
                        daySET: daySET,
                        priceSET: priceSET,
                        dayMAI: dayMAI,
                        priceMAI: priceMAI,
                        markets: market,
                        tops: top,
                        currentMarket: "SET",
                        currentTop: "top_volume",
                        currentTopShow: "Top 20 stocks volume tradingr"
                    });
                })
            })
        })
    })
})


router.get("/index/SET/top_value", function (req, res) {
    var sqlGraphSET = "SELECT DAY(stock_date) as day,last_price FROM market_data WHERE Market_Type = 'SET'"
    connection.query(sqlGraphSET, function (err, graphSET) {
        if (err) throw err;
        var sqlGraphmai = "SELECT DAY(stock_date) as day,last_price FROM market_data WHERE Market_Type = 'mai'"
        connection.query(sqlGraphmai, function (err, graphMAI) {
            if (err) throw err;
            var daySET = [];
            var priceSET = [];
            var dayMAI = [];
            var priceMAI = [];
            for (var i = 0; i < graphSET.length; i++) {
                daySET[i] = graphSET[i].day;
                priceSET[i] = graphSET[i].last_price;
            }
            for (var i = 0; i < graphMAI.length; i++) {
                dayMAI[i] = graphMAI[i].day;
                priceMAI[i] = graphMAI[i].last_price;
            }
            // console.log(daySET);
            // console.log(priceSET);
            // console.log(dayMAI);
            // console.log(priceMAI);
            var lastMarket = "SELECT * FROM last_price_market"
            var search = "SELECT * FROM last_price_stock l,stock_symbol s WHERE l.Stock_Symbol = s.Stock_Symbol AND s.Market_Type = 'SET' ORDER BY l.stock_value DESC"
            connection.query(lastMarket, function (err, market) {
                if (err) throw err;
                connection.query(search, function (err, top) {
                    if (err) throw err;
                    res.render("home/index", {
                        daySET: daySET,
                        priceSET: priceSET,
                        dayMAI: dayMAI,
                        priceMAI: priceMAI,
                        markets: market,
                        tops: top,
                        currentMarket: "SET",
                        currentTop: "top_value",
                        currentTopShow: "Top 20 stocks value tradingr"
                    });
                })
            })
        })
    })
})

router.get("/index/mai/gainer", function (req, res) {
    var sqlGraphSET = "SELECT DAY(stock_date) as day,last_price FROM market_data WHERE Market_Type = 'SET'"
    connection.query(sqlGraphSET, function (err, graphSET) {
        if (err) throw err;
        var sqlGraphmai = "SELECT DAY(stock_date) as day,last_price FROM market_data WHERE Market_Type = 'mai'"
        connection.query(sqlGraphmai, function (err, graphMAI) {
            if (err) throw err;
            var daySET = [];
            var priceSET = [];
            var dayMAI = [];
            var priceMAI = [];
            for (var i = 0; i < graphSET.length; i++) {
                daySET[i] = graphSET[i].day;
                priceSET[i] = graphSET[i].last_price;
            }
            for (var i = 0; i < graphMAI.length; i++) {
                dayMAI[i] = graphMAI[i].day;
                priceMAI[i] = graphMAI[i].last_price;
            }
            // console.log(daySET);
            // console.log(priceSET);
            // console.log(dayMAI);
            // console.log(priceMAI);
            var lastMarket = "SELECT * FROM last_price_market"
            var search = "SELECT * FROM last_price_stock l,stock_symbol s WHERE l.Stock_Symbol = s.Stock_Symbol AND s.Market_Type = 'mai' ORDER BY l.price_change DESC"
            connection.query(lastMarket, function (err, market) {
                if (err) throw err;
                connection.query(search, function (err, top) {
                    if (err) throw err;
                    res.render("home/index", {
                        daySET: daySET,
                        priceSET: priceSET,
                        dayMAI: dayMAI,
                        priceMAI: priceMAI,
                        markets: market,
                        tops: top,
                        currentMarket: "mai",
                        currentTop: "gainer",
                        currentTopShow: "Top 10 gainer"
                    });
                })
            })
        })
    })
})



router.get("/index/mai/top_volume", function (req, res) {
    var sqlGraphSET = "SELECT DAY(stock_date) as day,last_price FROM market_data WHERE Market_Type = 'SET'"
    connection.query(sqlGraphSET, function (err, graphSET) {
        if (err) throw err;
        var sqlGraphmai = "SELECT DAY(stock_date) as day,last_price FROM market_data WHERE Market_Type = 'mai'"
        connection.query(sqlGraphmai, function (err, graphMAI) {
            if (err) throw err;
            var daySET = [];
            var priceSET = [];
            var dayMAI = [];
            var priceMAI = [];
            for (var i = 0; i < graphSET.length; i++) {
                daySET[i] = graphSET[i].day;
                priceSET[i] = graphSET[i].last_price;
            }
            for (var i = 0; i < graphMAI.length; i++) {
                dayMAI[i] = graphMAI[i].day;
                priceMAI[i] = graphMAI[i].last_price;
            }
            // console.log(daySET);
            // console.log(priceSET);
            // console.log(dayMAI);
            // console.log(priceMAI);
            var lastMarket = "SELECT * FROM last_price_market"
            var search = "SELECT * FROM last_price_stock l,stock_symbol s WHERE l.Stock_Symbol = s.Stock_Symbol AND s.Market_Type = 'mai' ORDER BY l.stock_volume DESC"
            connection.query(lastMarket, function (err, market) {
                if (err) throw err;
                connection.query(search, function (err, top) {
                    if (err) throw err;
                    res.render("home/index", {
                        daySET: daySET,
                        priceSET: priceSET,
                        dayMAI: dayMAI,
                        priceMAI: priceMAI,
                        markets: market,
                        tops: top,
                        currentMarket: "mai",
                        currentTop: "top_volume",
                        currentTopShow: "Top 20 stocks volume tradingr"
                    });
                })
            })
        })
    })
})


router.get("/index/mai/top_value", function (req, res) {
    var sqlGraphSET = "SELECT DAY(stock_date) as day,last_price FROM market_data WHERE Market_Type = 'SET'"
    connection.query(sqlGraphSET, function (err, graphSET) {
        if (err) throw err;
        var sqlGraphmai = "SELECT DAY(stock_date) as day,last_price FROM market_data WHERE Market_Type = 'mai'"
        connection.query(sqlGraphmai, function (err, graphMAI) {
            if (err) throw err;
            var daySET = [];
            var priceSET = [];
            var dayMAI = [];
            var priceMAI = [];
            for (var i = 0; i < graphSET.length; i++) {
                daySET[i] = graphSET[i].day;
                priceSET[i] = graphSET[i].last_price;
            }
            for (var i = 0; i < graphMAI.length; i++) {
                dayMAI[i] = graphMAI[i].day;
                priceMAI[i] = graphMAI[i].last_price;
            }
            // console.log(daySET);
            // console.log(priceSET);
            // console.log(dayMAI);
            // console.log(priceMAI);
            var lastMarket = "SELECT * FROM last_price_market"
            var search = "SELECT * FROM last_price_stock l,stock_symbol s WHERE l.Stock_Symbol = s.Stock_Symbol AND s.Market_Type = 'mai' ORDER BY l.stock_value DESC"
            connection.query(lastMarket, function (err, market) {
                if (err) throw err;
                connection.query(search, function (err, top) {
                    if (err) throw err;
                    res.render("home/index", {
                        daySET: daySET,
                        priceSET: priceSET,
                        dayMAI: dayMAI,
                        priceMAI: priceMAI,
                        markets: market,
                        tops: top,
                        currentMarket: "mai",
                        currentTop: "top_value",
                        currentTopShow: "Top 20 stocks value tradingr"
                    });
                })
            })
        })
    })
})


module.exports = router;
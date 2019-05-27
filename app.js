var express = require("express");
var app = express();
var bodyParser = require("body-parser");
var session = require('express-session');
var methodOverride = require("method-override");
var expressSanitizer = require("express-sanitizer");



//requring route
var home = require("./routes/user/home");
var welcome = require("./routes/user/welcome");
var marketData = require("./routes/user/marketData");
var profiles = require("./routes/user/profiles");
var trade = require("./routes/user/trade");
var auth = require("./routes/auth");
var admin = require("./routes/admin/index");
var adminAccount = require("./routes/admin/account");

app.use(bodyParser.urlencoded({extended: true}));
app.set("view engine","ejs");
app.use(express.static("public"));
app.use(express.static("JS"));
app.use(session({
	secret: 'secret',
	resave: true,
	saveUninitialized: true
}));

app.use(function(req,res,next){
    res.locals.CurrentPage = req.session.page;
    res.locals.currentUser = req.session.username;
    res.locals.allAccount = req.session.allAccount;
    res.locals.currentAccount = req.session.currentAccount;
    res.locals.currentBalance = req.session.currentBalance;
    next();
})

app.use(methodOverride("_method"));
app.use(expressSanitizer());


app.use("/",auth);
app.use("/",home);
app.use("/welcome",welcome);
app.use("/market_data",marketData);
app.use("/profiles",profiles);
app.use("/trade",trade);
app.use("/admin",admin);
app.use("/admin",adminAccount);


var server=app.listen(3000,function(){
    console.log("We have started our server on port 3000");
});
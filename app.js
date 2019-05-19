var express = require("express");
var app = express();
var bodyParser = require("body-parser");
var session = require('express-session');
var methodOverride = require("method-override");
var expressSanitizer = require("express-sanitizer");



//requring route
var marketData = require("./routes/user/marketData");
var profiles = require("./routes/user/profiles");
var trade = require("./routes/user/trade");
var auth = require("./routes/auth");
var admin = require("./routes/admin/index");

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
    res.locals.currentUser = req.session.username;
    next();
})

app.use(methodOverride("_method"));
app.use(expressSanitizer());


app.use("/",auth);
app.use("/market_data",marketData);
app.use("/profiles",profiles);
app.use("/trade",trade);
app.use("/admin",admin);

app.get("/",function(req,res){
    res.render("home/index");
})


var server=app.listen(3000,function(){
    console.log("We have started our server on port 3000");
});
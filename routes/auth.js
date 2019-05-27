var express = require("express");
var router = express.Router();
const connection = require("../connection/connection");



//auth route
/// show sign up form
router.get("/register", function (req, res) {
    res.render("register");
});

//handling user sign up
router.post("/register", function (req, res) {
    var personal_ID = req.body.personal_ID;
    var username = req.body.username;
    var password = req.body.password;
    var Fname = req.body.FirstName;
    var Lname = req.body.LastName;
    var email = req.body.email;
    var phone = req.body.phone;
    var age = req.body.age;
    var address = req.body.address;
    var bankName = req.body.bankName;
    var bankAccount = req.body.bank_Account;
    // console.log(personal_ID);
    // console.log(username);
    // console.log(password);
    // console.log(Fname);
    // console.log(Lname);
    // console.log(email);
    // console.log(phone);
    // console.log(age);
    // console.log(address);
    // console.log(bankName);
    // console.log(bankAccount);

    var sql = "INSERT INTO trader_data(Trader_Personal_ID,Username,Password,Trader_Fname,Trader_Lname,Trader_Age,Trader_Address,Trader_Email,Trader_Phone) values ('" + personal_ID + "','" + username + "','" + password + "','" + Fname + "','" + Lname + "'," + age + ",'" + address + "','" + email + "','" + phone + "')";
    connection.query(sql, function (err, result) {
        if (err) {
            throw err;
        } else {
            var sql2 = "INSERT INTO bank_account(Bank_Account_Number,Bank_Account_Name,Trader_Personal_ID) values ('" + bankAccount + "','" + bankName + "','" + personal_ID + "')";
            connection.query(sql2, function (err, result) {
                if (err) {
                    throw err;
                } else {
                    console.log("Insert Complete");
                    req.session.username = username;
                    res.redirect("/");
                }
            })
        }
    })
});


//handling user sign in
router.post("/login", function (req, res) {
    var username = req.body.username;
    var password = req.body.password;
    if (username && password) {
        connection.query('SELECT * FROM trader_data WHERE username = ? AND password = ?', [username, password], function (error, results, fields) {
            if (results.length > 0) {
                req.session.loggedin = true;
                req.session.username = username;
                res.redirect('/storeAccountUser');
            } else {
                res.redirect('/');
            }
            res.end();
        });
    } else {
        res.send('Please enter Username and Password!');
        res.end();
    }
});


//logout routes
router.get("/logout", function (req, res) {
    req.session.destroy();
    res.redirect("/");
});


router.get("/storeAccountUser",function(req,res){
    var store = [];
    var find ="SELECT a.Account_ID,a.Account_Balance FROM trader_account a,trader_data d WHERE a.Trader_Personal_ID = d.Trader_Personal_ID AND d.Username ='"+ req.session.username +"' ";
    connection.query(find, function (err, result) {
        if (err) throw err;
        req.session.allAccount = result;
        if(result.length>0){
            req.session.currentAccount = result[0].Account_ID;
            req.session.currentBalance = result[0].Account_Balance;
        }else{
            req.session.currentAccount = -1;
            req.session.currentBalance = -1;
        }
        console.log(req.session.allAccount.length);
        if(req.session.username === 'admin') res.redirect('/admin')
        else res.redirect('/profiles/accounts');
    })
})


module.exports = router;
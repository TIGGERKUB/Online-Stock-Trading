module.exports = {
    isUser: function(req,res,next){
        if(req.session.username){
            return next();
        }
        res.redirect('/index');
    },
    isAdmin: function(req,res,next){
        if(req.session.username == 'Admin'){
            return next();
        }
        res.redirect('/index');
    }
}
const express = require('express')
const app = express()
//route
app.get('/iOS',function(req,res){
    res.send("kien thuc iOS");
});
app.get('/login/:username/:password',function(req,res){
    var username = req.params.username
    var pass = req.params.password
    if(username == 'admin' && pass == '123'){
        res.send("welcome");
    }else{
        res.send("sai ");
    }
})
app.get('/tinhtong/:so1/:so2', function(req,res){
    //var tong = parseInt(req.params.so1)  + parseInt(req.params.so2);
    // var a = parseInt(req.params.so1);
    // var b = parseInt(req.params.so2);
    // res.send(a + b);
    var a = parseInt(req.params.so1);
    var b = parseInt(req.params.so2);
    var c = a + b
    res.send( c);
})
app.get('/phepcong/:so1/:so2', function(req,res){
    var so1 = parseInt(req.params.so1);
    var so2 = parseInt(req.params.so2);
    res.send('Tong hai so la: ' + (so1 + so2));
});
app.listen(3000);

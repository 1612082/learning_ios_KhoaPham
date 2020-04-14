const express = require('express')
var bodyParser = require('body-parser')

const app = express()
// parse application/x-www-form-urlencoded
app.use(bodyParser.urlencoded({ extended: false }))

app.get('/welcome',function(req,res){
    res.send('nothing here');
})
app.get('/login/:username/:password', function(req,res){
    const username = req.params.username;
    const password = req.params.password;
    if (username == 'admin' && password == '123') {
        res.send('Welcome admin!');
    } else {
        res.send('Sai ten truy cap hoac mat ma');
    }
});
app.post('/login', function(req,res){
    const username = req.body.username;
    const password = req.body.password;
    if (username == 'admin' && password == '123') {
        res.send('Welcome admin!');
    } else {
        res.send('Sai ten truy cap hoac mat ma');
    }
});

app.listen('3000')
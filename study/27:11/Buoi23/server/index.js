const express = require('express');
const app = express();

// body-parser
const bodyParser = require('body-parser');
app.use(bodyParser.urlencoded({extended:false}));


// database
const Struct = (...keys) => ((...v) => keys.reduce((o, k, i) => {o[k] = v[i]; return o} , {}))
const Item = Struct('name', 'username', 'password','phone')
var myItems = [
    Item('dang', 'admin', '123','1111'),
    Item('binh', 'user', '111','1212')
];
//pg
const { Pool, Client } = require('pg');
var pool = null;
function connectPool(){
    pool = new Pool({
        user: 'postgres',
        host: 'localhost',
        database: 'Accounts',
        password: 'root',
        port: 5432,
      })
}
//jwt
const jwt = require('jsonwebtoken')
const secret = 'khoapham.vn'



app.get('/',function(req,res){
    connectPool();
    const qr = `select * from "Users"`
    pool.query(qr, (err, result) => {
        // console.log(err, result.rows)
        res.json(result.rows);
        pool.end();
      });
});
//khoi tao token
app.get('/jwt',function(req,res){
    var token = jwt.sign({
        username : 'admin',
        name: 'Quan'
    },secret,{expiresIn:30}); // thoi han token ton tai trong 30 giay
    res.json({token:token});
})
//kiem tra token va lay du lieu tu token
app.post('/check/',function(req,res){
    const token = req.body.token
    if (token){jwt.verify(token,secret,function(err,decoded){
        if (err) {
            return res.json({
                result: false,
                message: ' chua xac thuc',
                data:null
            });
        } else {
            req.decoded = decoded;
            return res.json({
                result: true,
                message: 'xac thuc',
                data:{
                    username: decoded.username,
                    name: decoded.name
                }
                
            })
        }
    })} else{

    }
})

app.get('/welcome', function(req,res){
    res.send('Welcome Admin');
});

app.get('/login/:username/:password', function(req,res){
    const username = req.params.username;
    const password = req.params.password;
    if (username == 'admin' && password == '123') {
        res.send('Welcome Admin');
    } else {
        res.send('Sai username hoac password');
    };
});

app.post('/login', function(req,res){
    
    const username = req.body.username;
    const password = req.body.password;
    connectPool();
    const qr = `select * from "Users" where "EMAIL"= '${username}' and "PASSWORD"='${password}'`
    pool.query(qr, (err, result) => {
        // console.log(result,err);
        if (result.rowCount === 0) {
            res.json({result:false,message:'Sai email hoac password'});
        } else {
            var token = jwt.sign({
                email : username,
                pass: password
            },secret,{expiresIn:30}); // thoi han token ton tai trong 30 giay
            //res.json({token:token});
            res.json({result:true,message:'Dang nhap thanh cong',token:token});
        }
        
        pool.end();
      });
});
app.post('/register', function(req,res){
    const name = req.body.name;
    const username = req.body.username;
    const password = req.body.password;
    const phone = req.body.phone
    onnectPool();
    const qr = `select * from "Users" where "EMAIL"= '${username}'`
    pool.query(qr, (err, result) => {
        // console.log(result,err);
        if (result.rowCount === 0) {
            // const qrInsert = `insert into "Users" ("EMAIL","PASSWORD")`
            // pool.query
        } else {
            res.json({result:true,message:'Dang nhap thanh cong'});
        }
        
        pool.end();
      });
    
});

app.listen(3000);
//express
const express = require('express');
const app = express();
// app.use(express.static('upload'));
//MD5
var md5 = require('md5');
//body
const bodyParser = require('body-parser');
app.use(bodyParser.urlencoded({extended : false}));
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
// multer
const multer = require('multer');
const storage = multer.diskStorage({
    destination: function(req,file,cb){
        cb(null, 'upload/');
    },
    filename: function(req, file, cb){
        cb(null, file.originalname)
    }
});
function fileFilter(req, file, cb){
    if (file.mimetype !== 'image/png' && file.mimetype !== 'image/jpeg'){
        req.fileValidationError = 'Wrong type image';
        return cb(null,false)
    }
    cb(null, true);
}
const upload = multer({storage: storage, fileFilter:fileFilter});
//jwt
const jwt = require('jsonwebtoken')
const secret = 'ios'


//route
app.get('/jobs', function(req,res){
    connectPool();
    const qr = `select * from " "`
    pool.query(qr, (err, result) => {
        res.json(result.rows);
        pool.end();
      });
});
//khoi tao token
app.post('/user/login',function(req,res){
    const email = req.body.email;
    const password = md5(req.body.password);
    connectPool();
    const qr = `select * from "Users" where "EMAIL"= '${email}' and "PASSWORD"='${password}'`
    pool.query(qr, (err, result) => {
        var message= "";
        if (result.rowCount === 0) {
            
            res.json({result:false,token:'',data: [], message});
        } else {
            message = "dang nhap thanh cong";
            var token = jwt.sign({
                email : email,
                pass: password
            },secret,{expiresIn:600}); // thoi han token ton tai trong 600 giay
            res.json({result:true,token:token, data: result.rows, message});
        }
        
        pool.end();
      });
    
})
//kiem tra token va lay du lieu tu token
app.post('/token',function(req,res){
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
                    email: decoded.email,
                    pass: decoded.pass
                }
                
            })
        }
    })} else{

    }
})
app.get('/', function(req,res){
    connectPool();
    const qr = `select * from "Users"`
    pool.query(qr, (err, result) => {
        // console.log(err, result.rows)
        res.json(result.rows);
        pool.end();
      });
});

app.post('/profile', upload.single('avatar'), function (req, res, next) {
    // req.file is the `avatar` file
    // req.body will hold the text fields, if there were any
    connectPool();
    const avatar = req.file;
    const qr = `insert into "Product" ("NAME") values ('${name}')`;
    pool.query(qr, (err, result) => {
        res.json({result: 'ok'});
    });
    pool.end()
    res.json ({avatar:avatar})

  }
)
app.post('/photos/upload', upload.array('photos', 12), function (req, res, next) {
    // req.files is array of `photos` files
    // req.body will contain the text fields, if there were any

    // const photos = req.files;
    // res.json ({photos:photos})
    const photos = req.files;
    connectPool();
    for (let index = 0; index < photos.length; index++) {
        const name = photos[index].filename;
        
        const qr = `insert into "Product" ("NAME") values ('${name}')`;
        pool.query(qr, (err, result) => {
            
          });
        

    }
    pool.end();
    res.json({result: 'ok'});
})

app.listen(3000);
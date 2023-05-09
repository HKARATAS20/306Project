const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const mysql = require('mysql');
const fs = require('fs');
const path = require('path');

const app = express();

// Enable CORS
app.use(cors());

// Configure body-parser to handle POST requests
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

// Create a MySQL connection pool
const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: 'password', //deleted my password
});

app.listen(3000, () => {
  console.log('Server running on port 3000');
});



app.get('/',function(req,res){
  fs.readFile('./products.html','utf8',(err,html) => {
      if(err){
          response.status(500).send('Error');
      }
      res.send(html);
  })
});

app.get('/middle.js', function(req,res){
  res.sendFile(path.join(__dirname + '/middle.js'));
});


app.get('/productsby', (req,res) => {
  db.query('USE project');
  const{category} = req.query;
  console.log("category",category);

  const query = bycategory(category);

  db.query(query,(error,results) => {
      if(error){
          throw error;
      }
      else{
        //console.log(results);
          res.status(201).send(results);
      }
  });
});

app.get('/products', (req,res) => {
    db.query('USE project');
    //const{first,second} = req.query;
    //console.log("first",first);
    //console.log("second",second);
  
    const query = products();
  
    db.query(query,(error,results) => {
        if(error){
            throw error;
        }
        else{
          //console.log(results);
            res.status(201).send(results);
        }
    });
  });

function products() {
    const query = "Select * from products";
    return query;
    
}


function contains(val, col_name, table_name){
  db.connect((err) => {
    if (err) {
        console.log(err);
    }
    db.query('use world');
    
    db.query(`SELECT COUNT(*) FROM ${table_name} WHERE ${col_name} = '${val}'`, (err,result) => {
      if(err){
          throw err;
      }
      const { 'COUNT(*)': count } = result[0];
      console.log("result",result )
      if(count > 0){
        console.log("true");
        return true;
      }
      else{
      console.log("false");
      return false;
      }
    });
  }
)};

function bycategory(category){
    var query = "";
    if(category == "All"){
        query = "SELECT * FROM products";
    }  
    else{
        query = `SELECT * FROM products where category = '${category}' `
    }
    return query;
}








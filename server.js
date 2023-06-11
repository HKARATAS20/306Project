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

app.use(express.static(__dirname));

var user_id;

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
  fs.readFile('./login.html','utf8',(err,html) => {
      if(err){
          response.status(500).send('Error');
      }
      res.send(html);
  })
});

app.get('/middle.js', function(req,res){
  res.sendFile(path.join(__dirname + '/middle.js'));
});

app.get('/login.js', function(req,res){
  res.sendFile(path.join(__dirname + '/login.js'));
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


app.get('/productsbyId', (req,res) => {
  db.query('USE project');
  const{id} = req.query;
  console.log("id",id);

  const query = byId(id);

  db.query(query,(error,results) => {
      if(error){
          throw error;
      }
      else{
        console.log(results);
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
      query = `SELECT p.product_id ,p.name, p.category, p.description, MIN(sp.price) AS min_price
      FROM products p
      JOIN supplier_product sp ON p.product_id = sp.product_id
      GROUP BY p.product_id, p.category, p.description  `
    }  
    else{

      query = `SELECT p.product_id, p.name, p.category, p.description, MIN(sp.price) AS min_price
      FROM products p
      JOIN supplier_product sp ON p.product_id = sp.product_id
      WHERE category = '${category}'
      GROUP BY p.product_id, p.category, p.description`


    }
    return query;
}
function byId(id){
  var  query = `SELECT s.name as supplier_name ,sp.supplier_id,p.product_id ,p.name, p.category, p.description, sp.price
    FROM products p
    JOIN supplier_product sp ON p.product_id = sp.product_id
    JOIN suppliers s ON s.supplier_id = sp.supplier_id
    WHERE p.product_id = '${id}'
    GROUP BY supplier_name ,sp.supplier_id, p.product_id, p.category, p.description, sp.price`


  
  return query;
  // WHERE p.product_id = '${id}'
}


app.post('/addUser', (req, res) => {
  db.query('USE project');
  const { first_name, last_name, email, address } = req.body;
  db.query(`INSERT INTO customers (first_name,last_name, email, address) VALUES (?, ?, ?, ?)`, [first_name,last_name, email, address], (error, results) => {
    if (error) throw error;
    res.send('Data added successfully!');
  });
});


app.post('/addToBasket', (req, res) => {
  db.query('USE project');
  const data = { product_id, supplier_id, quantity, price } = req.body;
  db.query(`INSERT INTO basket_items (customer_id, product_id, supplier_id, quantity, price) VALUES (?, ?, ?, ?, ?)`, 
          [user_id, product_id, supplier_id, quantity, price], (error, results) => {
    if (error) throw error;
    res.send('Data added successfully!');
  });
});


app.post('/checkout', (req, res) => {
  db.query('USE project');
  
  const { total } = req.body;
  var address;
  var order_id;

  db.query(`SELECT * FROM customers WHERE customer_id = '${user_id}'`,(error, results) => {
    if(error){
        throw error;
    }
    else {
        address = results[0].address;
        console.log(address);
    }
  });


  db.query(`SELECT LAST_INSERT_ID();`,(error,results) => {
    if(error){
        throw error;
    }
    else{
        order_id = results;
    }
  });
  console.log(address);
  /*db.query(`INSERT INTO orders (customer_id, order_date , shipping_address, total_amount) VALUES (?, CURRENT_DATE(), "?", ?)`, 
            [user_id,address, total], (error, results) => {
    if (error) throw error;
    res.send('Data added successfully!');
  });*/


});

app.get('/addItems', (req, res) => {

  const  { product_id, supplier_id, quantity, price } = req.body;

  db.query(`INSERT INTO order_items (order_id,last_name, email, address) VALUES (?, ?, ?, ?)`, [first_name, last_name, email, address], (error, results) => {
    if (error) throw error;
    res.send('Data added successfully!');
  });
})

app.get('/getUser', (req,res) => {
  db.query('USE project');
  const{email} = req.query;
  console.log("user email",email);


  db.query(`SELECT * FROM customers WHERE email = '${email}'`,(error,results) => {
      if(error){
          throw error;
      }
      else{

          user_id = results[0].customer_id;
          console.log(user_id);
          res.status(201).send(results);
      }
  });
});


app.get('/fillBasket', (req,res) => {
  db.query('USE project');


  db.query(`SELECT b.*, p.name , s.name as supplier_name, (SELECT SUM(price) FROM basket_items WHERE customer_id = ${user_id}) as total
          FROM basket_items b
          JOIN products p ON b.product_id = p.product_id
          JOIN suppliers s ON s.supplier_id = b.supplier_id
          WHERE b.customer_id = '${user_id}'`,(error,results) => {
      if(error){
          throw error;
      }
      else{
        //  console.log(results);
          res.status(201).send(results);
      }
  });
});

app.get('/emptyBasket', (req,res) => {
  db.query('USE project');


  db.query(`DELETE FROM basket_items WHERE customer_id = '${user_id}'`,(error,results) => {
      if(error){
          throw error;
      }
      else{
       //   console.log(results);
          res.status(201).send(results);
      }
  });
});








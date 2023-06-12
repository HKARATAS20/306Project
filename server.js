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

var supplier_id;
var user_id;
var order_id;

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
  const query = `SELECT COUNT(*) AS count FROM ${table_name} WHERE ${col_name} = '${val}'`;
  db.query(query, (error, results, fields) => {
    if (error) {
      console.error(error);
      return false;
    }
    const count = results[0].count;
    const result = count > 0;
    console.log(result);
    return count > 0;
  });
};

function bycategory(category){
    var query = "";
    if(category == "All"){
      query = `SELECT p.product_id, p.name, p.category, p.description, MIN(sp.price) AS min_price, AVG(r.rating) AS avg_rating
      FROM products p
      JOIN supplier_product sp ON p.product_id = sp.product_id
      LEFT JOIN ratings r ON p.product_id = r.product_id
      GROUP BY p.product_id, p.name, p.category, p.description
       `
    }  
    else{

      query = `SELECT p.product_id, p.name, p.category, p.description, MIN(sp.price) AS min_price, AVG(r.rating) AS avg_rating
      FROM products p
      JOIN supplier_product sp ON p.product_id = sp.product_id
      LEFT JOIN ratings r ON p.product_id = r.product_id
      WHERE p.category = '${category}'
      GROUP BY p.product_id, p.name, p.category, p.description
      `


    }
    return query;
}
function byId(id){
  var  query = `SELECT s.name AS supplier_name, sp.supplier_id, p.product_id, p.name, p.category, p.description, sp.price,
                AVG(r.rating) AS supplier_rating
                FROM products p
                JOIN supplier_product sp ON p.product_id = sp.product_id
                JOIN suppliers s ON s.supplier_id = sp.supplier_id
                LEFT JOIN ratings r ON s.supplier_id = r.supplier_id
                WHERE p.product_id = '${id}'
                GROUP BY supplier_name, sp.supplier_id, p.product_id, p.name, p.category, p.description, sp.price
            `
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

app.post('/addSupplier', (req, res) => {
  db.query('USE project');
  const { supplier_name, email } = req.body;
  db.query(`INSERT INTO suppliers (name, contact_email) VALUES (?, ?)`, [supplier_name, email], (error, results) => {
    if (error) throw error;
    res.send('Data added successfully!');
  });
});

app.post('/addProducts', (req, res) => {
  db.query('USE project');
  const { product_name, price, stock, category, description, brand } = req.body;

  const query = `SELECT COUNT(*) AS count FROM products WHERE name = '${product_name}'`;
  db.query(query, (error, results, fields) => {
    if (error) {
      console.error(error);
      return false;
    }
    const count = results[0].count;
    const result = count > 0;
    console.log("Contains func result: ", result);
    
    if (result == false) {
        db.query(`INSERT INTO products (name, description, category, stock, brand) VALUES (?, ?, ?, 1, ?)`,
      [product_name, description, category, brand], (error, results) => {
        if (error) throw error;

        db.query(`SELECT LAST_INSERT_ID();`, (error, lastInsertIdResults) => {
          db.query(`INSERT INTO supplier_product (supplier_id, product_id, price, stock) VALUES (?, ?, ?, ?)`,
          [supplier_id, lastInsertIdResults[0]['LAST_INSERT_ID()'], price, stock], (error, results) => {
            if (error) throw error;
            res.send('Data added successfully!');
          });
        });
      });
    }
    else {
      db.query(`SELECT product_id from products where name = "${product_name}"`, (error, results) => {
        if (error) throw error;
        console.log("Results:", results);
        console.log("Resultus[0]: ", results[0]);
        
        db.query(`INSERT INTO supplier_product (supplier_id, product_id, price, stock) VALUES (?, ?, ?, ?)`,
         [supplier_id, results[0].product_id, price, stock], (error, results) => {
          if (error) throw error;
          res.send('Data added successfully!');
        });
  
      })
    }

  });
  
});

app.post('/addToBasket', (req, res) => {
  db.query('USE project');
  const data = { product_id, supplier_id, quantity, price } = req.body;

  const query = `SELECT COUNT(*) AS count FROM basket_items WHERE customer_id = ${user_id} AND product_id = ${product_id} AND supplier_id = ${supplier_id}`;
  db.query(query, (error, results, fields) => {
    if (error) {
      console.error(error);
      return false;
    }
    const count = results[0].count;
    const result = count > 0;
    console.log("Contains func result: ", result);

    if (result == false) {
      db.query(`INSERT INTO basket_items (customer_id, product_id, supplier_id, quantity, price) VALUES (?, ?, ?, ?, ?)`, 
              [user_id, product_id, supplier_id, quantity, price], (error, results) => {
        if (error) throw error;
        res.send('Data added successfully!');
      });
    }
    else {
      db.query(`UPDATE basket_items SET quantity = quantity + 1 WHERE customer_id = ${user_id} AND product_id = ${product_id} AND supplier_id = ${supplier_id}`, 
        (error, results) => {
        if (error) throw error;
        res.send('Data added successfully!');
      });
    }
  });
});

app.get('/emptyBasket', (req, res) => {
  db.query('USE project');
  db.query(`DELETE FROM basket_items WHERE customer_id = ${user_id};`,  (error, results) => {
    if (error) throw error;
    res.send('Data deleted successfully!');
  });
});


app.post('/checkout', (req, res) => {
  db.query('USE project');
  
  const { total } = req.body;
  var address;

  db.query(`SELECT * FROM customers WHERE customer_id = '${user_id}'`, (error, customerResults) => {
    if (error) {
      throw error;
    } else {
      const address = customerResults[0].address;
      console.log(address);
  
      db.query(`INSERT INTO orders (customer_id, order_date, shipping_address, total_amount) VALUES (?, CURRENT_DATE(), ?, ?)`, 
              [user_id,address, total], (error, results) => {
              if (error) throw error;
                res.send('Data added successfully!');

                db.query(`SELECT LAST_INSERT_ID();`, (error, lastInsertIdResults) => {
                  if (error) {
                    throw error;
                  } else {
                    console.log(lastInsertIdResults);
                    order_id = lastInsertIdResults[0]['LAST_INSERT_ID()'];
                    console.log("Order_id: ", order_id);
                  }
                });

              });
    }
  });
  
});

app.post('/addItems', (req, res) => {

  const  { product_id, supplier_id, quantity, price } = req.body;

  db.query(`INSERT INTO order_items (order_id, product_id, supplier_id, quantity, price) VALUES (?, ?, ?, ?, ?)`,
   [order_id, product_id, supplier_id, quantity, price], (error, results) => {
    if (error) throw error;

    db.query(`UPDATE supplier_product SET stock = stock - ${quantity} WHERE product_id = ${product_id} AND supplier_id = ${supplier_id}`,
     (error, results) => {
      if (error) throw error;
      res.send("Data added successfully!");
    });
  });
})

app.post('/addRating', (req, res) => {
  db.query('USE project'); 
  const { product_id, supplier_id, rating } = req.body;
  db.query(`INSERT INTO ratings (customer_id, product_id, supplier_id, rating) VALUES ( ?, ?, ?, ?)`, 
          [user_id, product_id, supplier_id, rating], (error, results) => {
    if (error) throw error;
    res.send('Data added successfully!');
  });
});

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

app.get('/getSupplier', (req,res) => {
  db.query('USE project');
  const{email} = req.query;
  console.log("Supplier email",email);

  db.query(`SELECT * FROM suppliers WHERE contact_email = '${email}'`,(error,results) => {
      if(error){
          throw error;
      }
      else{
          supplier_id = results[0].supplier_id;
          console.log(supplier_id);
          res.status(201).send(results);
      }
  });
});


app.get('/fillProducts', (req,res) => {
  db.query('USE project');

  db.query(`select products.name as product_name, supplier_product.product_id, supplier_product.price, supplier_product.stock
  from supplier_product
  join products on products.product_id = supplier_product.product_id
  where supplier_id ='${supplier_id}'`,(error,results) => {
      if(error){
          throw error;
      }
      else{
          //console.log(results);
          res.status(201).send(results);
      }
  });
});


app.get('/fillOrders', (req,res) => {
  db.query('USE project');

  db.query(`select products.name as product_name, products.product_id as product_id, order_items.quantity, order_items.price, orders.order_date,
            suppliers.supplier_id as supplier_id, orders.shipping_address, suppliers.name as supplier_name
  from order_items
  join orders on orders.order_id = order_items.order_id
  join products on order_items.product_id = products.product_id
  join suppliers on suppliers.supplier_id = order_items.supplier_id
  where customer_id = '${user_id}'`,(error,results) => {
      if(error){
          throw error;
      }
      else{
          //console.log(results);
          res.status(201).send(results);
      }
  });
});


app.get('/fillBasket', (req,res) => {
  db.query('USE project');

  db.query(`SELECT b.*, p.name , s.name as supplier_name, (SELECT SUM(price * b.quantity) FROM basket_items WHERE customer_id = ${user_id}) as total
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

app.get('/fillCategories', (req,res) => {
  db.query('USE project');


  db.query(`SELECT DISTINCT category FROM products`,(error,results) => {
      if(error){
          throw error;
      }
      else{
       //   console.log(results);
          res.status(201).send(results);
      }
  });
});



app.get('/frequentlyBought', (req,res) => {
  db.query('USE project');
  const{id} = req.query;
  console.log("frqntly bouhght id",id);

  const query = `SELECT p1.name AS product_name, COUNT(*) AS frequency
  FROM order_items oi1
  JOIN order_items oi2 ON oi1.order_id = oi2.order_id 
                       AND oi1.product_id != oi2.product_id 
                       AND oi2.product_id = ${id}
                       AND oi1.product_id < oi2.product_id 
  JOIN products p1 ON oi1.product_id = p1.product_id
  GROUP BY oi1.product_id, oi2.product_id, p1.name
  ORDER BY frequency DESC
  LIMIT 2;`

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





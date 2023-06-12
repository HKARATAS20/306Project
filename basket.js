function continueShopping() {

    window.location.href = "../products.html";
    
}

function fillTable() {
    
        fetch('http://localhost:3000/fillBasket')
        .then(function(response){
          return response.json();
        })
        .then(function(products){
          var table = document.getElementById("Basket");
          for(var i = table.rows.length -1; i > 0;i--){
            table.deleteRow(i);
          }
          console.log(products);
          //console.log(products[0].Name);
          var i;
          for(i = 0; i < products.length; i++){
            var row = table.insertRow(i+1);
            var cell1 = row.insertCell(0);
            var cell2 = row.insertCell(1);
            var cell3 = row.insertCell(2);
            var cell4 = row.insertCell(3);
    
            cell1.innerHTML = products[i].name;
            cell2.innerHTML = products[i].supplier_name;
            cell3.innerHTML = products[i].quantity;
            cell4.innerHTML = products[i].price;
            
          }
          if(i > 0){
          var row = table.insertRow(i+1);
          var cell1 = row.insertCell(0);
          var cell2 = row.insertCell(1);
          var cell3 = row.insertCell(2);
          var cell4 = row.insertCell(3);
          cell4.innerHTML = "Total"
          cell4.style.fontWeight = "bold";
          i++;
          var row = table.insertRow(i+1);
          var cell1 = row.insertCell(0);
          var cell2 = row.insertCell(1);
          var cell3 = row.insertCell(2);
          var cell4 = row.insertCell(3);
          cell4.innerHTML = products[0].total
          }
          table.style.display = "block";
        });   
}


function emptyBasket() {
    fetch('http://localhost:3000/emptyBasket');
    var table = document.getElementById("Basket");
    for(var i = table.rows.length -1; i > 0;i--){
      table.deleteRow(i);
    }

}


function checkout() {
    // Should do everythig or something
    // Should add all the items in the basket to the order_items and delete the basket.
    fetch('http://localhost:3000/fillBasket')
    .then(function(response){
      return response.json();
    })
    .then(function(products){

        var total = products[0].total;

        var data2 = { total };
        fetch("http://localhost:3000/checkout", {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(data2)
                })
                .then(data2 => {
                    alert("Data added successfully!")

                    for(i = 0; i < products.length; i++){
                        var product_id = products[i].product_id;
                        var supplier_id = products[i].supplier_id;
                        var quantity = products[i].quantity;
                        var price = products[i].price;

                        var data = { product_id, supplier_id, quantity, price};

                    fetch("http://localhost:3000/addItems", {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/json'
                        },
                        body: JSON.stringify(data)
                        })
                        .then(data => {
                            //alert("Data added successfully!")
                            emptyBasket();

                            window.location.href = "../checkout.html";
                        })
                        .catch(error => console.error(error));
                            }
                        })
                        .catch(error => console.error(error));
       
    });
    

}

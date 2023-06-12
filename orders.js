function goToOrders() {

    window.location.href = "../orders.html";

}

function fillOrderTable() {

    fetch('http://localhost:3000/fillOrders')
    .then(function(response){
      return response.json();
    })
    .then(function(products){
      var table = document.getElementById("Orders");
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
        var cell5 = row.insertCell(4);
        var cell6 = row.insertCell(5);

        const formattedDate = products[i].order_date.substring(0, 10);

        cell1.innerHTML = products[i].product_name;
        cell2.innerHTML = products[i].quantity;
        cell3.innerHTML = products[i].price;
        cell4.innerHTML = formattedDate;
        cell5.innerHTML = products[i].shipping_address;
        cell6.innerHTML = products[i].supplier_name;
      }
      table.style.display = "block";
    });   

}
function openPopUp() {

    var item = document.getElementById("addPopUp");
    item.style.display = "block";

    const closeButton = document.getElementsByClassName('close')[0];

    function closeModal() {
        item.style.display = 'none';
    }
    closeButton.addEventListener('click', closeModal);  

}

function addProduct() {
    var product_name = document.getElementById("productName").value;
    var price = document.getElementById("price").value;
    var stock = document.getElementById("stock").value;
    var category = document.getElementById("category").value;
    var description = document.getElementById("description").value;
    var brand = document.getElementById("brand").value;

    const data = { product_name, price, stock, category, description, brand };

    fetch("http://localhost:3000/addProducts", {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(data)
    })
      .then(data => {
        alert("Data added successfully!")
      })
      .catch(error => console.error(error));
}

function fillProductsTable() {
    fetch('http://localhost:3000/fillProducts')
    .then(function(response){
      return response.json();
    })
    .then(function(products){
      var table = document.getElementById("Products");
      for(var i = table.rows.length - 1; i > 0; i--){
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

        cell1.innerHTML = products[i].product_name;
        cell2.innerHTML = products[i].product_id;
        cell3.innerHTML = products[i].price;
        cell4.innerHTML = products[i].stock;
      }
      table.style.display = "block";
    });   
}

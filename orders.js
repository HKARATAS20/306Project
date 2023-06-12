var product_id;
var supplier_id;

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
        var cell5 = row.insertCell(4);
        var cell6 = row.insertCell(5);
        var cell7 = row.insertCell(6);

        const formattedDate = products[i].order_date.substring(0, 10);

        cell1.innerHTML = products[i].product_name;
        cell2.innerHTML = products[i].quantity;
        cell3.innerHTML = products[i].price;
        cell4.innerHTML = formattedDate;
        cell5.innerHTML = products[i].shipping_address;
        cell6.innerHTML = products[i].supplier_name;

        var addButton = document.createElement("button");
        addButton.innerHTML = "Rate Product";
        addButton.addEventListener("click", rateProductHandler(products[i]));
        product_id = products[i].product_id;
        cell7.appendChild(addButton);
      }
      table.style.display = "block";
    });   

}
function rateProductHandler(product) {
  return function() {
    //rateProduct(product)
    product_id = product.product_id;
    supplier_id = product.supplier_id;
    showPopup()
  };
}
function showPopup() {
  var popup = document.getElementById("ratingPopup");
  var closeButton = document.getElementsByClassName('close')[0];

  function closeModal() {
    popup.style.display = 'none';
  }
  closeButton.addEventListener('click', closeModal);  

  popup.style.display = "block"; 
  
}
function rateProduct() {
  // Implement your "Add to Cart" logic here

  var rating = document.getElementById("rating").value;

  const data = {  product_id, supplier_id, rating };

  fetch("http://localhost:3000/addRating", {
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

function updateRatingDisplay() {
  var rating = document.getElementById("rating").value;
  document.getElementById("ratingDisplay").textContent = rating;
}

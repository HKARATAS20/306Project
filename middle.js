
var product_id;
function productsby() {
    var category = document.getElementById("Category-select").value;


    var allProducts = document.getElementById("Products");
    var selectProducts = document.getElementById("ProductsWithId");

  
    allProducts.style.display = "block";
    selectProducts.style.display = "none";


    fetch('http://localhost:3000/productsby?category=' + category)
    .then(function(response){
      return response.json();
    })
    .then(function(products){




      fetch('http://localhost:3000/mostPurchased?category=' + category)
      .then(function(response){
        return response.json();
      })
      .then(function(mostPurchased){

        var mostTable = document.getElementById("MostPurchased");

        var freqTable = document.getElementById("FrequentsWithId");
        var table = document.getElementById("Products");
        for(var i = table.rows.length -1; i > 0;i--){
          table.deleteRow(i);
        }

        for(var i = mostTable.rows.length -1; i > 0;i--){
          mostTable.deleteRow(i);
        }

        if (mostPurchased.length <= 0) {
          mostTable.style.display = "none";
        }
        else {
          for(var i = 0; i < mostPurchased.length; i++){
            var row = mostTable.insertRow(i+1);
            var cell1 = row.insertCell(0);
            var cell2 = row.insertCell(1);
            cell1.innerHTML = mostPurchased[i].name;
            cell2.innerHTML = mostPurchased[i].total_purchases;
          }
          mostTable.style.display = "block";
        }
        console.log(products);
        //console.log(products[0].Name);
        for(var i = 0; i < products.length; i++){
          var row = table.insertRow(i+1);
          var cell1 = row.insertCell(0);
          var cell2 = row.insertCell(1);
          var cell3 = row.insertCell(2);
          var cell4 = row.insertCell(3);
          var cell5 = row.insertCell(4);

          cell1.innerHTML = products[i].name;
          cell2.innerHTML = products[i].min_price;
          cell3.innerHTML = products[i].category;
          cell4.innerHTML = products[i].avg_rating;

          var showButton = document.createElement("button");
          showButton.innerHTML = "Product Page";

          showButton.addEventListener("click", createShowDescriptionHandler(products[i]));
          product_id = products[i].product_id;
          cell5.appendChild(showButton);
        }
        table.style.display = "block";
        freqTable.style.display = "none";
      });

    });
}

function createShowDescriptionHandler(product) {
  return function() {
    addProducts(product)
    product_id = product.product_id;
    //showProductDetails(product);
  };
}

function changeWindow(product) {

  addProducts(product.product_id);


  
}

function productsbyId(){
  console.log("productsbyId", product_id);

}

function addProducts(product) {

  var alLProducts = document.getElementById("Products");
  var selectProducts = document.getElementById("ProductsWithId");

  var title = document.getElementById("table_title");
  title.textContent = product.name;

  alLProducts.style.display = "none";
  selectProducts.style.display = "block";
  product_id = product.product_id;

  fetch('http://localhost:3000/productsbyId?id=' + product_id)
    .then(function(response){
      return response.json();
    })
    .then(function(products){


      fetch('http://localhost:3000/frequentlyBought?id=' + product_id)
      .then(function(response){
        return response.json();
      })
      .then(function(result){

        console.log(result);

      var mostTable = document.getElementById("MostPurchased");
      var freqTable = document.getElementById("FrequentsWithId");
      for(var i = freqTable.rowslength - 1; i > 0;i--){
          freqTable.deleteRow(i);
        }
        for(var i = 0; i < result.length; i++){
          var row = freqTable.insertRow(i+1);
          var cell1 = row.insertCell(0);
          cell1.innerHTML = result[i].product_name;
        }
      var table = document.getElementById("ProductsWithId");
      for(var i = table.rows.length -1; i > 0;i--){
        table.deleteRow(i);
      }
      for(var i = 0; i < products.length; i++){
        var row = table.insertRow(i+1);
        var cell1 = row.insertCell(0);
        var cell2 = row.insertCell(1);
        var cell3 = row.insertCell(2);
        var cell4 = row.insertCell(3);
        var cell5 = row.insertCell(4);


        cell1.innerHTML = products[i].supplier_name;
        cell2.innerHTML = products[i].price;
        cell3.innerHTML = products[i].category;
        cell4.innerHTML = products[i].supplier_rating;

        

        var addButton = document.createElement("button");
        addButton.innerHTML = "Add To Basket";
        addButton.addEventListener("click", addToCartHandler(products[i]));
        product_id = products[i].product_id;
        cell5.appendChild(addButton);
      }
      freqTable.style.display = "block";
      table.style.display = "block";
      mostTable.style.display = "none";
    });
    });

}

function addToCartHandler(product) {
  return function() {
    addToCart(product)
  };
}

function showProductDetails(product) {
  // Create a modal or popup element
  var modal = document.createElement("div");
  modal.classList.add("product-modal");

  // Create the product details content
  var content = document.createElement("div");
  content.classList.add("product-content");

  // Create elements for name, price, and description
  var nameElement = document.createElement("h2");
  nameElement.textContent = product.name;

  var priceElement = document.createElement("p");
  priceElement.textContent = "Price: " + product.price;

  var descriptionElement = document.createElement("p");
  descriptionElement.textContent = product.description;

// Create a close button
var closeButton = document.createElement("button");
closeButton.innerHTML = "X";
closeButton.classList.add("close-button");
closeButton.addEventListener("click", function() {
  closeModal(modal);
});
  // Create an "Add to Cart" button
  var addToCartButton = document.createElement("button");
  addToCartButton.textContent = "Add to Cart";
  addToCartButton.addEventListener("click", function() {
    addToCart(product);
  });

  // Append elements to the content container
  content.appendChild(closeButton);
  content.appendChild(nameElement);
  content.appendChild(priceElement);
  content.appendChild(descriptionElement);
  content.appendChild(addToCartButton);

  // Append the content container to the modal
  modal.appendChild(content);
//  modal.appendChild(closeButton);

  // Append the modal to the document body
  document.body.appendChild(modal);
}

function closeModal(modal) {
  // Remove the modal from the document body
  document.body.removeChild(modal);
}

function addToCart(product) {
  // Implement your "Add to Cart" logic here
  console.log("Added to cart:", product);
  const product_id = product.product_id;
  const supplier_id = product.supplier_id;
  const quantity = 1;
  const price = product.price;

  const data = { product_id, supplier_id, quantity, price };

  fetch("http://localhost:3000/addToBasket", {
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

function goToBasket() {

  window.location.href = "../basket.html";


}

function initialCategory() {
  const categorySelect = document.getElementById('Category-select');

      const defaultValue = 'All';

      const defaultOption = document.createElement('option');
      defaultOption.value = defaultValue;
      defaultOption.textContent = defaultValue;
      defaultOption.selected = true; 
      categorySelect.appendChild(defaultOption);

}

function fillCategories() {
    
    fetch('http://localhost:3000/fillCategories')
    .then(function(response){
      return response.json();
    })
    .then(function(categories){
    
      const categorySelect = document.getElementById('Category-select');

      for (let i = 0; i < categories.length; i++) {
        const option = document.createElement('option');
        option.value = categories[i].category;
        option.textContent = categories[i].category;
        categorySelect.appendChild(option);
      }
    });   

  
}
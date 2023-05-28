

function productsby() {
    var category = document.getElementById("Category-select").value;
    fetch('http://localhost:3000/productsby?category=' + category)
    .then(function(response){
      return response.json();
    })
    .then(function(products){
      var table = document.getElementById("Products");
      for(var i = table.rows.length -1; i > 0;i--){
        table.deleteRow(i);
      }
      console.log(products);
      //console.log(products[0].Name);
      for(var i = 0; i < products.length; i++){
        var row = table.insertRow(i+1);
        var cell1 = row.insertCell(0);
        var cell2 = row.insertCell(1);
        var cell3 = row.insertCell(2);
        var cell4 = row.insertCell(3);

        cell1.innerHTML = products[i].name;
        cell2.innerHTML = products[i].price;
        cell3.innerHTML = products[i].category;

        var showButton = document.createElement("button");
        showButton.innerHTML = "Show Description";
        showButton.addEventListener("click", createShowDescriptionHandler(products[i]));
        cell4.appendChild(showButton);
      }
      table.style.display = "block";
    });
}

function createShowDescriptionHandler(product) {
  return function() {
    showProductDetails(product);
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
  content.appendChild(nameElement);
  content.appendChild(priceElement);
  content.appendChild(descriptionElement);
  content.appendChild(addToCartButton);

  // Append the content container to the modal
  modal.appendChild(content);
  modal.appendChild(closeButton);

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
}
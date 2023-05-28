function helloWorld() {
    console.log("Hello Woerld");
    
}
function get_all_products() {

  
    fetch('http://localhost:3000/products')
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

        cell1.innerHTML = products[i].name;
        cell2.innerHTML = products[i].price;
        cell3.innerHTML = products[i].category;
  
      }
      table.style.display = "block";


    }); 
    
}

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

        var descriptionDiv = document.createElement("div"); // Create a new <div> element for description
        descriptionDiv.style.display = "none"; // Hide the description initially
        row.appendChild(descriptionDiv); // Append the <div> element to the row

        var button = document.createElement("button");
        button.innerHTML = "Show Description";
        cell4.appendChild(button);
        button.addEventListener("click", createShowDescriptionHandler(descriptionDiv, products[i].description));
  
      }
      table.style.display = "block";


    }); 
}

function createShowDescriptionHandler(descriptionDiv, description) {
  return function() {
    if (descriptionDiv.style.display === "none") {
      descriptionDiv.style.display = "block";
      descriptionDiv.innerHTML = description; // Set the description content
    } else {
      descriptionDiv.style.display = "none";
      descriptionDiv.innerHTML = ""; // Clear the description content
    }
  };
}
function getLifeExpectancy() {
    var agg = document.getElementById("Operation-select").value;
    var country = document.getElementById("Country").value;
  
    fetch('http://localhost:3000/aggregateCountries?agg=' + agg + '&country=' + country)
    .then(function(response){
      return response.json();
    })
    .then(function(data){
      var table = document.getElementById("Countries");
      for(var i = table.rows.length -1; i > 0;i--){
        table.deleteRow(i);
      }

      for(var i = 0; i < data.length; i++){
        var row = table.insertRow(i+1);

        var cell1 = row.insertCell(0);
        var cell2 = row.insertCell(1);
        var cell3 = row.insertCell(2);
        var cell4 = row.insertCell(3);
        cell1.innerHTML = data[i].Name;
        cell2.innerHTML = data[i].LifeExpectancy;
        cell3.innerHTML = data[i].GovernmentForm;
        cell4.innerHTML = data[i].Language;
  
      }
      table.style.display = "block";


    }); 
    
}
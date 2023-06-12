function addData() {
    var first_name = document.getElementById("name").value;
    var last_name = document.getElementById("surname").value;
    var email = document.getElementById("email").value;
    var address = document.getElementById("address").value;
    var city = document.getElementById("city").value;

    const data = { first_name, last_name, email, address, city };

    fetch("http://localhost:3000/addUser", {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(data)
    })
      .then(data => {
        alert("Data added successfully!")
        window.location.href = "../login.html";

      })
      .catch(error => console.error(error));
}

function addSupplierData() {
  var supplier_name = document.getElementById("supplier-name").value;
  var email = document.getElementById("supplier-email").value;

  const data = { supplier_name, email };

  fetch("http://localhost:3000/addSupplier", {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify(data)
  })
    .then(data => {
      alert("Data added successfully!")
      window.location.href = "../login.html";

    })
    .catch(error => console.error(error));
}

function queryData() {
    var email = document.getElementById("login-email").value;
    console.log("hello");
    console.log(email);
    fetch('http://localhost:3000/getUser?email=' + email)
    .then(function(response){
      return response.json();
    })
    .then(function(user){
        window.location.href = "../products.html";

    });
}

function supplierQueryData() {
  var email = document.getElementById("supplier-login-email").value;
  console.log("hello");
  console.log(email);
  fetch('http://localhost:3000/getSupplier?email=' + email)
  .then(function(response){
    return response.json();
  })
  .then(function(user){
      window.location.href = "../supplier.html";
  });
}

const items = [];
var blacklist = [3, 4, 5, 6, 7, 8, 9, 10];
const xhr = new XMLHttpRequest();
let filter = 0;

function start() {
  xhr.open("GET", "http://localhost/Kiosk/server/api.php?action=getCategories");
  xhr.send();
  xhr.responseType = "json";
  xhr.onload = () => {
    if (xhr.readyState == 4 && xhr.status == 200) {
      console.log(xhr.response);
      for (let i = 0; i < xhr.response.length; i++) {
        var div = document.createElement("div");
        items.push(div);
        document.getElementById("grid-container").appendChild(div);
        div.classList.add("grid-item");
        div.innerHTML = `<img onclick="run(${xhr.response[i].ID})" id="${xhr.response[i].ID}" src="${xhr.response[i].Image}" alt="${xhr.response[i].Name}">`;
      }
    } else {
      console.log(`Error: ${xhr.status}`);
    }
  };
}

function clear() {
  for (let i = 0; i < items.length; i++) {
    items[i].remove();
  }
}

function test(ID, Meal) {
  console.log(ID);
  if (Meal == "1") {
    // clear();
    // var div = document.createElement("div");
    // document.getElementById("grid-container").appendChild(div);
    // div.classList.add("grid-item");
    // div.innerHTML = `<img onclick='test(${xhr.response[0].ID});' id="${xhr.response[0].ID}" src="${xhr.response[0].Image}" alt="${xhr.response[0].Name}">`;
    // var div = document.createElement("div");
    // document.getElementById("grid-container").appendChild(div);
    // div.classList.add("grid-item");
    // div.innerHTML = `<img onclick='test(${xhr.response[2].ID});' id="${xhr.response[2].ID}" src="${xhr.response[2].Image}" alt="${xhr.response[2].Name}">`;
    clear();
    xhr.open(
      "GET",
      "http://localhost/Kiosk/server/api.php?action=getMealImages&product_id=" +
        ID
    );
    xhr.send();
    xhr.responseType = "json";
    console.log(xhr.response);
    xhr.onload = () => {
      if (xhr.readyState == 4 && xhr.status == 200) {
        console.log(xhr.response);

        var div = document.createElement("div");
        items.push(div);
        document.getElementById("grid-container").appendChild(div);
        div.classList.add("grid-item");
        div.innerHTML = `<img id="${xhr.response[0].ID}" src="${xhr.response[0].Image}">`;

        var obj = xhr.response[0].MealImage;
        var json = JSON.parse(obj);

        for (let i = 1; i <= Object.keys(json).length; i++) {
          var div = document.createElement("div");
          items.push(div);
          document.getElementById("grid-container").appendChild(div);
          div.classList.add("grid-item");
          div.innerHTML = `<img src="${json[i]}">`;
        }
      } else {
        console.log(`Error: ${xhr.status}`);
      }
    };
  } else {
    console.log("false");
  }
}

function run(id) {
  clear();
  xhr.open(
    "GET",
    "http://localhost/Kiosk/server/api.php?action=getProducts&categorie=" + id
  );
  xhr.send();
  xhr.responseType = "json";
  xhr.onload = () => {
    if (xhr.readyState == 4 && xhr.status == 200) {
      console.log(xhr.response);
      for (let i = 0; i < xhr.response.length; i++) {
        if (blacklist.includes(Number(xhr.response[i].ID)) == false) {
          var div = document.createElement("div");
          items.push(div);
          document.getElementById("grid-container").appendChild(div);
          div.classList.add("grid-item");
          div.innerHTML = `<img onclick='test(${xhr.response[i].ID}, ${xhr.response[i].Meal});' id="${xhr.response[i].ID}" src="${xhr.response[i].Image}" alt="${xhr.response[i].Name}">`;
        }
      }
    } else {
      console.log(`Error: ${xhr.status}`);
    }
  };
}

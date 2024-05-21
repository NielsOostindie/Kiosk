const items = [];
const blacklist = [3, 4, 5, 6, 7, 8, 9, 10, 14, 15];
const MealList = [3, 4, 5, 6, 7, 8, 9, 10, 14, 15];
let winkelmand = [];

function start() {
  fetch("http://localhost/Files/Kiosk/server/api.php?action=getCategories")
    .then(response => response.json())
    .then(data => {
      console.log(data);
      data.forEach(category => {
        const div = document.createElement("div");
        items.push(div);
        document.getElementById("cat").appendChild(div);
        div.classList.add("grid-cat");
        div.innerHTML = `<p>${category.Name}</p>
                         <img onclick="run(${category.ID})" id="${category.ID}" class="${category.Cat_ID}" src="${category.Image}" alt="${category.Name}">`;
      });
    })
    .catch(error => console.error(`Error: ${error}`));
}

function clear() {
  items.forEach(item => {
    if (!item.classList.contains("grid-cat")) {
      item.remove();
    }
  });
}

function MakeMeal(id) {
  if (MealList.includes(id)) {
    clear();
    fetch(`http://localhost/Files/Kiosk/server/api.php?action=getProducts&categorie=${id}`)
      .then(response => response.json())
      .then(data => {
        console.log(data);
        data.forEach(product => {
          if (!blacklist.includes(Number(product.ID))) {
            const div = document.createElement("div");
            items.push(div);
            document.getElementById("grid-container").appendChild(div);
            div.classList.add("grid-item");
            div.innerHTML = `<p>${product.Name}</p>
                             <img onclick='winkel("${product.Name}");' id="${product.ID}" src="${product.Image}" alt="${product.Name}">`;
          }
        });
      })
      .catch(error => console.error(`Error: ${error}`));
  }
}

function Meal(ID, isMeal) {
  if (isMeal == "1") {
    clear();
    fetch(`http://localhost/Files/Kiosk/server/api.php?action=getMealImages&product_id=${ID}`)
      .then(response => response.json())
      .then(data => {
        console.log(data);
        const mainDiv = document.createElement("div");
        items.push(mainDiv);
        document.getElementById("grid-container").appendChild(mainDiv);
        mainDiv.classList.add("grid-item");
        mainDiv.innerHTML = `<p>${data[0].Name}</p>
                             <img onclick='winkel("${data[0].Name} ${data[0].Price}"); clear()' id="${ID}" src="${data[0].Image}">
                             <p> &euro;${data[0].Price}</p>`;

        const mealImages = JSON.parse(data[0].MealImage);

        for (let i = 1; i <= Object.keys(mealImages).length; i++) {
          const div = document.createElement("div");
          items.push(div);
          document.getElementById("grid-container").appendChild(div);
          div.classList.add("grid-item");
          div.innerHTML = `<p>${data[0].Name} Meal</p>
                           <img onclick='MakeMeal(${data[0].MealID}); winkel("${data[0].Name} meal ${data[0].MealPrice}");' id="${data[0].MealID}" src="${mealImages[i]}">
                           <p> &euro;${data[0].MealPrice}</p>`;
        }
      })
      .catch(error => console.error(`Error: ${error}`));
  } else {
    console.log("false");
  }
}

function winkel(Name) {
  clear();
  winkelmand.push(Name);
  console.log(winkelmand);
  updateCookie();
}

function updateCookie() {
  const expirationDate = new Date();
  expirationDate.setDate(expirationDate.getDate() + 4);
  document.cookie = `winkelmand=${winkelmand}; expires=${expirationDate.toUTCString()}`;
}

function run(id) {
  clear();
  fetch(`http://localhost/Files/Kiosk/server/api.php?action=getProducts&categorie=${id}`)
    .then(response => response.json())
    .then(data => {
      console.log(data);
      data.forEach(product => {
        if (!blacklist.includes(Number(product.ID))) {
          const div = document.createElement("div");
          items.push(div);
          document.getElementById("grid-container").appendChild(div);
          div.classList.add("grid-item");
          div.innerHTML = `<p>${product.Name}</p>
                           <img onclick='Meal(${product.ID}, ${product.Meal});' id="${product.ID}" src="${product.Image}" alt="${product.Name}">
                           <p>${`&euro;` + product.Price}</p>`;
        }
      });
    })
    .catch(error => console.error(`Error: ${error}`));
}

function reload() {
  location.reload();
}

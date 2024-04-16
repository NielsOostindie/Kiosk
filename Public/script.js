const items = [];
const blacklist = [3, 4, 5, 6, 7, 8, 9, 10];
const xhr = new XMLHttpRequest();
let filter = 0;
function buckets() {
  filter = 1;
}
function burgers() {
  filter = 2;
}
function drinks() {
  filter = 3;
}

function clear() {
  for (let i = 0; i < items.length; i++) {
    items[i].remove();
  }
}

function test() {
}

function run() {
  clear();
  xhr.open("GET", "http://localhost/Kiosk/server/Api.php?filter=" + filter);
  xhr.send();
  xhr.responseType = "json";
  xhr.onload = () => {
    if (xhr.readyState == 4 && xhr.status == 200) {
      console.log(xhr.response);
      for (let i = 0; i < xhr.response.length; i++) {
        // if (Number(blacklist.includes(xhr.response[i].ID))) {
        if (blacklist.includes(Number(xhr.response[i].ID)) == false) {
          var div = document.createElement("div");
          items.push(div);
          document.getElementById("grid-container").appendChild(div);
          div.classList.add("grid-item");
          div.innerHTML = `<img onclick='test();' id="${xhr.response[i].ID}" src="${xhr.response[i].Image}" alt="${xhr.response[i].Name}">`;
        }
      }
    } else {
      console.log(`Error: ${xhr.status}`);
    }
  };
}

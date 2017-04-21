function loadXML(filename) {
   var xmlDoc;
   if (window.ActiveXObject) {
       // If the ActiveXObject exists then we are using IE.
       xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
   } else if (document.implementation && document.implementation.createDocument) {
       // Mozilla, Firefox, Opera, etc. support document.implmentation.createDocument for loading XML files.
       xmlDoc = document.implementation.createDocument("","",null);
   } else {
       alert("Your browser cannot handle the truth! XML loading not supported.");
       return;
   }

   // No asynchronous load. (i.e. Do not allow execution of code to continue until xmlDoc.load is complete.)
   xmlDoc.async=false;
   xmlDoc.load(filename);
   return xmlDoc;
}

function load(zooRoot){
  var notFound = document.getElementsByTagName("li")[0];
  notFound.style.display="none";

  var animal_array = zooRoot.getElementsByTagName("animal");

  for(var i = 0; i < animal_array.length; i++){
    var image_array = [];
    var h3 = document.createElement("h3");
    var h4 = document.createElement("h4");
    var blockquote = document.createElement("blockquote");
    var li = document.createElement("li");

    var common_name_element = animal_array[i].getElementsByTagName("common_name")[0];
    var common_name = common_name_element.firstChild.nodeValue;
    var common_name_text = document.createTextNode(common_name);
    h3.appendChild(common_name_text);
    li.appendChild(h3);

    var scientific_name_element = animal_array[i].getElementsByTagName("scientific_name")[0];
    var scientific_name = scientific_name_element.firstChild.nodeValue;
    var scientific_name_text = document.createTextNode(scientific_name);
    h4.appendChild(scientific_name_text);
    li.appendChild(h4);

    var description_element = animal_array[i].getElementsByTagName("description")[0];
    var description = description_element.firstChild.nodeValue;
    var description_text = document.createTextNode(description);
    blockquote.appendChild(description_text);
    li.appendChild(blockquote);

    var image_element = animal_array[i].getElementsByTagName("image");

    for(var j = 0; j < image_element.length; j++){
      var img = document.createElement("img");
      img.setAttribute("src", "./images/" + image_element[j].firstChild.nodeValue);
      li.appendChild(img);
    }
    document.getElementById("animals").appendChild(li);

    if(i % 2){
      li.setAttribute("class", "zebra_background");
      
    }
  }
}

function search(){
  var input = document.getElementById("input").value.toUpperCase();
  var common_name_tag_array = document.getElementsByTagName("h3");
  var scientific_name_tag_array = document.getElementsByTagName("h4");
  var count = 0;
  var listItems = document.getElementsByTagName("li");
  var notFound = document.getElementsByTagName("li")[0];
  notFound.style.display="none";
  for(var i = 0; i < common_name_tag_array.length; i++){
    if(input == common_name_tag_array[i].firstChild.nodeValue.toUpperCase() || input == scientific_name_tag_array[i].firstChild.nodeValue.toUpperCase()){
      listItems[i + 1].style.display = "block";
    }
    else{
      listItems[i + 1].style.display = "none";
      count++;
    }
    if(count == common_name_tag_array.length){
      listItems[0].style.display = "block";
    }
  }
}

function reset(){
  var notFound = document.getElementsByTagName("li")[0];
  notFound.style.display="none";
  var listItems = document.getElementsByTagName("li");
  for(var i = 0; i < listItems.length; i++){
    listItems[i + 1].style.display = "block";
  }
}

function onLoad(){
  var zooData = loadXML("zooland.xml");
  var zooRoot = zooData.documentElement;

  var searchButton = document.getElementById("searchButton");
  var resetButton = document.getElementById("reset");

  searchButton.addEventListener("click", search, false);
  resetButton.addEventListener("click", reset, false);

  load(zooRoot);
}

document.addEventListener("DOMContentLoaded", onLoad, false); 
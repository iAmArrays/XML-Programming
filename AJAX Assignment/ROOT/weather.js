var xmlhttp=null; //ref to XMLHttpRequest object

//run a function called load when the document is loaded
document.addEventListener("DOMContentLoaded", load, false);

function processCountries() {
    xmlhttp = new XMLHttpRequest(); //doesn't work for old IE
    
    //bind an anonymous function to the onreadystatechange event
    //(this runs when we get a response from the HTTP server)
    xmlhttp.onreadystatechange=function() {
        if(xmlhttp.readyState == 4 && xmlhttp.status==200){
               
            var xmlDoc = xmlhttp.responseXML;
            var country = document.getElementById("country");
            var XMLcountry = xmlDoc.getElementsByTagName("country");
            for (var i = 0; i < XMLcountry.length; i++) {
                var option = document.createElement("option");
                option.setAttribute("value", i);
                option.innerHTML = XMLcountry[i].firstChild.nodeValue;
                country.appendChild(option);
            }
            processCities();
        }
    }
    
    xmlhttp.open("GET", "weathernew.xml", true);
    xmlhttp.send();
}

function processCities() {
    xmlhttp = new XMLHttpRequest(); //doesn't work for old IE
    
    //bind an anonymous function to the onreadystatechange event
    //(this runs when we get a response from the HTTP server)
    xmlhttp.onreadystatechange=function() {
        if(xmlhttp.readyState == 4 && xmlhttp.status==200){
               
            var xmlDoc = xmlhttp.responseXML;
            var city = document.getElementById("city");
            
            while (city.firstChild) {
                city.removeChild(city.firstChild);
            }
            
            var menu = document.getElementById('country');
            var selValue = menu.options[menu.selectedIndex].value;
            
            var XMLCountry = xmlDoc.getElementsByTagName("country")[selValue];
            var XMLcities = XMLCountry.getElementsByTagName("name");
            
            for (var i = 0; i < XMLcities.length; i++) {
                var option = document.createElement("option");
                option.setAttribute("value", i);
                option.innerHTML = XMLcities[i].firstChild.nodeValue;
                city.appendChild(option);
            }
            
            processWeather();
        }
    }
    
    xmlhttp.open("GET", "weathernew.xml", true);
    xmlhttp.send();   
}

function processWeather() {
    xmlhttp = new XMLHttpRequest(); //doesn't work for old IE
    
    //bind an anonymous function to the onreadystatechange event
    //(this runs when we get a response from the HTTP server)
    xmlhttp.onreadystatechange=function() {
        if(xmlhttp.readyState == 4 && xmlhttp.status==200){
               
            var xmlDoc = xmlhttp.responseXML;
            var output = document.getElementById("output");
            var tags = ["Name", "Temperature", "Wind", "Humidity", "Pressure", "Visibility"];
            
            while (output.firstChild) {
                output.removeChild(output.firstChild);
            }
            var countryMenu = document.getElementById('country');
            var countrySel = countryMenu.options[countryMenu.selectedIndex].value;
            
            var cityMenu = document.getElementById('city');
            var citySel = cityMenu.options[cityMenu.selectedIndex].value;
            
            var XMLCountry = xmlDoc.getElementsByTagName("country")[countrySel];
            var XMLCity = XMLCountry.getElementsByTagName("city")[citySel];
            console.log(XMLCity);
            
            for (var i = 0; i < tags.length; i++) {
                var tr = document.createElement("tr");
                var td = document.createElement("td");
                var tdInfo = document.createElement("td");
                td.innerHTML = "<span>" + tags[i] + ":</span> ";
                tdInfo.innerHTML = XMLCity.getElementsByTagName(tags[i].toLowerCase())[0].firstChild.nodeValue;
                tr.appendChild(td);
                tr.appendChild(tdInfo);
                output.appendChild(tr);
            }
        }
    }
    
    xmlhttp.open("GET", "weathernew.xml", true);
    xmlhttp.send();   
}

function load() {
    var output = document.getElementById("output");
    processCountries();
}

function loadXML() {
    xmlhttp = new XMLHttpRequest(); //doesn't work for old IE
    
    //bind an anonymous function to the onreadystatechange event
    //(this runs when we get a response from the HTTP server)
    xmlhttp.onreadystatechange=function() {
        alert("readyState: " + xmlhttp.readyState + ", status: " + xmlhttp.status);
        //"happy path" -- we got an OK response
        if(xmlhttp.readyState == 4 && xmlhttp.status==200){
            //alert("readyState: " + xmlhttp.readyState + " & status: " + xmlhttp.status);
            doSomething();
            //xmlhttp.responseText or
            //xmlhttp.responseXML contains the data
        }
    }
    xmlhttp.open("GET", "weathernew.xml", true);
    xmlhttp.send();
}

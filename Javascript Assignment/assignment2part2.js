// A cross-browser "To String" helper for xml node objects.
function xmlToString(node) {
	if (node.xml) { // Only IE supports this property.
		return node.xml;
	} else if (XMLSerializer) { // Firefox supports this.
		var my_serializer = new XMLSerializer();
		return my_serializer.serializeToString(node);
	} else {
		alert('Your browser does not support XML serialization.');
		return "";
	}
}

// This function is execute when this xhtml document loads. (Note the "onload" in the body tag.)
function loadXML(filename) {
	var xmlDoc;
	if (window.ActiveXObject) {
		// If the ActiveXObject exists then we are using IE.
		xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
	} else if (document.implementation && document.implementation.createDocument) {
		// Mozilla, Firefox, Opera, etc. support document.implmentation.createDocument for loading XML files.
		xmlDoc = document.implementation.createDocument("","",null);
	} else {
		alert('Your browser cannot handle the truth! XML loading not supported.');
		return;
	}

	// No asynchronous load. (i.e. Do not allow execution of code to continue until xmlDoc.load is complete.)
	xmlDoc.async=false;
	xmlDoc.load(filename);
	return xmlDoc;
}

function onload() {
	// Place your Javascript code for assignment three inside this function.
	// This function will be executed when you load this xhtml into a browser.
	var canadaData = loadXML("CanadaData.xml");
	var countryData = loadXML("CountryData.xml");

	var canadaRoot = canadaData.documentElement;
	var countryRoot = countryData.documentElement;

	alert(xmlToString(canadaRoot));
	alert(xmlToString(countryRoot));

	var canadaElement = canadaData.createElement("canada");

	//Get information from Canada Data and set to variables.
	var canadaPopulation = canadaRoot.getElementsByTagName("population")[0];
	var canadaLifeExpectancy = canadaRoot.getElementsByTagName("LifeExpectancy")[0];
	var canadaGDP = canadaRoot.getElementsByTagName("GDP")[0];

	//Clone the data.
	var clonedPopulation = canadaPopulation.cloneNode(true);
	var clonedLifeExpectancy = canadaLifeExpectancy.cloneNode(true);
	var clonedGDP = canadaGDP.cloneNode(true);

	//Get variable for the output div in the html.
	var output = document.getElementById("output");

	//Add the clonded data to the Canada element.
	canadaElement.appendChild(clonedPopulation);
	output.innerHTML += "<p>Population node has been added.</p>";
	canadaElement.appendChild(clonedLifeExpectancy);
	output.innerHTML += "<p>Life Expectancy node has been added.</p>";
	canadaElement.appendChild(clonedGDP);
	output.innerHTML += "<p>GDP node has been added.</p>";

	//Insert the canada element into the country data file.
	countryRoot.insertBefore(canadaElement, countryRoot.getElementsByTagName("Angola")[0]);

	alert(xmlToString(canadaRoot));
	alert(xmlToString(countryRoot));
	
	var countryComment = countryData.createComment("Population, life-expentancy and GDP data");
	countryRoot.insertBefore(countryComment, countryRoot.firstChild);


	console.dirxml(countryRoot);	
}

document.addEventListener("DOMContentLoaded", onload, false);
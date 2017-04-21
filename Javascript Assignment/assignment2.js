function onLoad()
{
	var xhtml_output_div = document.getElementById("output");
	xhtml_output_div.innerHTML = "";
	for(var i = 1; i < 101; i++){
		if(i % 15 == 0){
			xhtml_output_div.innerHTML += "<p>Wowza Cowza</p>"
		}
		else if(i % 5 == 0){
			xhtml_output_div.innerHTML += "<p>Cowza</p>"
		}
		else if(i % 3 == 0){
			xhtml_output_div.innerHTML += "<p>Wowza</p>"
		}
		else{
			xhtml_output_div.innerHTML += "<p>" + i + "</p>"
		}
	}
}

document.addEventListener("DOMContentLoaded", onLoad, false);
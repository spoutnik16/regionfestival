/**
 * Created by spoutnik16 on 10.12.14.
 * This is the ajax controller for the small "show near you" div (the one also
 * appearing in swipe for mobile devices
 */
$(document).ready(function() {if (geo_position_js.init()) {
    geo_position_js.getCurrentPosition(success_callback, error_callback,
        {enableHighAccuracy: true});
}});
function success_callback(p){
    var url = window.location.protocol+"//"+window.location.host+"/geoip/"+ p.coords.latitude+"/"+ p.coords.longitude
    alert(url);
    xmldoc = loadXMLDoc(url);
    alert("paserror" + xmldoc.text);
    return true;
    /*faire le call ajax pour remplacer la div*/

}

function error_callback(p){
    alert("error");
    return;
    /*c'est pas grave, on fait un geoip lookup tout con, et on balance la réponse au call ajax aussi*/
    var url = "http://telize.com/geoip/" + ip + "?callback=getgoip";
    var head = document.head;
    var script = document.createElement("script");

    script.setAttribute("src", url);
    head.appendChild(script);
    head.removeChild(script);
}

function loadXMLDoc(url) {
    var xmlhttp;
    if (window.XMLHttpRequest) {
        // this is code for IE7+, Firefox, Chrome, Opera, Safari, and all real browsers
        xmlhttp = new XMLHttpRequest();
    } else {
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP")
    }

    xmlhttp.onreadystatechange = function(){
        if (xmlhttp.DONE) {
            if (xmlhttp.status == 200) {
                xmlhttp.open("GET", url, true)
                xmlhttp.send();
                return xmlhttp.responseText;
            }
        }
    }
    return false;
}
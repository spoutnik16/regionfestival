/**
 * Created by spoutnik16 on 10.12.14.
 * This is the ajax controller for the small "show near you" div (the one also
 * appearing in swipe for mobile devices
 */

window.browser_geoloc = false;
var waitTime = 10000;
$(document).ready(function() {
    if (geo_position_js.init()) {
        geo_position_js.getCurrentPosition(use_browser_geoloc, try_geoip,
            {enableHighAccuracy: true});
        var t = setTimeout(function() {
            if (!window.browser_geoloc) {
                try_geoip(ip);
            };
        }, waitTime)
        }
    }
);
function use_browser_geoloc(p){
    window.browser_geoloc = true;
    call_show_near_you(p.coords);
}


function call_show_near_you(p){
    var url = "/geoip/"+ p.latitude+"/"+ p.longitude;
    loadXMLDoc(url, charge_next_reps_div);
}

function charge_next_reps_div(text) {
    $('div#tab2').replaceWith(text)
}

function try_geoip(p){
    alert('try_geoip');
    //todo remove after debugging
    if (window.browser_geoloc) {
        return;
    }
    already_loaded = true;
    /*c'est pas grave, on fait un geoip lookup tout con, et on balance la réponse au call ajax aussi*/
    var url = "http://telize.com/geoip/" + ip + "?callback=call_show_near_you";
    var head = document.head;
    var script = document.createElement("script");
    script.setAttribute("src", url);
    head.appendChild(script);
    //head.removeChild(script);
}

function loadXMLDoc(url, callback) {
    var xmlhttp;
    if (window.XMLHttpRequest) {
        // this is code for IE7+, Firefox, Chrome, Opera, Safari, and all real browsers
        xmlhttp = new XMLHttpRequest();
    } else {
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP")
    }

    xmlhttp.onreadystatechange = function() {
        if (xmlhttp.readyState == 4) {
            if (xmlhttp.status == 200) {
                callback(xmlhttp.response);
            }
        }
    }
    xmlhttp.open("GET", url, true);
    xmlhttp.send();
}
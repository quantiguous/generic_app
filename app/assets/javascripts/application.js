// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery-ui.min
//= require jquery_ujs
//= require jquery.flot
//= require generic-app
//= require_tree .
//= require jquery.superfish
//= require languages/jquery.validationEngine-en
//= require jquery.validationEngine
//= require jquery.placeholder
//= require jquery.flot.pie.js
//= require jquery.flot.resize.js
//= require jquery.flot.stack.js
//= require excanvas.js
//= require jquery.flot.time

$(document).ready(function() {

server_date = $('#clock').text();
$('#clock').hide();
var montharray=new Array("January","February","March","April","May","June","July","August","September","October","November","December")
var serverdate=new Date(server_date)

function padlength(what){
var output=(what.toString().length==1)? "0"+what : what
return output
}

setInterval( function() {
	serverdate.setSeconds(serverdate.getSeconds()+1)
	var datestring=montharray[serverdate.getMonth()]+" "+padlength(serverdate.getDate())+", "+serverdate.getFullYear()
	var timestring=padlength(serverdate.getHours())+":"+padlength(serverdate.getMinutes())+":"+padlength(serverdate.getSeconds())
	$("#servertime").html(datestring + " " + timestring);
	},1000);

$('.modal').on('hidden', function () {
  $(".formError").remove();
})

});
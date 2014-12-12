//= require active_admin/base
//= require chosen-jquery
//= require_tree ./active_admin
//= require activeadmin-sortable

$(document).ready(function(){
  $('head').append('<meta content="no-cache" http-equiv="Cache-control">');
  $('head').append('<meta content="no-store" http-equiv="Cache-control">');
  $(".ui-datepicker-inline").width("75em");
});
// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require jquery.turbolinks
//= require rails-ujs
//= require activestorage
//= require dependent-fields
//= require vendor.min
//= require underscore
//= require dependent-fields
//= require vendor/jquery.accordion
//= require vendor/jquery.selectric
//= require vendor/modernizr
//= require vendor/prism
//= require assets/app
//= require_tree .

$(document).ready(function() {
  DependentFields.bind()
});

window.setTimeout(function () {
  $(".alert").fadeTo(500, 0).slideUp(500, function () {
    $(this).remove();
  });
}, 2000);

window.onload = function() {
  document.getElementById("form-modal").style.display = 'none';
};


function selectedApproach() {
  var approach = document.getElementById("mySelect").value;
  if (approach == "Default") {
    document.getElementById("form-modal").innerHTML = "Demander mon benchmark"
  } else if (approach == "Global") {
    document.getElementById("form-modal").style.display = '';
    document.getElementById("form-modal").innerHTML = "Demander mon benchmark"
    document.getElementById("form-modal").dataset.target = "#modalGlobal";
  } else if (approach == "Finance") {
    document.getElementById("form-modal").style.display = '';
    document.getElementById("form-modal").innerHTML = "Demander mon benchmark"
    document.getElementById("form-modal").dataset.target = "#modalFinance";
  } else if (approach == "IT") {
    document.getElementById("form-modal").style.display = '';
    document.getElementById("form-modal").innerHTML = "Demander mon benchmark"
    document.getElementById("form-modal").dataset.target = "#modalIT";
  } else if (approach == "HR") {
    document.getElementById("form-modal").style.display = '';
    document.getElementById("form-modal").innerHTML = "Demander mon benchmark"
    document.getElementById("form-modal").dataset.target = "#modalHR";
  }  else if (approach == "Sales") {
    document.getElementById("form-modal").style.display = '';
    document.getElementById("form-modal").innerHTML = "Demander mon benchmark"
    document.getElementById("form-modal").dataset.target = "#modalSales";
  }
}
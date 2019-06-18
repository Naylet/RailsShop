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
//= require rails-ujs
//= require jquery
//= require jquery_ujs
//= require activestorage
//= require turbolinks
//= require_tree .

$(function() {

    $('.navbar-burger').click(function() {
        // Get the target from the "data-target" attribute
        var $target = $('#' + $(this).data('target'));

        // Toggle the class on both the "navbar-burger" and the "navbar-menu"
        $(this).toggleClass('is-active');
        $target.toggleClass('is-active');
    });
});

$(function(){
    $(".delete").click(function () {
        location.replace("/");

    })
});

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
//= require activestorage

//= require turbolinks
//= require_tree .
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require bootstrap
//= require cocoon
//= require select2

$(document).ready(function(){
  // Turn on js-selectable class so that it becomes SELCT 2 tag
  $('.js-searchable').select2({
    allowClear: false,
    width: 'resolve',
    theme: "bootstrap",
    placeholder: "Used for top line of label"
    // If you are using Bootstrap, please add　`theme: "bootstrap"` too.
  });
});

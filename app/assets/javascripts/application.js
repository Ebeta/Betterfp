// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require bootstrap
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

// Tabs and Tabs Container on Calendar page

runScript = function(){

 // Set up a listener so that when anything with a class of 'tab'
 // is clicked, this function is run.
 $('.tab').click(function () {

  // Remove the 'active' class from the active tab.
  $('#tabs_container > .tabs > li.active')
      .removeClass('active');

  // Add the 'active' class to the clicked tab.
  $(this).parent().addClass('active');

  // Remove the 'tab_contents_active' class from the visible tab contents.
  $('#tabs_container > .tab_contents_container > div.tab_contents_active')
      .removeClass('tab_contents_active');

  // Add the 'tab_contents_active' class to the associated tab contents.
  $(this.rel).addClass('tab_contents_active');

 });

}

$(document).ready(runScript);
$(document).on('page:load', runScript);


// Collapsable Medication form on Patient Form //

$(".addmedheader").click(function () {

    $addmedheader = $(this);
    //getting the next element
    $addmedcontent = $addmedheader.next();
    //open up the content needed - toggle the slide- if visible, slide up, if not slidedown.
    $addmedcontent.slideToggle(500, function () {
        //execute this after slideToggle is done
        //change text of header based on visibility of content div
        $addmedheader.text(function () {
            //change text based on condition
            return $addmedcontent.is(":visible") ? "+ Add A Medication" : "- Add A Medication";
        });
    });

});



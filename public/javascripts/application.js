// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

//Return the number of hidden pixels below the element.
jQuery.fn.scrollBottom = function() { 
  return $(document).height() - this.scrollTop() - this.height(); 
};

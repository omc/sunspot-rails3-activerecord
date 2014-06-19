// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function monkeyPatchAutocomplete() {
     var oldFn = jQuery.ui.autocomplete.prototype._renderItem;

     jQuery.ui.autocomplete.prototype._renderItem = function( ul, item) {
         var re = new RegExp(this.term, "i");
         var t = item.label.replace(re,"<span style='font-weight:bold;color:Blue;'>" +
                  "$&" +
                  "</span>");
          return $( "<li></li>" )
              .data( "item.autocomplete", item )
              .append( "<a>" + t + "</a>" )
              .appendTo( ul );
     };
}
jQuery(document).ready(function()  {
        monkeyPatchAutocomplete();
        $( ".autosuggest" ).autocomplete({
                source: "/autosuggest",
                minLength: 2,
                delay: 50,
                select: function( event, ui ) {
                    $(".autosuggest").val(ui.item.value.toString());
                    //$(this).closest('form').submit();
                }
        });
        $( ".autocomplete" ).autocomplete({
                source: "/autocomplete",
                minLength: 2,
                delay: 50,
                select: function( event, ui ) {
                    $(".autocomplete").val(ui.item.value.toString());
                    //$(this).closest('form').submit();
                }
        });
});

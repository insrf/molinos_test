$( document ).ready(function() {
  $("#container").jstree({
    "core" : {
      "check_callback" : true
     },
    "plugins" : ["dnd"],
  });
});

$( document ).ready(function() {
  $('#user_tree').jstree()
  $('#admin_tree').jstree({ 'core' : {
		'check_callback' : function (operation, node, node_parent, node_position, more) {
      $.myParam = { name: node.text, parent_name: node_parent.text, position: node_position }
		}
	},
  "plugins" : ["dnd"]}).on('move_node.jstree', function(e, data) {
    $.ajax({
      type: "POST",
      url: 'categories/sort',
      dataType: 'json',
      data: { param : $.myParam }
    })
  })
});

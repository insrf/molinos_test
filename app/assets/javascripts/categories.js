$( document ).ready(function() {
  $('#admin_tree').jstree({ 'core' : {
		'check_callback' : function (operation, node, node_parent, node_position, more) {
			// operation can be 'create_node', 'rename_node', 'delete_node', 'move_node', 'copy_node' or 'edit'
			// in case of 'rename_node' node_position is filled with the new node name
      console.log(node.text + " to " + node_parent.text)
      var val = [ node.text, node_parent.text, node_position]
      $.ajax({
        type: "POST",
        url: 'admin/categories/sort',
        dataType: 'json',
        data: {param : val}
      })
		}
	},
  "plugins" : ["dnd"]}),
  $('#user_tree').jstree()
});

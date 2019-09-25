/**
 * tiny Setting js
 */

$(document).ready(function() {

	tinymce.init({
		selector: 'textarea#editor',
		plugins: 'advlist autolink link image lists charmap print preview',
		toolbar: 'undo redo | styleselect | bold italic underline | link image |' + 
			' alignleft aligncenter alignright alignjustify|',
		height: 700,
		language: 'ko_KR',
		forced_root_block: false,
		statusbar: false,
		formats: {
		    alignleft: {selector : 'p,h1,h2,h3,h4,h5,h6,td,th,div,ul,ol,li,table,img', classes : 'left'},
		    aligncenter: {selector : 'p,h1,h2,h3,h4,h5,h6,td,th,div,ul,ol,li,table,img', classes : 'center'},
		    alignright: {selector : 'p,h1,h2,h3,h4,h5,h6,td,th,div,ul,ol,li,table,img', classes : 'right'},
		    alignjustify: {selector : 'p,h1,h2,h3,h4,h5,h6,td,th,div,ul,ol,li,table,img', classes : 'full'},
		    bold: {inline : 'span', 'classes' : 'bold'},
		    italic: {inline : 'span', 'classes' : 'italic'},
		    underline: {inline : 'span', 'classes' : 'underline', exact : true},
		    strikethrough: {inline : 'del'},
		    forecolor: {inline : 'span', classes : 'forecolor', styles : {color : '%value'}},
		    hilitecolor: {inline : 'span', classes : 'hilitecolor', styles : {backgroundColor : '%value'}},
		    custom_format: {block : 'h1', attributes : {title : 'Header'}, styles : {color : 'red'}}
		  }
	});
	
	$("#editorForm").submit(function(e) {
		
		var content = tinymce.get("editor").getContent();
		
		$("#getData").val(content);
		
		$("#editorForm").attr({
			"method" : "get",
			"action" : "/admin/info/access.do"
		});
		
		return false;
		
	});
	
});

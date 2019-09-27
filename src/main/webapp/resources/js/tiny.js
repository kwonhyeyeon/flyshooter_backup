/**
 * tiny Setting js
 */

$(document).ready(function() {

	// tinymce editor init setting
	tinymce.init({
		selector: '#tinymce',
		menubar: 'file edit view insert format tools table tc help',
		plugins: 'print preview fullpage importcss searchreplace autolink autosave save directionality visualblocks visualchars fullscreen link codesample table charmap hr pagebreak nonbreaking anchor toc insertdatetime advlist lists wordcount imagetools textpattern noneditable help charmap quickbars emoticons',
		toolbar: 'undo redo | bold italic underline strikethrough | fontselect fontsizeselect formatselect | alignleft aligncenter alignright alignjustify | outdent indent |  numlist bullist checklist | forecolor backcolor casechange permanentpen formatpainter removeformat | pagebreak | charmap emoticons | fullscreen preview save print | insertfile pageembed link anchor codesample | a11ycheck ltr rtl | showcomments addcomment',
		height: 700,
		language: 'ko_KR',
		statusbar: false,
		autosave_interval: "30s",
		content_style: '.left { text-align: left; }' +
					   'img.left { float: left; }' +
					   'table.left { float: left; }' +
					   '.right { text-align: right; }' +
					   'img.right { float: right; }' +
					   'table.right { float: right; }' +
					   '.center { text-align: center; }' +
					   'img.center { display: block; margin: 0 auto; }' +
					   'table.center { display: block; margin: 0 auto; }' +
					   '.full { text-align: justify; }' +
					   'img.full { display: block; margin: 0 auto; }' +
					   'table.full { display: block; margin: 0 auto; }' +
					   '.bold { font-weight: bold; }' +
					   '.italic { font-style: italic; }' +
					   '.underline { text-decoration: underline; }' +
					   '.example1 {}' +
					   '.tablerow1 { background-color: #D3D3D3; }' +
					   '.table { border:1px solid #dedede;}',
		formats: {
			alignleft: { selector: 'p,h1,h2,h3,h4,h5,h6,td,th,div,ul,ol,li,table,img', classes: 'left' },
			aligncenter: { selector: 'p,h1,h2,h3,h4,h5,h6,td,th,div,ul,ol,li,table,img', classes: 'center' },
			alignright: { selector: 'p,h1,h2,h3,h4,h5,h6,td,th,div,ul,ol,li,table,img', classes: 'right' },
			alignfull: { selector: 'p,h1,h2,h3,h4,h5,h6,td,th,div,ul,ol,li,table,img', classes: 'full' },
			bold: { inline: 'span', classes: 'bold' },
			italic: { inline: 'span', classes: 'italic' },
			underline: { inline: 'span', classes: 'underline', exact: true },
			strikethrough: { inline: 'del' },
			customformat: { inline: 'span', styles: { color: '#00ff00', fontSize: '20px' }}
		},
		setup: function(editor) {
            editor.on("change", function() {
                editor.save();
            });
        }
	});
	
	// 저장 버튼 클릭 시
	$("#saveTerms").click(function() {
		
		var content = tinymce.get("tinymce").getContent();
		//var content = $("#tinymce").val();
		$("#content").val(content);
		
		$("#innerForm").attr({
			"method" : "post",
			"action" : "/admin/terms/access.do"
		});
		
		$("#innerForm").submit();
		
	});
	
});

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
		auto_focus: 'element1',
		autosave_ask_before_unload: true, // 현재 창을 닫을 때 저장하지 않은 변경 사항이 있음을 알림
		autosave_interval: "30s",
		autosave_restore_when_empty: true, // 비어있을 때 로컬에 있는 값 자동으로 불러옴
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
				$("#saveTerms").removeAttr("disabled");
			});
			
			$("#saveTerms").click(function() {
				
				//var content = tinymce.get("tinymce").getContent();
				var content = tinymce.activeEditor.getContent({format: 'document'});
				$("#content").val(content);
				
				$("#innerForm").attr({
					"method" : "post",
					"action" : "/admin/terms/access.do"
				});
				
				$("#innerForm").submit();
			});
		}
	});
	
});

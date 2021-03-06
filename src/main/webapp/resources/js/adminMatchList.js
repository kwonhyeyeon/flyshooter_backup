/*
 * 
 */

$(document).ready(function() {
            // 한 페이지에 보여줄 레코드 수 변경 될 때마다 처리 스크립트
            $("#pageSize").change(function() {
                goPage(1);
            });

            var url = "/admin/match/matchView.do";

            // 리스트 클릭시 상세 보기 페이지로 이동
            $(".mListView").click(function() {
                var mb_no = $(this).parents("tr").attr("data-num");
                var data = $("#mb_no").val(mb_no);
                $.ajax({
                    type: "get",
                    url: url,
                    data: data,
                    success: function(result) {
                        $('#matchViewForm').text("");
                        $('#matchViewForm').show();
                        $('#matchViewForm').append(result);
                        $("#matchViewForm").dialog({
                            autoOpen: false,
                            width: "600px",
                            modal: true,
                            closeOnEscape: false,
                            open: function(event, ui) {
                                $(".ui-dialog-titlebar", $(this).parent()).hide();
                            }
                        });

                        $("#matchViewForm").dialog("open");

                    }
                });
            });

        })

        // 검색과 한 페이지에 보여줄 레코드 수 처리 및 페이징을  위한 스크립트
        function goPage(page) {
            $("#page").val(page);
            $("#m_search").attr({
                "method": "get",
                "action": "/admin/match/matchList.do"
            });
            $("#m_search").submit();
        }

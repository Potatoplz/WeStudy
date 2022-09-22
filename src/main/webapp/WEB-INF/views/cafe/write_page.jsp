<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <html>

        <head>
            <meta charset="UTF-8">
            <title> 카페등록 </title>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
            <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/ucafe/popper.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
            <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
            <script src="//cdn.ckeditor.com/4.19.0/full/ckeditor.js"></script>
            <script type="text/javascript">
                $(document).ready(function () {
                    $("#addr_btn").click(function () {

                        new daum.Postcode({
                            oncomplete: function (data) {//data : 다음에서 주는 결과 값.
                                $("#post_code").val(data.zonecode);
                                $("#cafe_addr1").val(data.address);
                            }//call back function
                        }).open();

                    });//click
                });//ready
            </script>
            <style type="text/css">
                .write_label {
                    font-size: 0.7em;
                    color: red;
                }
            </style>
        </head>

        <body>

            <div class="container">
                <!-- section 시작--------------------------------------------------------------------------------- -->
                <section class="col-15 h-100 bg-white float-left">
                    <h3>카페등록 </h3>
                    <!-- <hr style="width:100%;height:2px;border:none;background-color:black;"> -->
                    <div class="container">
                        <form id="write_form">
                            <table class="table table-hover">
                                <tbody id="room_data">
                                    <tr>
                                        <th> 지역 </th>
                                        <td colspan="10">
                                            <select id="cafe_category" name="cafe_category">
                                                <option value="kind" selected disabled hidden>지역구</option>
                                                <option value="강남구">강남구</option>
                                                <option value="강동구">강동구</option>
                                                <option value="강북구">강북구</option>
                                                <option value="강서구">강서구</option>
                                                <option value="관악구">관악구</option>
                                                <option value="광진구">광진구</option>
                                                <option value="구로구">구로구</option>
                                                <option value="금천구">금천구</option>
                                                <option value="노원구">노원구</option>
                                                <option value="도봉구">도봉구</option>
                                                <option value="동대문구">동대문구</option>
                                                <option value="서대문구">서대문구</option>
                                                <option value="서초구">서초구</option>
                                                <option value="성동구">성동구</option>
                                                <option value="성북구">성북구</option>
                                                <option value="송파구">송파구</option>
                                                <option value="양천구">양천구</option>
                                                <option value="영등포구">영등포구</option>
                                                <option value="용산구">용산구</option>
                                                <option value="은평구">은평구</option>
                                                <option value="종로구">종로구</option>
                                                <option value="중구">중구</option>
                                                <option value="중랑구">중랑구</option>
                                            </select>
                                    </tr>
                                    <tr>
                                        <th> 카페이름 </th>
                                        <td colspan="10">
                                            <input type="text" id="cafe_name" name="cafe_name" maxlength="20"
                                                class="form-control">
                                            <label for="cafe_name" id="cafe_name_label" class="write_label"></label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th> 영업시작 시간 </th>
                                        <td colspan="3">
                                            <input type="text" id="open_time" name="open_time" maxlength="20"
                                                class="form-control">
                                            <label for="open_time" id="open_time_label" class="write_label"></label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th> 영업종료 시간 </th>
                                        <td colspan="3">
                                            <input type="text" id="close_time" name="close_time" maxlength="20"
                                                class="form-control">
                                            <label for="close_time" id="close_time_label" class="write_label"></label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th> 한 줄 설명 </th>
                                        <td colspan="10">
                                            <input type="text" id="cafe_oneline" name="cafe_oneline" maxlength="20"
                                                class="form-control">
                                            <label for="cafe_oneline" id="cafe_oneline_label"
                                                class="write_label"></label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th> 카 페 주 소 </th>
                                        <td>
                                            <div class="form-inline">
                                                <input type="text" id="post_code" name="post_code" readonly="readonly"
                                                    class="form-control mb-1 mr-1">
                                                <button id="addr_btn" type="button" class="btn btn-info btn-sm mb-1">
                                                    주 소 찾 기
                                                </button>
                                            </div>
                                            <input type="text" id="cafe_addr1" name="cafe_addr1" readonly="readonly"
                                                class="form-control mb-1">
                                            <input type="text" id="cafe_addr2" name="cafe_addr2" class="form-control"
                                                maxlength="50">
                                            <label for="post_code" id="post_code_label" class="write_label"></label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th> 카페 이미지1 </th>
                                        <td>
                                            <input type="file" id="cafe_img1" name="cafe_img1" class="form-control">
                                            <label for="cafe_img1" id="cafe_img1_label" class="write_label"></label>
                                        </td>
                                        <th>카페 이미지2 </th>
                                        <td>
                                            <input type="file" id="cafe_img2" name="cafe_img2" class="form-control">
                                            <label for="cafe_img2" id="cafe_img2_label" class="write_label"></label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th> 공간소개 </th>
                                        <td colspan="10">
                                            <textarea class="form-contol" id="content" name="content"></textarea>
                                            <script type="text/javascript">
                                                CKEDITOR.replace("content");
                                            </script>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th> 시설안내 </th>
                                        <td colspan="10">
                                            <textarea class="form-contol" id="content2" name="content2"></textarea>
                                            <script type="text/javascript">
                                                CKEDITOR.replace("content2");
                                            </script>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th> 유의사항 </th>
                                        <td colspan="10">
                                            <textarea class="form-contol" id="content3" name="content3"></textarea>
                                            <script type="text/javascript">
                                                CKEDITOR.replace("content3");
                                            </script>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th> 최대 인원 </th>
                                        <td colspan="10">
                                            <input type="text" id="max_people" name="max_people" maxlength="20" class="form-control">
                                            <label for="max_people" id="max_people_label" class="write_label"></label>
                                        </td>
                                        <th> 시간당 가격 </th>
                                        <td colspan="10">
                                            <input type="text" id="price_hour" name="price_hour" maxlength="20" class="form-control">
                                            <label for="price_hour" id="price_hour_label" class="write_label"></label>
                                        </td>
                                        <th> 방 이름 </th>
                                        <td colspan="10">
                                            <input type="text" id="room_name" name="room_name" maxlength="20" class="form-control">
                                            <label for="room_name" id="room_name_label" class="write_label"></label>
                                        </td>
                                        <!-- <div class="btnWrap">
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    <button id="plus_btn" class="btn btn-primary float-right">추가</button>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                </div> -->
                                    </tr>
                                </tbody>
                            </table>
                        </form>
                        <button id="write_btn" class="btn btn-primary float-right"> 저장하기 </button>
                        <button id="plus_btn" class="btn btn-primary float-right">추가</button>
                        <a href="${pageContext.request.contextPath}/cafe/list">
                            <button class="btn btn-warning"> 취소 </button>
                        </a>
                        <!-- 버튼 -->
                        <hr>
                        <script type="text/javascript">

                                                $(document).ready(function () {
                                                    var i = 0; // 변수설정은 함수의 바깥에 설정!
                                                    $("#plus_btn").click(function () {
                                                        let max_people = $("#max_people").val();
                                                        let price_hour = $("#price_hour").val();
                                                        let room_name = $("#room_name").val();
                                                        $("#room_data").append(
                                                            '<tr name="room">' +
                                                            '<td id="arr_max_people' + i + '" name="arr_max_people' + i + '">' + max_people + '명 </td>' +
                                                            '<td id="arr_price_hour' + i + '" name="arr_price_hour' + i + '">' + price_hour + '원 </td>' +
                                                            '<td id="arr_room_name' + i + '" name="arr_room_name' + i + '">' + room_name + ' </td>' +
                                                            '</tr>');
                                                        i++; // 함수 내 하단에 증가문 설정
                                                    });
                                                });
                                                let onlyNum = /^[0-9]+$/;

                                                $(document).ready(function () {
                                                    $("#write_btn").click(function () {

                                                    if ($.trim($("#cafe_name").val()) == "") {
                                                        $("#cafe_name_label").text("카페명을 입력 하세요.");
                                                        return;
                                                    } else { $("cafe_name_label").text(""); }

                                    // if ($("#price_hour").val().match(onlyNum) == null) {//허용되지 않은 글자는 null.
                                    //     $("#price_hour_label").text("필수 입력 사항이며, 숫자만 허용 됩니다.");
                                    //     return;
                                    // } else { $("#price_hour_label").text(""); }

                                                    if ($("#open_time").val().match(onlyNum) == null) {//허용되지 않은 글자는 null.
                                                        $("#open_time_label").text("필수 입력 사항이며, 숫자만 허용 됩니다.");
                                                        return;
                                                    } else { $("#open_time_label").text(""); }

                                                    if ($("#close_time").val().match(onlyNum) == null) {//허용되지 않은 글자는 null.
                                                        $("#close_time_label").text("필수 입력 사항이며, 숫자만 허용 됩니다.");
                                                        return;
                                                    } else { $("#close_time_label").text(""); }

                                                    if ($.trim($("#post_code").val()) == ""
                                                        || $.trim($("#cafe_addr1").val()) == ""
                                                        || $.trim($("#cafe_addr2").val()) == "") {
                                                        $("#post_code_label").text("주소를 입력 하세요.");
                                                        return;
                                                    } else { $("#post_code_label").text(""); }

                                                    let tmp1 = $("#cafe_img1").val().substring($("#cafe_img1").val().length - 3);
                                                    let tmp1_boolean = (tmp1 == "jpg" || tmp1 == "jpeg" || tmp1 == "gif" || tmp1 == "png"
                                                        || tmp1 == "JPG" || tmp1 == "JPEG" || tmp1 == "GIF" || tmp1 == "PNG");
                                                    if ($.trim($("#cafe_img1").val()) == "" || tmp1_boolean == false) {
                                                        $("#cafe_img1_label").text("필수 입력 사항이며, jpg/jpeg/gif/png 파일만 허용 됩니다.");
                                                        return;
                                                    } else { $("#cafe_img1_label").text(""); }

                                                    let tmp2 = $("#cafe_img2").val().substring($("#cafe_img2").val().length - 3);
                                                    let tmp2_boolean = (tmp2 == "jpg" || tmp2 == "jpeg" || tmp2 == "gif" || tmp2 == "png"
                                                        || tmp2 == "JPG" || tmp2 == "JPEG" || tmp2 == "GIF" || tmp2 == "PNG");
                                                    if ($.trim($("#cafe_img2").val()) != "" && tmp2_boolean == false) {
                                                        $("#cafe_img2_label").text("상품이미지는 jpg/jpeg/gif/png 파일만 허용 됩니다.");
                                                        return;
                                                    } else { $("#cafe_img2_label").text(""); }

                                                    let form = new FormData(document.getElementById("write_form"));
                                                    form.append("cafe_content1", CKEDITOR.instances.content.getData());
                                                    form.append("cafe_content2", CKEDITOR.instances.content2.getData());
                                                    form.append("cafe_content3", CKEDITOR.instances.content3.getData());

                                                        let list = document.getElementsByName("room");
                                                        for (let index = 0; index < list.length; index++) {
                                                            let max_people = $("#arr_max_people" + index).text();
                                                            let price_hour = $("#arr_price_hour" + index).text();
                                                            let room_name = $("#arr_room_name" + index).text();
                                                            alert(max_people);
                                                            alert(price_hour);
                                                            alert(room_name);
                                                            form.append("arr_max_people[" + index + "]", parseInt(max_people));
                                                            form.append("arr_price_hour[" + index + "]", parseInt(price_hour));
                                                            form.append("arr_room_name[" + index + "]", room_name);
                                                        }
                                                    $.ajax({
                                                        type: "POST"
                                                        , encType: "multipart/form-data"
                                                        , url: "${pageContext.request.contextPath}/cafe/insert"
                                                        , data: form
                                                        , processData: false
                                                        , contentType: false
                                                        , cache: false
                                                        , success: function (result) {
                                                            alert("카페가 등록 되었습니다.");
                                                            location.href = "${pageContext.request.contextPath}/cafe/cafe_list";
                                                        }//call back function
                                                        , error: function (xhr) {
                                                            alert("잠시 후 다시 시도해 주세요.");
                                                        }//call back function//xhr : xml http request/response
                                                    });//ajax
                                                });//click
                                            });//ready
                                                </script>
                    </div>



                </section>
                <!-- section 끝---------------------------------------------------------------------------- -->
                </main>


            </div><!-- container -->
        </body>

        </html>
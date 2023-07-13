<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!-- 작성 가능한 후기 출력 버튼 -->
<button onclick="getWritableComments()">작성 가능한 후기 출력</button>

<div id="writableCommentsContainer"></div>

<script>
    function getWritableComments() {
        $.ajax({
            url: "jsonSelectWritableComments.do",
            type: "GET",
            dataType: "json",
            success: function (data) {
                var writableCommentsContainer = $("#writableCommentsContainer");
                writableCommentsContainer.empty();
                
                data.reservations.forEach(function (reservation) {
                    var reservationInfo = "ID: " + reservation.ID + ", QUANTITY: " + reservation.QUANTITY + ", PRICE: " + reservation.PRICE + ", RES_DATE: " + reservation.RES_DATE + ", PRICE_FINAL: " + reservation.PRICE_FINAL + ", ACT_ID: " + reservation.ACT_ID + ", USER_ID: " + reservation.USER_ID;
                    var reservationElement = $("<p>").text(reservationInfo);
                    writableCommentsContainer.append(reservationElement);
                });
            },
            error: function () {
                console.log("Error occurred while retrieving writable comments.");
            }
        });
    }
</script>

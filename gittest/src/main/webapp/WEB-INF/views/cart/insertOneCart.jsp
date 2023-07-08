<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>Cart Project</title>
    <script src="${pageContext.request.contextPath}/resources/jquery/jquery-3.3.1.min.js"></script>
</head>
<body>
    <section id="content">
        <ul>
            <li>
                <div class="allCheck">
                    <input type="checkbox" name="allCheck" id="allCheck"/>
                    <label for="allCheck">모두 선택</label>
                </div>

                <div class="delBtn">
                    <button type="button" class="selectDelete_btn">선택 삭제</button>
                </div>
            </li>

            <c:set var="sum" value="0" />

            <c:forEach items="${cartList}" var="cartItem">
                <li>
                    <div class="checkBox">
                        <input type="checkbox" name="chBox" class="chBox" data-cartNum="${cartItem.cartNum}" />
                    </div>

                    <div class="thumb">
                        <img src="${cartItem.gdsThumbImg}" alt="상품 이미지">
                    </div>
                    <div class="gdsInfo">
                        <p>
                            <span>상품명</span>${cartItem.gdsName}<br/> 
                            <span>개당 가격</span>
                            <fmt:formatNumber pattern="###,###,###" value="${cartItem.gdsPrice}"/>원<br/> 
                            <span>구입 수량</span>${cartItem.cartStock} 개<br/> 
                            <span>최종 가격</span>
                            <fmt:formatNumber pattern="###,###,###" value="${cartItem.gdsPrice * cartItem.cartStock}"/>원
                        </p>

                        <div class="delete">
                            <button type="button" class="delete_btn" data-cartNum="${cartItem.cartNum}">삭제</button>
                        </div>
                    </div>
                </li>

                <c:set var="sum" value="${sum + (cartItem.gdsPrice * cartItem.cartStock)}" />
            </c:forEach>
        </ul>

        <div class="listResult">
            <div class="sum">
                총 합계 : <fmt:formatNumber pattern="###,###,###" value="${sum}" /> 원
            </div>
            <div class="orderOpne">
                <button type="button" class="orderOpne_btn">주문 정보 입력</button>
            </div>
        </div>

        <div class="orderInfo">
            <form role="form" method="post" autocomplete="off">
                <input type="hidden" name="amount" value="${sum}" />
                <div class="inputArea">
                    <label for="">수령인</label> <input type="text" name="orderRec" id="orderRec" required="required" />
                </div>

                <div class="inputArea">
                    <button type="submit" class="order_btn">주문</button>
                    <button type="button" class="cancel_btn">취소</button>
                </div>
            </form>
        </div>
    </section>

    <script>
        $(document).ready(function() {
            $("#allCheck").click(function() {
                var chk = $(this).prop("checked");
                $(".chBox").prop("checked", chk);
            });

            $(".selectDelete_btn").click(function() {
                var confirm_val = confirm("정말 삭제하시겠습니까?");
                if (confirm_val) {
                    var checkArr = [];
                    $(".chBox:checked").each(function() {
                        checkArr.push($(this).attr("data-cartNum"));
                    });

                    $.ajax({
                        url: "${pageContext.request.contextPath}/shop/deleteCart",
                        type: "post",
                        data: {chbox: checkArr},
                        success: function(result) {
                            if (result == 1) {
                                location.href = "${pageContext.request.contextPath}/shop/cartList";
                            } else {
                                alert("삭제 실패");
                            }
                        }
                    });
                }
            });

            $(".delete_btn").click(function() {
                var confirm_val = confirm("정말 삭제하시겠습니까?");
                if (confirm_val) {
                    var checkArr = [];
                    checkArr.push($(this).attr("data-cartNum"));

                    $.ajax({
                        url: "${pageContext.request.contextPath}/shop/deleteCart",
                        type: "post",
                        data: {chbox: checkArr},
                        success: function(result) {
                            if (result == 1) {
                                location.href = "${pageContext.request.contextPath}/shop/cartList";
                            } else {
                                alert("삭제 실패");
                            }
                        }
                    });
                }
            });

            $(".orderOpne_btn").click(function() {
                $(".orderInfo").slideDown();
                $(".orderOpne_btn").slideUp();
            });

            $(".cancel_btn").click(function() {
                $(".orderInfo").slideUp();
                $(".orderOpne_btn").slideDown();
            });
        });
    </script>
</body>
</html>

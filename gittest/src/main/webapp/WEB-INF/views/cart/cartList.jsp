<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cart Project - 장바구니</title>
</head>
<body>
    <h1>장바구니</h1>
    <table>
        <tr>
            <th>상품명</th>
            <th>가격</th>
            <!-- 기타 필요한 컬럼들 -->
        </tr>
<%--         <% for (Activity act : cartList) { %> --%>
<!--             <tr> -->
<%--                 <td><%= act.getActivityName() %></td> --%>
<%--                 <td><%= act.getPrice() %></td> --%>
<!--                 기타 필요한 컬럼들의 데이터 표시 -->
<!--             </tr> -->
<%--         <% } %> --%>
    </table>
    
    <!-- Insert Reservation -->
    <form action="insertOneReservation.do" method="POST">
        <label for="act_id">상품번호:</label>
        <input type="text" name="act_id">
        <label for="option_id">옵션번호:</label>
        <input type="text" name="option_id">
        <label for="res_date">예약일:</label>
        <input type="text" name="res_date">
        <label for="quantity">수량:</label>
        <input type="text" name="quantity">
        <input type="submit" value="단일 상품 예약">
    </form>
    
    <form action="insertManyReservation.do" method="POST">
        <label for="act_id">상품번호:</label>
        <input type="text" name="act_id">
        <label for="option_id">옵션번호:</label>
        <input type="text" name="option_id">
        <label for="res_date">예약일:</label>
        <input type="text" name="res_date">
        <label for="quantity">수량:</label>
        <input type="text" name="quantity">
        <input type="submit" value="다중 상품 예약">
    </form>
    
    <!-- Delete Cart Items -->
<!--     <form action="deleteManyCart.do" method="POST"> -->
<!--         <input type="submit" value="선택 삭제"> -->
<%--         <% for (Activity act : cartList) { %> --%>
<%--             <input type="checkbox" name="act_ids" value="<%= act.getActId() %>"> --%>
<%--         <% } %> --%>
<!--     </form> -->
    
<%--     <% for (Activity act : cartList) { %> --%>
<!--         <form action="deleteOneCart.do" method="GET"> -->
<%--             <input type="hidden" name="act_id" value="<%= act.getActId() %>"> --%>
<!--             <input type="submit" value="삭제"> -->
<!--         </form> -->
<%--     <% } %> --%>
</body>
</html>

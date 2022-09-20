<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h1>결제 정보 입력</h1>

<form action="confirm" method="post">
	partner_order_id: <input type="text" name="partner_order_id" required><br><br>
	partner_user_id: <input type="text" name="partner_user_id" required><br><br>
	item_name: <input type="text" name="item_name" required><br><br>
	quantity: <input type="text" name="quantity" required><br><br>
	total_amount: <input type="text" name="total_amount" required><br><br>
	<input type="submit" value="결제하기">
</form> 
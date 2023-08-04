<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,my.model.*,my.dao.*,my.util.*,java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>DETAILS</title>
<!-- css파일 삽입 위치 -->
   <link href="../css/project.css" rel="stylesheet" type="text/css" />
   <link href="../css/join.css" rel="stylesheet" type="text/css" />
</head>

<body>
	<div id="wrap">
      <!-- page_header 삽입 위치 -->
		<jsp:include page="../global/page_header.jsp" flush="false"/>
		
	<div class="product_view">
		<%
		Connection conn = ConnectionProvider.getConnection();
		int pCount = (int)session.getAttribute("pCount");
		Project_Items items = null;
		String userId = (String)session.getAttribute("LOGINID");
		try{
			Project_ItemsDao dao = new Project_ItemsDao();
			Project_PurchaseDao purDao = new Project_PurchaseDao();
			
			Project_Cart cart = null;
		   	for(int i=1; i<= pCount; i++) {
		     	cart = (Project_Cart)session.getAttribute("p" + i);
		     	items = dao.selectById(conn, cart.getIid());
				java.util.Date now = new java.util.Date();
				java.util.Date unow = null; 
				Project_Purchase purchase = new Project_Purchase(userId, cart.getIid(), items.getName(), cart.getAmount(), items.getPrice(), now, unow);
		     	purDao.insert(conn, purchase);
		   	}
		}catch(SQLException e){
			
		}finally{
			JdbcUtil.close(conn);
		}
		%>
	<div class="chuka_joinComplete">
	    <div class="joinComplete">
	        <h3><img src="images/폭죽.png" width = 300px height = 300px/></h3>
	        <p class="desc">구매가 완료되었습니다</p>
	    </div>
	    <div class="button">
	    	<a href="project.jsp"><img src="images/main.gif" alt="메인으로 이동"  width = 200 height = 60px /></a>
	    </div>	    
	</div>

      <!-- page_footer 삽입 위치 -->
      <jsp:include page="../global/page_footer.jsp" flush="false"/>
	</div>

<script>
function putCart(frm){
	var amount = frm.amount.value.trim();
	var id = frm.iid.value.trim();
	var image = frm.image.value.trim();
	window.open("sub9_cartview.jsp?iid="+id+"&amount="+amount+"&image="+image,"");
}

function putPurchase(frm){
	var amount = frm.amount.value.trim();
	var id = frm.iid.value.trim();
	window.open("sub9_buynow.jsp?iid="+id+"&amount="+amount);
}

</script>

</body>
</html>

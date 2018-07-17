<%--
  Created by IntelliJ IDEA.
  User: pro
  Date: 2018. 7. 9.
  Time: PM 5:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>Title</title>
</head>
<body>
	<c:forEach items="${alist}" var="bean">
		<h1>${bean.id}</h1>
	</c:forEach>
</body>
</html>

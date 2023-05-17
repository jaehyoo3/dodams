<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/resources/css/user/startPage.css">
   	<link rel="shortcut icon" href="/resources/images/favicon2.ico" type="image/x-icon">
	<link rel="icon" href="/resources/images/favicon2.ico" type="image/x-icon">
    <title>DODAM</title>
</head>
<body>

<div class="box-left">
    <a href="login" class="card-user education"></a>
    <br>
    <p>USER PAGE</p>
</div>

<div class="box-right">
    <a href="/bdmin/CodeList" class="card-admin education"></a>
    <br>
    <p>ADMIN PAGE</p>
</div>
</body>
</html>
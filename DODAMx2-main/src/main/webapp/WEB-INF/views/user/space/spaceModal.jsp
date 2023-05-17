<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>
<%@ page session="true"%>
<link rel="stylesheet" href="/resources/css/user/spaceModal.css">

<div class="modal">
        <div class="modal-content">
            <ul class="HeaderList">
                <li><h3 class="text-warning">경고!</h3></li>
                <li><span id="close-modal">&times;</span></li>
            </ul>    
            <div class="modal-header">
                <p>정말로 깃발을 삭제하시겠습니까?</p>
            <br><br><br>
            </div><br>
            <div class="modal-body">
                <button id="btnModalUelete">확인</button>
                <button type="button" id="closeBtn">취소</button>
            </div>
        </div>
    </div>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags"%>
<jsp:useBean id="now" class="java.util.Date" />
 
<nav class="header">
            <div class="header-logo">
                <a href="main">DODAM</a><span class="spname"><c:out value="${item.zbspName }"/></span>
            </div>
            <div class="header-userbox" id="open-memberList-modal">
                <img class="user-img" src="https://cdn-icons-png.flaticon.com/512/476/476700.png" alt="">
                <div class="user-name">스페이스 회원수</div>
                <div class="user_count"><c:out value="${fn:length(list)}"/>명</div>
            </div>
        </nav>
        <div class="memberList-modal">
            <div class="modalBox">
                <div class="memberList-modal-content">
                    <div class="modal-header">
                        <h3>스페이스이름들어옵니다</h3>
                        <span id="close-memberList-modal">&times;</span>
                    </div>
                    <ul class="memberList-modal-body">
                    <c:forEach items="${list}" var="list">
                        <li class="userBOX">
                            <img class="userBOXImg" src="<c:out value="${list.path}"/><c:out value="${list.uuidName}"/>">
                            <span class="userBOXId"><c:out value="${list.zbmmID }"/></span>
                            <span class="userBOXName"><c:out value="${list.zbmmName }"/></span>
                        </li>
                     </c:forEach>
                    </ul>
                </div>    
            </div>
        </div>

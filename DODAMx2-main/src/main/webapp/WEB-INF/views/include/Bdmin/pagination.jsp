<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" trimDirectiveWhitespaces="true"%>
<div class="pagination_wrap">
	<ul class="pagination modal-2">
		<c:if test="${vo.startPage gt vo.pageNumToShow}">
			<li> <a href="javascript:goList(${vo.startPage - 1})" class="prev">&laquo </a></li>
		</c:if>
		<c:forEach begin="${vo.startPage}" end="${vo.endPage}" varStatus="i">
			<c:choose>    
			<c:when test="${i.index eq vo.thisPage}">
				<li> <a  class="active" href="javascript:goList(${i.index})">${i.index}</a></li>
			</c:when>
			<c:otherwise>
				<li><a href="javascript:goList(${i.index})">${i.index}</a></li>
			</c:otherwise>
			</c:choose>
		</c:forEach> 
		<c:if test="${vo.endPage ne vo.totalPages}">   
			<li><a  class="next" href="javascript:goList(${vo.endPage + 1})">  &raquo;</a></li>
		</c:if>	
	</ul>
	<br>
</div>
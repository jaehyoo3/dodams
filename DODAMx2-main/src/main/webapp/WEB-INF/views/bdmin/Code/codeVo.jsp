<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true"%>
<input type="hidden" name="thisPage" value="<c:out value="${vo.thisPage}" default="1"/>">
<input type="hidden" name="rowNumToShow" value="<c:out value="${vo.rowNumToShow}"/>">
<input type="hidden" name="codeGroupDelNy" value="<c:out value="${vo.codeGroupDelNy}"/>"/>
<input type="hidden" name="codeGroupUseNy" value="<c:out value="${vo.codeGroupUseNy}"/>"/>
<input type="hidden" name="shdateStart" value="<c:out value="${vo.shdateStart}"/>"/>
<input type="hidden" name="shdateEnd" value="<c:out value="${vo.shdateEnd}"/>"/>
<input type="hidden" name="shOption" value="<c:out value="${vo.shOption}"/>"/>
<input type="hidden" name="shValue" value="<c:out value="${vo.shValue}"/>"/>
<input type="hidden" name="codeGroupSeq" value="<c:out value="${vo.codeGroupSeq}"/>"/>
package com.dodam.infra.modules.main;

import java.util.Date;

import com.dodam.infra.modules.member.Member;

public class Main extends Member{
	
	
	//space
	private String zbspSeq;
	private String zbspName;
	private Date zbspStartDate;
	private Date zbspEndDate;
	private Integer zbspDelNy;
	private Integer zbspShareNy;
	private Integer zbspEndNy;
	private Date zbspRegDate;
	
	//조인 컬럼
	private Integer xSpaceUser;
	private Integer xTravelFlag;
	private String xAdminUser;
	private Integer xLikeAvg;
	
	private String zbmmName;
	private String zbmmId;
	private String zbmmSeq;
	
	
	//spaceKeyword
	private String zbskSeq;
	private String zbskKeywordCode;
	private String zbskKeywordType;
	private Integer zbskDelNy;
	
	//spaceInvite
	private String zbsiSeq;
	private Integer zbsiInviteNy;
	private Integer zbzsiDelNy;
	
	//sess
	private String sessSeq;
	private String sessId;
	
	private Integer xBoardCount;
	
	// 멤버수 카운트
	private String zbmmCount;
	private Double zbspavg;
	
	/* private Object SearchArrey; */
	

	public String getZbspSeq() {
		return zbspSeq;
	}
	public String getZbmmCount() {
		return zbmmCount;
	}
	public void setZbmmCount(String zbmmCount) {
		this.zbmmCount = zbmmCount;
	}
	public void setZbspSeq(String zbspSeq) {
		this.zbspSeq = zbspSeq;
	}
	public String getZbspName() {
		return zbspName;
	}
	public void setZbspName(String zbspName) {
		this.zbspName = zbspName;
	}
	public Date getZbspStartDate() {
		return zbspStartDate;
	}
	public void setZbspStartDate(Date zbspStartDate) {
		this.zbspStartDate = zbspStartDate;
	}
	public Date getZbspEndDate() {
		return zbspEndDate;
	}
	public void setZbspEndDate(Date zbspEndDate) {
		this.zbspEndDate = zbspEndDate;
	}
	public Integer getZbspDelNy() {
		return zbspDelNy;
	}
	public void setZbspDelNy(Integer zbspDelNy) {
		this.zbspDelNy = zbspDelNy;
	}
	public Integer getZbspShareNy() {
		return zbspShareNy;
	}
	public void setZbspShareNy(Integer zbspShareNy) {
		this.zbspShareNy = zbspShareNy;
	}
	public Integer getZbspEndNy() {
		return zbspEndNy;
	}
	public void setZbspEndNy(Integer zbspEndNy) {
		this.zbspEndNy = zbspEndNy;
	}
	public Date getZbspRegDate() {
		return zbspRegDate;
	}
	public void setZbspRegDate(Date zbspRegDate) {
		this.zbspRegDate = zbspRegDate;
	}
	public Integer getxSpaceUser() {
		return xSpaceUser;
	}
	public void setxSpaceUser(Integer xSpaceUser) {
		this.xSpaceUser = xSpaceUser;
	}
	public Integer getxTravelFlag() {
		return xTravelFlag;
	}
	public void setxTravelFlag(Integer xTravelFlag) {
		this.xTravelFlag = xTravelFlag;
	}
	public String getxAdminUser() {
		return xAdminUser;
	}
	public void setxAdminUser(String xAdminUser) {
		this.xAdminUser = xAdminUser;
	}
	public Integer getxLikeAvg() {
		return xLikeAvg;
	}
	public void setxLikeAvg(Integer xLikeAvg) {
		this.xLikeAvg = xLikeAvg;
	}
	public String getZbmmName() {
		return zbmmName;
	}
	public void setZbmmName(String zbmmName) {
		this.zbmmName = zbmmName;
	}
	public String getZbmmId() {
		return zbmmId;
	}
	public void setZbmmId(String zbmmId) {
		this.zbmmId = zbmmId;
	}
	public String getZbmmSeq() {
		return zbmmSeq;
	}
	public void setZbmmSeq(String zbmmSeq) {
		this.zbmmSeq = zbmmSeq;
	}
	public String getZbskSeq() {
		return zbskSeq;
	}
	public void setZbskSeq(String zbskSeq) {
		this.zbskSeq = zbskSeq;
	}
	public String getZbskKeywordCode() {
		return zbskKeywordCode;
	}
	public void setZbskKeywordCode(String zbskKeywordCode) {
		this.zbskKeywordCode = zbskKeywordCode;
	}
	public String getZbskKeywordType() {
		return zbskKeywordType;
	}
	public void setZbskKeywordType(String zbskKeywordType) {
		this.zbskKeywordType = zbskKeywordType;
	}
	public Integer getZbskDelNy() {
		return zbskDelNy;
	}
	public void setZbskDelNy(Integer zbskDelNy) {
		this.zbskDelNy = zbskDelNy;
	}
	public String getZbsiSeq() {
		return zbsiSeq;
	}
	public void setZbsiSeq(String zbsiSeq) {
		this.zbsiSeq = zbsiSeq;
	}
	public Integer getZbsiInviteNy() {
		return zbsiInviteNy;
	}
	public void setZbsiInviteNy(Integer zbsiInviteNy) {
		this.zbsiInviteNy = zbsiInviteNy;
	}
	public Integer getZbzsiDelNy() {
		return zbzsiDelNy;
	}
	public void setZbzsiDelNy(Integer zbzsiDelNy) {
		this.zbzsiDelNy = zbzsiDelNy;
	}
	public String getSessSeq() {
		return sessSeq;
	}
	public void setSessSeq(String sessSeq) {
		this.sessSeq = sessSeq;
	}
	public String getSessId() {
		return sessId;
	}
	public void setSessId(String sessId) {
		this.sessId = sessId;
	}
	public Integer getxBoardCount() {
		return xBoardCount;
	}
	public void setxBoardCount(Integer xBoardCount) {
		this.xBoardCount = xBoardCount;
	}
	public Double getZbspavg() {
		return zbspavg;
	}
	public void setZbspavg(Double zbspavg) {
		this.zbspavg = zbspavg;
	}
	
}

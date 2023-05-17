package com.dodam.infra.modules.space;

import java.util.Date;

import com.dodam.infra.common.base.Base;

public class Space extends Base{
	
//	Space table dto
	private String zbspSeq;
	private String zbspName;
	private String zbspStartDate;
	private String zbspEndDate;
	private Integer zbspDelNy;
	private Integer zbspShareNy;
	private Integer zbspEndNy;
	private Date zbspRegDate;
	
//	SpaceKeyword table dto
	private String zbskSeq;
	private String zbskKeywordCode;
	private Integer zbskKeywordType;
	private Integer zbskDelNy;
	
// SpaceInvite table dto
	private String zbsiSeq;
	private Integer zbsiInviteNy;
	private String zbmmSeq;
	private Integer zbsiAdminNy;
	private Integer zbsiLike;
	private Integer zbsiDelNy;
	
// TravelFlag table dto
	private String zbtfSeq;
	private Integer zbtfTypeCode;
	private String zbtfDate;
	private String zbtfFlagName;
	private String zbtfName;
	private Integer zbtfSort;
	private String zbtfAddr;
	private String zbtfLocationX;
	private String zbtfLocationY;
	private Integer zbtfDelNy;
	
// SpaceDutch table dto
	private String zbdpSeq;
	private Integer zbdpDutchType;
	private String zbdpTitle; 
	private Date zbdpDate;
	private Integer zbdpDelNy;
	private Integer zbdpNcost;
	private Integer zbdpTotal;
	private String zbdpNum;
	private Integer zbsiCnt;
	
// column 미존재 dto
	private String xAdminUser;
	private Integer xSpaceUser;
	private Integer xDdayBefore;
	private Integer xDdayEnd;
	private Integer xLikeScore;
	
	private String zbskKeyword;
	private String shMember;
	
	
//	--------------------------------------get,set
	public String getZbspSeq() {
		return zbspSeq;
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
	public String getZbspStartDate() {
		return zbspStartDate;
	}
	public void setZbspStartDate(String zbspStartDate) {
		this.zbspStartDate = zbspStartDate;
	}
	public String getZbspEndDate() {
		return zbspEndDate;
	}
	public void setZbspEndDate(String zbspEndDate) {
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
	public Integer getZbskKeywordType() {
		return zbskKeywordType;
	}
	public void setZbskKeywordType(Integer zbskKeywordType) {
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
	public String getZbmmSeq() {
		return zbmmSeq;
	}
	public void setZbmmSeq(String zbmmSeq) {
		this.zbmmSeq = zbmmSeq;
	}
	public Integer getZbsiAdminNy() {
		return zbsiAdminNy;
	}
	public void setZbsiAdminNy(Integer zbsiAdminNy) {
		this.zbsiAdminNy = zbsiAdminNy;
	}
	public Integer getZbsiLike() {
		return zbsiLike;
	}
	public void setZbsiLike(Integer zbsiLike) {
		this.zbsiLike = zbsiLike;
	}
	public Integer getZbsiDelNy() {
		return zbsiDelNy;
	}
	public void setZbsiDelNy(Integer zbsiDelNy) {
		this.zbsiDelNy = zbsiDelNy;
	}
	public String getZbtfSeq() {
		return zbtfSeq;
	}
	public void setZbtfSeq(String zbtfSeq) {
		this.zbtfSeq = zbtfSeq;
	}
	public Integer getZbtfTypeCode() {
		return zbtfTypeCode;
	}
	public void setZbtfTypeCode(Integer zbtfTypeCode) {
		this.zbtfTypeCode = zbtfTypeCode;
	}
	public String getZbtfDate() {
		return zbtfDate;
	}
	public void setZbtfDate(String zbtfDate) {
		this.zbtfDate = zbtfDate;
	}
	public String getZbtfFlagName() {
		return zbtfFlagName;
	}
	public void setZbtfFlagName(String zbtfFlagName) {
		this.zbtfFlagName = zbtfFlagName;
	}
	public String getZbtfName() {
		return zbtfName;
	}
	public void setZbtfName(String zbtfName) {
		this.zbtfName = zbtfName;
	}
	public Integer getZbtfSort() {
		return zbtfSort;
	}
	public void setZbtfSort(Integer zbtfSort) {
		this.zbtfSort = zbtfSort;
	}
	public String getZbtfAddr() {
		return zbtfAddr;
	}
	public void setZbtfAddr(String zbtfAddr) {
		this.zbtfAddr = zbtfAddr;
	}
	public String getZbtfLocationX() {
		return zbtfLocationX;
	}
	public void setZbtfLocationX(String zbtfLocationX) {
		this.zbtfLocationX = zbtfLocationX;
	}
	public String getZbtfLocationY() {
		return zbtfLocationY;
	}
	public void setZbtfLocationY(String zbtfLocationY) {
		this.zbtfLocationY = zbtfLocationY;
	}
	public Integer getZbtfDelNy() {
		return zbtfDelNy;
	}
	public void setZbtfDelNy(Integer zbtfDelNy) {
		this.zbtfDelNy = zbtfDelNy;
	}
	public String getZbdpSeq() {
		return zbdpSeq;
	}
	public void setZbdpSeq(String zbdpSeq) {
		this.zbdpSeq = zbdpSeq;
	}
	public Integer getZbdpDutchType() {
		return zbdpDutchType;
	}
	public void setZbdpDutchType(Integer zbdpDutchType) {
		this.zbdpDutchType = zbdpDutchType;
	}
	public String getZbdpTitle() {
		return zbdpTitle;
	}
	public void setZbdpTitle(String zbdpTitle) {
		this.zbdpTitle = zbdpTitle;
	}
	public Date getZbdpDate() {
		return zbdpDate;
	}
	public void setZbdpDate(Date zbdpDate) {
		this.zbdpDate = zbdpDate;
	}
	public Integer getZbdpDelNy() {
		return zbdpDelNy;
	}
	public void setZbdpDelNy(Integer zbdpDelNy) {
		this.zbdpDelNy = zbdpDelNy;
	}
	public Integer getZbdpNcost() {
		return zbdpNcost;
	}
	public void setZbdpNcost(Integer zbdpNcost) {
		this.zbdpNcost = zbdpNcost;
	}
	public Integer getZbdpTotal() {
		return zbdpTotal;
	}
	public void setZbdpTotal(Integer zbdpTotal) {
		this.zbdpTotal = zbdpTotal;
	}
	public String getZbdpNum() {
		return zbdpNum;
	}
	public void setZbdpNum(String zbdpNum) {
		this.zbdpNum = zbdpNum;
	}
	public Integer getZbsiCnt() {
		return zbsiCnt;
	}
	public void setZbsiCnt(Integer zbsiCnt) {
		this.zbsiCnt = zbsiCnt;
	}
	public String getxAdminUser() {
		return xAdminUser;
	}
	public void setxAdminUser(String xAdminUser) {
		this.xAdminUser = xAdminUser;
	}
	public Integer getxSpaceUser() {
		return xSpaceUser;
	}
	public void setxSpaceUser(Integer xSpaceUser) {
		this.xSpaceUser = xSpaceUser;
	}
	public Integer getxDdayBefore() {
		return xDdayBefore;
	}
	public void setxDdayBefore(Integer xDdayBefore) {
		this.xDdayBefore = xDdayBefore;
	}
	public Integer getxDdayEnd() {
		return xDdayEnd;
	}
	public void setxDdayEnd(Integer xDdayEnd) {
		this.xDdayEnd = xDdayEnd;
	}
	public Integer getxLikeScore() {
		return xLikeScore;
	}
	public void setxLikeScore(Integer xLikeScore) {
		this.xLikeScore = xLikeScore;
	}
	public String getZbskKeyword() {
		return zbskKeyword;
	}
	public void setZbskKeyword(String zbskKeyword) {
		this.zbskKeyword = zbskKeyword;
	}
	public String getShMember() {
		return shMember;
	}
	public void setShMember(String shMember) {
		this.shMember = shMember;
	}
}

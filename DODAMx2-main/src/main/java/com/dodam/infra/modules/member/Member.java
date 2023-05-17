package com.dodam.infra.modules.member;
import java.util.Date;

import com.dodam.infra.common.base.Base;


public class Member extends Base{
	private String zbmmSeq;
	private String zbmmID;
	private String zbmmPW;
	private String zbmmName;
	private String zbmmEmail;
	private String zbmmMobile;
	private Integer zbmmRegionCode;
	private Date zbmmRegDate;
	private Integer zbmmDelNy;
	private Date zbmmDelDate;
	private Integer zbmmSocialType;
	
	private String snsId;
	private String sessSeq;
	private String sessId;
	
	
	public String getZbmmSeq() {
		return zbmmSeq;
	}
	public void setZbmmSeq(String zbmmSeq) {
		this.zbmmSeq = zbmmSeq;
	}
	public String getZbmmID() {
		return zbmmID;
	}
	public void setZbmmID(String zbmmID) {
		this.zbmmID = zbmmID;
	}
	public String getZbmmPW() {
		return zbmmPW;
	}
	public void setZbmmPW(String zbmmPW) {
		this.zbmmPW = zbmmPW;
	}
	public String getZbmmName() {
		return zbmmName;
	}
	public void setZbmmName(String zbmmName) {
		this.zbmmName = zbmmName;
	}
	public String getZbmmEmail() {
		return zbmmEmail;
	}
	public void setZbmmEmail(String zbmmEmail) {
		this.zbmmEmail = zbmmEmail;
	}
	public String getZbmmMobile() {
		return zbmmMobile;
	}
	public void setZbmmMobile(String zbmmMobile) {
		this.zbmmMobile = zbmmMobile;
	}
	public Integer getZbmmRegionCode() {
		return zbmmRegionCode;
	}
	public void setZbmmRegionCode(Integer zbmmRegionCode) {
		this.zbmmRegionCode = zbmmRegionCode;
	}
	public Date getZbmmRegDate() {
		return zbmmRegDate;
	}
	public void setZbmmRegDate(Date zbmmRegDate) {
		this.zbmmRegDate = zbmmRegDate;
	}
	public Integer getZbmmDelNy() {
		return zbmmDelNy;
	}
	public void setZbmmDelNy(Integer zbmmDelNy) {
		this.zbmmDelNy = zbmmDelNy;
	}
	public Date getZbmmDelDate() {
		return zbmmDelDate;
	}
	public void setZbmmDelDate(Date zbmmDelDate) {
		this.zbmmDelDate = zbmmDelDate;
	}
	public Integer getZbmmSocialType() {
		return zbmmSocialType;
	}
	public void setZbmmSocialType(Integer zbmmSocialType) {
		this.zbmmSocialType = zbmmSocialType;
	}
	public String getSnsId() {
		return snsId;
	}
	public void setSnsId(String snsId) {
		this.snsId = snsId;
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
	
	

}

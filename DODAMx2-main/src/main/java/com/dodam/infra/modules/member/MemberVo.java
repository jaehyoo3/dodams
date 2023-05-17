package com.dodam.infra.modules.member;

import com.dodam.infra.common.base.BaseVo;

public class MemberVo extends BaseVo{
		
		private String zbmmSeq;
		private String zbmmEmail;
		private String zbmmID;
		private Integer zbmmSocialType;

		public String getZbmmSeq() {
			return zbmmSeq;
		}

		public void setZbmmSeq(String zbmmSeq) {
			this.zbmmSeq = zbmmSeq;
		}

		public String getZbmmEmail() {
			return zbmmEmail;
		}

		public void setZbmmEmail(String zbmmEmail) {
			this.zbmmEmail = zbmmEmail;
		}

		public String getZbmmID() {
			return zbmmID;
		}

		public void setZbmmID(String zbmmID) {
			this.zbmmID = zbmmID;
		}

		public Integer getZbmmSocialType() {
			return zbmmSocialType;
		}

		public void setZbmmSocialType(Integer zbmmSocialType) {
			this.zbmmSocialType = zbmmSocialType;
		}


		
	
}

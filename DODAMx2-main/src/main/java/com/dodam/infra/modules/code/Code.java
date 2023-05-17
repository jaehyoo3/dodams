package com.dodam.infra.modules.code;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Code {
	private String codeSeq;
	private String codeName;
	private Integer codeUseNy;
	private Integer codeDelNy;
	private Date codeRegDate;
	private Date codeModDate;
	private String codeGroupSeq;
	private String codeGroupName;
	
	public static List<Code> cachedCodeArrayList = new ArrayList<Code>();
// --------------------------------------
	
	public String getCodeSeq() {
		return codeSeq;
	}
	public String getCodeGroupName() {
		return codeGroupName;
	}
	public void setCodeGroupName(String codeGroupName) {
		this.codeGroupName = codeGroupName;
	}
	public void setCodeSeq(String codeSeq) {
		this.codeSeq = codeSeq;
	}
	public String getCodeName() {
		return codeName;
	}
	public void setCodeName(String codeName) {
		this.codeName = codeName;
	}
	public Integer getCodeUseNy() {
		return codeUseNy;
	}
	public void setCodeUseNy(Integer codeUseNy) {
		this.codeUseNy = codeUseNy;
	}
	public Integer getCodeDelNy() {
		return codeDelNy;
	}
	public void setCodeDelNy(Integer codeDelNy) {
		this.codeDelNy = codeDelNy;
	}
	public Date getCodeRegDate() {
		return codeRegDate;
	}
	public void setCodeRegDate(Date codeRegDate) {
		this.codeRegDate = codeRegDate;
	}
	public Date getCodeModDate() {
		return codeModDate;
	}
	public void setCodeModDate(Date codeModDate) {
		this.codeModDate = codeModDate;
	}
	public String getCodeGroupSeq() {
		return codeGroupSeq;
	}
	public void setCodeGroupSeq(String codeGroupSeq) {
		this.codeGroupSeq = codeGroupSeq;
	}
	public static List<Code> getCachedCodeArrayList() {
		return cachedCodeArrayList;
	}
	public static void setCachedCodeArrayList(List<Code> cachedCodeArrayList) {
		Code.cachedCodeArrayList = cachedCodeArrayList;
	}
	

	
		
}

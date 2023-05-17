package com.dodam.infra.common.base;


import org.springframework.web.multipart.MultipartFile;

public class Base {
	//이미지업로드 
		private MultipartFile[] uploadedImage;
		
		//	uploaded
		private String tableName;
		private String seq;
		private Integer type;
		private Integer defaultNy;
		private Integer sort;
		private String path;
		private String originalName;
		private String uuidName;
		private String ext;
		private long size;
		private Integer delNy;
		private String pseq;
		
		// zbmm
		private String zbmmID;
		private String zbmmName;
		
		
	
	
	
//--------------------------- get,set --------------------------

	public MultipartFile[] getUploadedImage() {
			return uploadedImage;
		}

		public void setUploadedImage(MultipartFile[] uploadedImage) {
			this.uploadedImage = uploadedImage;
		}

		public String getTableName() {
			return tableName;
		}

		public void setTableName(String tableName) {
			this.tableName = tableName;
		}

		public String getSeq() {
			return seq;
		}

		public void setSeq(String seq) {
			this.seq = seq;
		}

		public Integer getType() {
			return type;
		}

		public void setType(Integer type) {
			this.type = type;
		}

		public Integer getDefaultNy() {
			return defaultNy;
		}

		public void setDefaultNy(Integer defaultNy) {
			this.defaultNy = defaultNy;
		}

		public Integer getSort() {
			return sort;
		}

		public void setSort(Integer sort) {
			this.sort = sort;
		}

		public String getPath() {
			return path;
		}

		public void setPath(String path) {
			this.path = path;
		}

		public String getOriginalName() {
			return originalName;
		}

		public void setOriginalName(String originalName) {
			this.originalName = originalName;
		}

		public String getUuidName() {
			return uuidName;
		}

		public void setUuidName(String uuidName) {
			this.uuidName = uuidName;
		}

		public String getExt() {
			return ext;
		}

		public void setExt(String ext) {
			this.ext = ext;
		}

		public long getSize() {
			return size;
		}

		public void setSize(long size) {
			this.size = size;
		}

		public Integer getDelNy() {
			return delNy;
		}

		public void setDelNy(Integer delNy) {
			this.delNy = delNy;
		}

		public String getPseq() {
			return pseq;
		}

		public void setPseq(String pseq) {
			this.pseq = pseq;
		}

		public String getZbmmID() {
			return zbmmID;
		}
	
		public void setZbmmID(String zbmmID) {
			this.zbmmID = zbmmID;
		}
	
		public String getZbmmName() {
			return zbmmName;
		}
	
		public void setZbmmName(String zbmmName) {
			this.zbmmName = zbmmName;
		}
	
}

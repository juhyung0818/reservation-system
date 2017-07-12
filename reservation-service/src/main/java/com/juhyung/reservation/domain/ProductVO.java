package com.juhyung.reservation.domain;

import java.util.Date;

public class ProductVO {
	private Integer id;
	private Integer categoryId;
	private String name;
	private String description;
	private Date salesStart;
	private Date salesEnd;
	private Integer salesFlag;
	private String event;
	private Date createDate;
	private Date modifyDate;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Date getSalesStart() {
		return salesStart;
	}
	public void setSalesStart(Date salesStart) {
		this.salesStart = salesStart;
	}
	public Date getSalesEnd() {
		return salesEnd;
	}
	public void setSalesEnd(Date salesEnd) {
		this.salesEnd = salesEnd;
	}
	public Integer getSalesFlag() {
		return salesFlag;
	}
	public void setSalesFlag(Integer salesFlag) {
		this.salesFlag = salesFlag;
	}
	public String getEvent() {
		return event;
	}
	public void setEvent(String event) {
		this.event = event;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public Date getModifyDate() {
		return modifyDate;
	}
	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}
	
	@Override
	public String toString() {
		return "ProductVO [id=" + id + ", categoryId=" + categoryId + ", name=" + name + ", description=" + description
				+ ", salesStart=" + salesStart + ", salesEnd=" + salesEnd + ", salesFlag=" + salesFlag + ", event="
				+ event + ", createDate=" + createDate + ", modifyDate=" + modifyDate + "]";
	}
}

/*
`id` INT NOT NULL AUTO_INCREMENT,
`category_id` INT NOT NULL,
`name` VARCHAR(50) NOT NULL,
`description` VARCHAR(100) NULL,
`sales_start` DATETIME NOT NULL,
`sales_end` DATETIME NULL,
`sales_flag` INT(1) NOT NULL,
`event` VARCHAR(4000),
`create_date` DATETIME,
`modify_date` DATETIME,
*/
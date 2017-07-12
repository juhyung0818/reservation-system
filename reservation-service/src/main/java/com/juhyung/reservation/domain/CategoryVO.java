package com.juhyung.reservation.domain;

public class CategoryVO {
	private Integer id;
	private String name;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	@Override
	public String toString() {
		return "CategoryVO [id=" + id + ", name=" + name + "]";
	}
}
//insert into product (category_id, name, description, sales_start, sales_end, sales_flag, event, create_date, modify_date)
//values (1, 'boost', 'boost description', '2017-06-30 00:00:00', '2017-07-30 00:00:00', 1, 'boost event', '2017-06-20 00:00:00', '2017-08-20 00:00:00');
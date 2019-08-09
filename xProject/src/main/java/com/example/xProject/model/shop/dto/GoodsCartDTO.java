package com.example.xProject.model.shop.dto;

public class GoodsCartDTO {

	private int cart_id;
	private String userid; //아이디
	private String name; //고객이름
	private String good_id; //상품고유번호
	private String gname; //상품이름
	private int price;
	private int money;
	private int amount; 
	private String delivered; //배송완료여부
	private String address;
	private String hp;
	
	public int getCart_id() {
		return cart_id;
	}
	public void setCart_id(int cart_id) {
		this.cart_id = cart_id;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGood_id() {
		return good_id;
	}
	public void setGood_id(String good_id) {
		this.good_id = good_id;
	}
	public String getGname() {
		return gname;
	}
	public void setGname(String gname) {
		this.gname = gname;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getMoney() {
		return money;
	}
	public void setMoney(int money) {
		this.money = money;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getDelivered() {
		return delivered;
	}
	public void setDelivered(String delivered) {
		this.delivered = delivered;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getHp() {
		return hp;
	}
	public void setHp(String hp) {
		this.hp = hp;
	}
	
	@Override
	public String toString() {
		return "GoodsCartDTO [cart_id=" + cart_id + ", userid=" + userid + ", name=" + name + ", good_id=" + good_id
				+ ", gname=" + gname + ", price=" + price + ", money=" + money + ", amount=" + amount + ", delivered="
				+ delivered + ", address=" + address + ", hp=" + hp + "]";
	}	
}
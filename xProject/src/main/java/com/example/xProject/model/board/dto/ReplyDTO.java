package com.example.xProject.model.board.dto;

public class ReplyDTO {

	public int rid;
	public int bid;
	public String text;
	public String reg_id;
	public String edit_dt;
	public int getRid() {
		return rid;
	}
	public void setRid(int rid) {
		this.rid = rid;
	}
	public int getBid() {
		return bid;
	}
	public void setBid(int bid) {
		this.bid = bid;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getReg_id() {
		return reg_id;
	}
	public void setReg_id(String reg_id) {
		this.reg_id = reg_id;
	}
	public String getEdit_dt() {
		return edit_dt;
	}
	public void setEdit_dt(String edit_dt) {
		this.edit_dt = edit_dt;
	}
	@Override
	public String toString() {
		return "ReplyDTO [rid=" + rid + ", bid=" + bid + ", text=" + text + ", reg_id=" + reg_id + ", edit_dt="
				+ edit_dt + "]";
	}

	
}

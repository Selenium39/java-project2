package com.wantao.bean;
//投票选项信息类
public class VoteOption {
	private int voteOptionId;
	private int voteId;
	private String voteOptionName;
	private int ticketNum;
	public int getVoteOptionId() {
		return voteOptionId;
	}
	public void setVoteOptionId(int voteOptionId) {
		this.voteOptionId = voteOptionId;
	}
	public int getVoteId() {
		return voteId;
	}
	public void setVoteId(int voteId) {
		this.voteId = voteId;
	}
	public String getVoteOptionName() {
		return voteOptionName;
	}
	public void setVoteOptionName(String voteOptionName) {
		this.voteOptionName = voteOptionName;
	}
	public int getTicketNum() {
		return ticketNum;
	}
	public void setTicketNum(int ticketNum) {
		this.ticketNum = ticketNum;
	}
	@Override
	public String toString() {
		return "VoteOption [voteOptionId=" + voteOptionId + ", voteId=" + voteId + ", voteOptionName=" + voteOptionName
				+ ", ticketNum=" + ticketNum + "]";
	}
	

}

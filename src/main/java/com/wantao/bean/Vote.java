package com.wantao.bean;
//投票信息类
public class Vote {
	private int voteId;
	private String voteName;
	private int channelId;
	public int getVoteId() {
		return voteId;
	}
	public void setVoteId(int voteId) {
		this.voteId = voteId;
	}
	public String getVoteName() {
		return voteName;
	}
	public void setVoteName(String voteName) {
		this.voteName = voteName;
	}
	public int getChannelId() {
		return channelId;
	}
	public void setChannelId(int channelId) {
		this.channelId = channelId;
	}
	@Override
	public String toString() {
		return "Vote [voteId=" + voteId + ", voteName=" + voteName + ", channelId=" + channelId + "]";
	}

}

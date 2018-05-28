package com.wantao.bean;

import java.util.List;

//投票封装类
//VoteResult= one Vote+ all VoteOption
public class VoteResult {
	private Vote vote;
	public List<VoteOption> voteOptions;
	public Vote getVote() {
		return vote;
	}
	public void setVote(Vote vote) {
		this.vote = vote;
	}
	public List<VoteOption> getVoteOptions() {
		return voteOptions;
	}
	public void setVoteOptions(List<VoteOption> voteOptions) {
		this.voteOptions = voteOptions;
	}

}

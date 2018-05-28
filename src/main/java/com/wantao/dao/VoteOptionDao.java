package com.wantao.dao;

import java.util.List;

import com.wantao.bean.VoteOption;

public interface VoteOptionDao {
	void addVoteOption(VoteOption voteOption);
	List<VoteOption> findVoteOptionByVoteId(int voteId);
	void deleteVoteOption(int voteId);
	void addTicket(int voteOptionId);
}

package com.wantao.dao;

import java.util.List;

import com.wantao.bean.Page;
import com.wantao.bean.Vote;

public interface VoteDao {
	void addVote(Vote vote);
	void deleteVote(int voteId);
	void updateVote();
	Vote findVoteByName(String voteName);
	Vote findVoteByVoteId(int voteId);
	List<Vote>findAllVote();
	int findAllVoteCount();
	List<Vote>findAllVote(Page page);
	List<Vote>findAllVoteByChannelId(int channelId,Page page);
}

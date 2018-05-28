package com.wantao.test;

import java.util.List;

import org.junit.Test;

import com.wantao.bean.Page;
import com.wantao.bean.Vote;
import com.wantao.daoImpl.VoteDaoImpl;
import com.wantao.daoImpl.VoteOptionDaoImpl;
import com.wantao.util.PageUtil;

public class VoteDaoTest {
	VoteDaoImpl voteDaoImpl = new VoteDaoImpl();
    VoteOptionDaoImpl voteOptionDaoImpl=new VoteOptionDaoImpl();
	@Test
	public void test() {// test findAllVoteTest
		List<Vote> votes = null;
		votes = voteDaoImpl.findAllVote();
		for (Vote vote : votes) {
			System.out.println(vote);
		}

	}

	@Test
	public void test1() {// test findAllVoteCount
		System.out.println(voteDaoImpl.findAllVoteCount());
	}
	@Test
	public void test2() {
		int currentPage=2;
		int everyPageCount=10;
		int totalCount=voteDaoImpl.findAllVoteCount();
		Page page=PageUtil.createPage(currentPage, everyPageCount, totalCount);
		page.setBeginIndex(currentPage);
		List<Vote> votes=voteDaoImpl.findAllVote(page);
		for (Vote vote : votes) {
			System.out.println(vote);
		}
	}
	@Test
	public void test3() {
		voteOptionDaoImpl.addTicket(11);
	}
}

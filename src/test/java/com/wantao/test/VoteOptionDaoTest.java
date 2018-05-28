package com.wantao.test;

import java.util.List;

import org.junit.Test;

import com.wantao.bean.VoteOption;
import com.wantao.daoImpl.VoteOptionDaoImpl;

public class VoteOptionDaoTest {
	@Test
	public void test() {
		VoteOptionDaoImpl voteOptionDao=new VoteOptionDaoImpl();
		List<VoteOption> voteOptions=null;
		voteOptions=voteOptionDao.findVoteOptionByVoteId(6);
		for(VoteOption voteOption:voteOptions) {
			System.out.println(voteOption);
		}
	}

}

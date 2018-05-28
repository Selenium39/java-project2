package com.wantao.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.junit.runners.Parameterized.Parameter;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.JstlView;

import com.wantao.bean.Page;
import com.wantao.bean.Vote;
import com.wantao.bean.VoteOption;
import com.wantao.bean.VoteResult;
import com.wantao.daoImpl.VoteDaoImpl;
import com.wantao.daoImpl.VoteOptionDaoImpl;
import com.wantao.util.ChartUtil;
import com.wantao.util.PageUtil;

@Controller
public class VoteHandler {
	@RequestMapping(value = "/addVote", method = RequestMethod.POST)
	public String addVote(int channel, String voteName, String[] voteOptions) {// 只要name属性相同，前后端自动绑定
		VoteDaoImpl voteDaoImpl = new VoteDaoImpl();
		VoteOptionDaoImpl voteOptionDaoImpl = new VoteOptionDaoImpl();
		Vote vote = new Vote();// 创建投票对象
		vote.setChannelId(channel);// 设置频道id
		vote.setVoteName(voteName);// 设置投票名称
		voteDaoImpl.addVote(vote);// 执行增加投票的方法
		int voteId = voteDaoImpl.findVoteByName(voteName).getVoteId();// 获取投票id
		for (String voteoption : voteOptions) {
			VoteOption voteOption = new VoteOption();// 创建投票选择对象
			voteOption.setVoteId(voteId);
			voteOption.setVoteOptionName(voteoption);
			voteOptionDaoImpl.addVoteOption(voteOption);
		}
		return "redirect:/index.jsp";
	}

	@RequestMapping(value = "/editorVote", method = RequestMethod.GET)
	public String editorVote(HttpSession session, @RequestParam(name = "currentPage") int currentPage) {
		VoteDaoImpl voteDaoImpl = new VoteDaoImpl();
		VoteOptionDaoImpl voteOptionDaoImpl = new VoteOptionDaoImpl();
		List voteIds=new ArrayList<>();
		Page page=null;
		int everyPageCount = 10;// 每页记录数
		int totalCount = voteDaoImpl.findAllVoteCount();// 总记录数
		if (currentPage ==1) {//第一页创建page对象
		    page = PageUtil.createPage(currentPage, everyPageCount, totalCount);
			page.setBeginIndex(currentPage);
		}else {//非第一页直接获取page对象
		page =(Page) session.getAttribute("page");
		}
		page.setCurrentPage(currentPage);
		page.setHasNextPage(PageUtil.getHasNextPage(currentPage, page.getTotalPage()));
		page.setHasPrePage(PageUtil.getHasPrePage(currentPage));
		List<Vote> votes = voteDaoImpl.findAllVote(page);
		List<VoteResult> voteResults = new ArrayList<VoteResult>();
		for (Vote vote : votes) {
			VoteResult voteResult = new VoteResult();
			List<VoteOption> voteOptions = voteOptionDaoImpl.findVoteOptionByVoteId(vote.getVoteId());
			voteResult.setVote(vote);
			voteResult.setVoteOptions(voteOptions);
			voteResults.add(voteResult);
			voteIds.add(vote.getVoteId());
		}
		session.setAttribute("voteResults", voteResults);
		session.setAttribute("page", page);
		session.setAttribute("voteIds", voteIds);
		return "editorVote";
	}

	@RequestMapping(value = "/delete")
	public String deleteVote(@RequestParam(value = "currentPage") int currentPage, @RequestParam(value = "id") int id) {
		VoteDaoImpl voteDaoImpl = new VoteDaoImpl();
		VoteOptionDaoImpl voteOptionDaoImpl = new VoteOptionDaoImpl();
		voteOptionDaoImpl.deleteVoteOption(id);
		voteDaoImpl.deleteVote(id);
		return "redirect:editorVote?currentPage="+currentPage;
}
	@RequestMapping(value="/showVote")
	public String showVote(@RequestParam("channelId")int channelId,@RequestParam("currentPage")int currentPage,HttpSession session) {
		VoteDaoImpl voteDaoImpl = new VoteDaoImpl();
		List voteIds=new ArrayList<>();
		int everyPageCount=10;
		int totalCount=voteDaoImpl.findAllVoteCount();
		Page page=null;
		if (currentPage == 1) {
			page = PageUtil.createPage(currentPage, everyPageCount, totalCount);
			page.setBeginIndex(currentPage);	
		}else {
			page = (Page) session.getAttribute("page");
		}
		page.setCurrentPage(currentPage);
		page.setHasNextPage(PageUtil.getHasNextPage(currentPage, page.getTotalPage()));
		page.setHasPrePage(PageUtil.getHasPrePage(currentPage));
		List<Vote> votes=voteDaoImpl.findAllVoteByChannelId(channelId,page);
		for(Vote vote:votes) {
			voteIds.add(vote.getVoteId());
		}
		session.setAttribute("page", page);
		session.setAttribute("votes",votes);
		session.setAttribute("voteIds",voteIds);
		return "showVote";
	}
	@RequestMapping("/vote")
	public String vote(@RequestParam("id")int id,HttpSession session) {
		VoteOptionDaoImpl voteOptionDaoImpl=new VoteOptionDaoImpl();
		VoteDaoImpl voteDaoImpl=new VoteDaoImpl();
		List<VoteOption> voteOptions=voteOptionDaoImpl.findVoteOptionByVoteId(id);
		Vote vote=voteDaoImpl.findVoteByVoteId(id);
		session.setAttribute("voteOptions", voteOptions);
		session.setAttribute("vote", vote);
		return "vote";
		
	}
	@RequestMapping(value="/addTicket",method=RequestMethod.POST)
	public String addTicket(@RequestParam("id")int id,int voted,HttpSession session) {
		VoteOptionDaoImpl voteOptionDaoImpl=new VoteOptionDaoImpl();
		voteOptionDaoImpl.addTicket(voted);
		VoteDaoImpl voteDaoImpl=new VoteDaoImpl();
		Vote vote=voteDaoImpl.findVoteByVoteId(id);
		session.setAttribute("vote",vote);
		return "addTicket";
	}
	@RequestMapping("/voteResult")
	public String voteResult(@RequestParam("id") int id) {
		VoteOptionDaoImpl voteOptionDaoImpl=new VoteOptionDaoImpl();
		List<VoteOption> voteOptions=voteOptionDaoImpl.findVoteOptionByVoteId(id);
        ChartUtil.createDataSet(voteOptions);		
		return "voteResult";
		
	}
	@RequestMapping("/beforeVoteResult")//如果直接访问到voteResult，会因为session中没有vote而报错，所以在访问前添加session
	public View beforeVoteResult(@RequestParam("id") int id,HttpSession session) {
		VoteDaoImpl voteDaoImpl = new VoteDaoImpl();
		Vote vote=voteDaoImpl.findVoteByVoteId(id);
		session.setAttribute("vote", vote);
		View view=new JstlView("voteResult?id="+id);//通过设置View对象使返回的url上带上参数
		return view;
		
	}
	
	
	@RequestMapping(value="/seeVote")
	public String seeVote(@RequestParam("currentPage")int currentPage,HttpSession session) {
		VoteDaoImpl voteDaoImpl = new VoteDaoImpl();
		List voteIds=new ArrayList<>();
		int everyPageCount=10;
		int totalCount=voteDaoImpl.findAllVoteCount();
		Page page=null;
		if (currentPage == 1) {
			page = PageUtil.createPage(currentPage, everyPageCount, totalCount);
			page.setBeginIndex(currentPage);	
		}else {
			page = (Page) session.getAttribute("page");
		}
		page.setCurrentPage(currentPage);
		page.setHasNextPage(PageUtil.getHasNextPage(currentPage, page.getTotalPage()));
		page.setHasPrePage(PageUtil.getHasPrePage(currentPage));
		List<Vote> votes=voteDaoImpl.findAllVote();
		for(Vote vote:votes) {
			voteIds.add(vote.getVoteId());
		}
		session.setAttribute("page", page);
		session.setAttribute("votes",votes);
		session.setAttribute("voteIds",voteIds);
		return "seeVote";
	}
}

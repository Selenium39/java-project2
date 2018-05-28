package com.wantao.daoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.wantao.bean.Page;
import com.wantao.bean.Vote;
import com.wantao.dao.VoteDao;
import com.wantao.util.JDBCUtil;
import com.wantao.util.PageUtil;

public class VoteDaoImpl implements VoteDao {

	public void addVote(Vote vote) {
		String sql = "insert into tb_vote(voteName,channelId) values(?,?)";
		Connection connection = null;
		PreparedStatement pstmt = null;
		try {
			connection = JDBCUtil.getConnection();
			pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, vote.getVoteName());
			pstmt.setInt(2, vote.getChannelId());
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCUtil.close(connection);
			JDBCUtil.close(pstmt);
		}

	}

	public void deleteVote(int voteId) {
		String sql = "delete from tb_vote where voteId=?";
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Vote vote = null;
		try {
			connection = JDBCUtil.getConnection();
			pstmt = connection.prepareStatement(sql);
			pstmt.setInt(1, voteId);
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCUtil.close(connection);
			JDBCUtil.close(pstmt);
		}

	}

	public void updateVote() {
		// TODO Auto-generated method stub

	}

	public Vote findVoteByName(String voteName) {
		String sql = "select * from tb_vote where voteName=?";
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Vote vote = null;
		try {
			connection = JDBCUtil.getConnection();
			pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, voteName);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				vote = new Vote();
				vote.setVoteId(rs.getInt(1));
				vote.setVoteName(rs.getString(2));
				vote.setChannelId(rs.getInt(3));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCUtil.close(connection);
			JDBCUtil.close(pstmt);
			JDBCUtil.close(rs);
		}
		return vote;

	}

	public List<Vote> findAllVote() {
		String sql = "select * from tb_vote";
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Vote> votes = new ArrayList<Vote>();
		try {
			connection = JDBCUtil.getConnection();
			pstmt = connection.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Vote vote = new Vote();
				vote.setVoteId(rs.getInt(1));
				vote.setVoteName(rs.getString(2));
				vote.setChannelId(rs.getInt(3));
				votes.add(vote);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCUtil.close(connection);
			JDBCUtil.close(pstmt);
			JDBCUtil.close(rs);
		}

		return votes;
	}

	public int findAllVoteCount() {
		String sql = "select * from tb_vote";
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		try {
			connection = JDBCUtil.getConnection();
			pstmt = connection.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				++count;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCUtil.close(connection);
			JDBCUtil.close(pstmt);
			JDBCUtil.close(rs);
		}
		return count;
	}

	public List<Vote> findAllVote(Page page) {
		String sql = "select * from tb_vote limit ?,?";// 第一个?是查询开始位置(从0开始),第二个?是查询的数目
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Vote> votes = new ArrayList<Vote>();
		int count = 0;
		try {
			connection = JDBCUtil.getConnection();
			pstmt = connection.prepareStatement(sql);
			pstmt.setInt(1, PageUtil.getBeginIndex(page.getCurrentPage(), page.getEveryPageCount()));
			pstmt.setInt(2, page.getEveryPageCount());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Vote vote = new Vote();
				vote.setVoteId(rs.getInt(1));
				vote.setVoteName(rs.getString(2));
				vote.setChannelId(rs.getInt(3));
				votes.add(vote);

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCUtil.close(connection);
			JDBCUtil.close(pstmt);
			JDBCUtil.close(rs);
		}
		return votes;
	}

	@Override
	public List<Vote> findAllVoteByChannelId(int channelId,Page page) {
		String sql = "select * from tb_vote where channelId=? limit ?,?";
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Vote> votes = new ArrayList<Vote>();
		try {
			connection = JDBCUtil.getConnection();
			pstmt = connection.prepareStatement(sql);
			pstmt.setInt(1, channelId);
			pstmt.setInt(2, PageUtil.getBeginIndex(page.getCurrentPage(), page.getEveryPageCount()));
			pstmt.setInt(3, page.getEveryPageCount());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Vote vote = new Vote();
				vote.setVoteId(rs.getInt(1));
				vote.setVoteName(rs.getString(2));
				vote.setChannelId(rs.getInt(3));
				votes.add(vote);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCUtil.close(connection);
			JDBCUtil.close(pstmt);
			JDBCUtil.close(rs);
		}
		return votes;
	}

	@Override
	public Vote findVoteByVoteId(int voteId) {
		String sql = "select * from tb_vote where voteId=?";
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Vote vote = null;
		try {
			connection = JDBCUtil.getConnection();
			pstmt = connection.prepareStatement(sql);
			pstmt.setInt(1, voteId);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				vote = new Vote();
				vote.setVoteId(rs.getInt(1));
				vote.setVoteName(rs.getString(2));
				vote.setChannelId(rs.getInt(3));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCUtil.close(connection);
			JDBCUtil.close(pstmt);
			JDBCUtil.close(rs);
		}
		return vote;
	}


}

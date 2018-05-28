package com.wantao.daoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.wantao.bean.VoteOption;
import com.wantao.dao.VoteOptionDao;
import com.wantao.util.JDBCUtil;

public class VoteOptionDaoImpl implements VoteOptionDao {

	public void addVoteOption(VoteOption voteOption) {
		String sql = "insert into tb_voteoption(voteOptionName,voteId,ticketNum) values(?,?,?)";
		Connection connection = null;
		PreparedStatement pstmt = null;
		try {
			connection = JDBCUtil.getConnection();
			pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, voteOption.getVoteOptionName());
			pstmt.setInt(2, voteOption.getVoteId());
			pstmt.setInt(3, voteOption.getTicketNum());
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCUtil.close(connection);
			JDBCUtil.close(pstmt);
		}

	}

	public List<VoteOption> findVoteOptionByVoteId(int voteId) {
		String sql = "select * from tb_voteoption where voteId = ?";
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<VoteOption> voteOptions = new ArrayList<VoteOption>();
		try {
			connection = JDBCUtil.getConnection();
			pstmt = connection.prepareStatement(sql);
			pstmt.setInt(1, voteId);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				VoteOption voteOption = new VoteOption();
				voteOption.setVoteOptionId(rs.getInt(1));
				voteOption.setVoteId(rs.getInt(2));
				voteOption.setVoteOptionName(rs.getString(3));
				voteOption.setTicketNum(rs.getInt(4));
				voteOptions.add(voteOption);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCUtil.close(connection);
			JDBCUtil.close(pstmt);
		}
		return voteOptions;
	}

	public void deleteVoteOption(int voteId) {
		String sql = "delete from tb_voteoption where voteId=?";
		Connection connection = null;
		PreparedStatement pstmt = null;
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

	@Override
	public void addTicket(int voteOptionId) {
		String sql = "update tb_voteoption set ticketNum=ticketNum+1 where voteOptionId=?";
		Connection connection = null;
		PreparedStatement pstmt = null;
		try {
			connection = JDBCUtil.getConnection();
			pstmt = connection.prepareStatement(sql);
			pstmt.setInt(1, voteOptionId);
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCUtil.close(connection);
			JDBCUtil.close(pstmt);
		}		
	}

}

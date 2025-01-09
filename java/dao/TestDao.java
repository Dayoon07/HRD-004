package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import common.DBUtils;
import vo.MemberVo;

public class TestDao {

	public ArrayList<MemberVo> findAll() {
		ArrayList<MemberVo> list = new ArrayList<MemberVo>();
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			con = DBUtils.getConnection();
			ps = con.prepareStatement(
					"select\r\n"
					+ "	userid,\r\n"
					+ "	username,\r\n"
					+ "	password,\r\n"
					+ "	jumin,\r\n"
					+ "	decode(gender, '1', '남자', '2', '여자') as gender,\r\n"
					+ "	address,\r\n"
					+ "	decode(jobcd, '1', '학생', '2', '회사원', '3', '공무원', '4', '군인', '5', '기타') as jobcd,\r\n"
					+ "	decode(mailrcv, 'Y', '허용', 'N', '거부') as mailrcv,\r\n"
					+ "	intro\r\n"
					+ "from t2_member"
			);
			rs = ps.executeQuery();
			while (rs.next()) {
				MemberVo vo = new MemberVo();
				vo.setUserid(rs.getString("userid"));
				vo.setUsername(rs.getString("username"));
				vo.setPassword(rs.getString("password"));
				vo.setJumin(rs.getString("jumin"));
				vo.setGender(rs.getString("gender"));
				vo.setAddress(rs.getString("address"));
				vo.setJobcd(rs.getString("jobcd"));
				vo.setMailrcv(rs.getString("mailrcv"));
				vo.setIntro(rs.getString("intro"));
				list.add(vo);
			}
			rs.close();
			ps.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public MemberVo particluerPage(String userid) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		MemberVo vo = null;
		try {
			con = DBUtils.getConnection();
			ps = con.prepareStatement("SELECT * FROM t2_member WHERE userid = ?");
			ps.setString(1, userid);
			
			rs = ps.executeQuery();
			if (rs.next()) {
				vo = new MemberVo();
				vo.setUserid(rs.getString("userid"));
				vo.setUsername(rs.getString("username"));
				vo.setPassword(rs.getString("password"));
				vo.setJumin(rs.getString("jumin"));
				vo.setGender(rs.getString("gender"));
				vo.setAddress(rs.getString("address"));
				vo.setJobcd(rs.getString("jobcd"));
				vo.setMailrcv(rs.getString("mailrcv"));
				vo.setIntro(rs.getString("intro"));
			}
			rs.close();
			ps.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return vo;
	}
	
	public int deleteById(String userid) {
		Connection con = null;
		PreparedStatement ps = null;
		int n = 0;
		
		try {
			con = DBUtils.getConnection();
			ps = con.prepareStatement("DELETE FROM t2_member WHERE userid = ?");
			ps.setString(1, userid);
			n = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return n;
	}
	
	public int save(MemberVo vo) {
		Connection con = null;
		PreparedStatement ps = null;
		int n = 0;
		
		try {
			con = DBUtils.getConnection();
			ps = con.prepareStatement(
					"INSERT INTO T2_MEMBER (userid, username, password, jumin, gender, address, jobcd, mailrcv, intro)\r\n"
					+ "VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)"
			);
			ps.setString(1, vo.getUserid());
			ps.setString(2, vo.getUsername());
			ps.setString(3, vo.getPassword());
			ps.setString(4, vo.getJumin());
			ps.setString(5, vo.getGender());
			ps.setString(6, vo.getAddress());
			ps.setString(7, vo.getJobcd());
			ps.setString(8, vo.getMailrcv());
			ps.setString(9, vo.getIntro());
			
			n = ps.executeUpdate();
			
			if (n > 0) {
				con.commit();
			}
			
			ps.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return n;
	}
	
	public int updateSave(MemberVo vo) {
		Connection con = null;
		PreparedStatement ps = null;
		int n = 0;
		
		try {
			con = DBUtils.getConnection();
			ps = con.prepareStatement(
					"UPDATE t2_member SET username = ?, password = ?, jumin = ?, gender = ?, address = ?, jobcd = ?, mailrcv = ?, \r\n"
					+ "intro = ? WHERE userid = ?"
			);
			
			ps.setString(1, vo.getUsername());
			ps.setString(2, vo.getPassword());
			ps.setString(3, vo.getJumin());
			ps.setString(4, vo.getGender());
			ps.setString(5, vo.getAddress());
			ps.setString(6, vo.getJobcd());
			ps.setString(7, vo.getMailrcv());
			ps.setString(8, vo.getIntro());
			ps.setString(9, vo.getUserid());
			
			n = ps.executeUpdate();
			
			if (n > 0) {
				con.commit();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return n;
	}
	
	public ArrayList<MemberVo> getSearch(String c, String f) {
		ArrayList<MemberVo> list = new ArrayList<MemberVo>();
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = DBUtils.getConnection();
			ps = con.prepareStatement(
					"SELECT userid, username, jumin, gender, jobcd FROM t2_member WHERE " + c + " LIKE ?"
			);
			ps.setString(1, "%" + f + "%");
			rs = ps.executeQuery();
			
			while (rs.next()) {
			    MemberVo vo = new MemberVo();
			    vo.setUserid(rs.getString("userid"));
			    vo.setUsername(rs.getString("username"));
			    vo.setJumin(rs.getString("jumin"));
			    vo.setGender(rs.getString("gender"));
			    vo.setJobcd(rs.getString("jobcd"));
			    list.add(vo);
			}
			rs.close();
			ps.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}

package member.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import member.model.vo.Member;

public class MemberDAO {

	private Properties prop = null;

	public MemberDAO() {
		prop = new Properties();
		String fileName = MemberDAO.class.getResource("/sql/member/member-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public Member loginMember(Connection conn, Member member) {
		// SELECT * FROM MEMBER WHERE USER_ID = ? AND USER_PWD = ?;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member loginUser = null;

		String query = prop.getProperty("loginMember");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, member.getEmail());
			pstmt.setString(2, member.getPwd());
			rset = pstmt.executeQuery();

			if (rset.next()) {
				loginUser = new Member(rset.getString("EMAIL"), rset.getString("PWD"), rset.getString("NAME"),
						rset.getDate("BIRTHDAY"), rset.getString("GENDER"), rset.getString("PHONE"),
						rset.getString("ADDRESS"), rset.getString("MEMBER_KAKAO"), rset.getString("MEMBER_TYPE"),
						rset.getString("MEMBER_DELETE_STATUS"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return loginUser;

	}

	public int checkEmail(Connection conn, String userEmail) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;

		String query = prop.getProperty("emailCheck");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userEmail);

			rset = pstmt.executeQuery();
			// rset 은 count해서 무조껀 1개들어감
			if (rset.next()) {
				result = rset.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		return result;
	}

	public int insertMember(Connection conn, Member member) {
		int result = 0;
		// 결과 값을 넣기 위해 int형 변수를 만들어둠
		String query = prop.getProperty("insertMember");
		PreparedStatement pstmt = null;

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, member.getEmail());
			pstmt.setString(2, member.getPwd());
			pstmt.setString(3, member.getName());
			pstmt.setDate(4, member.getBirthday());
			pstmt.setString(5, member.getGender());
			pstmt.setString(6, member.getPhone());
			pstmt.setString(7, member.getAddress());
			pstmt.setString(8, member.getMember_type());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int deleteMember(Connection conn, Member loginUser) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteMember");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, loginUser.getEmail());
			
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
		
	}

}

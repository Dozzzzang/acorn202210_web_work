package chat;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.util.DbcpBean;

public class ChatDao {
	private static ChatDao dao;
	static {
		if(dao==null) {
			dao=new ChatDao();
		}
	}
	private ChatDao() {}
	
	public static ChatDao getInstance() {
		return dao;
	}
	
	public List<ChatDto> getChatList(ChatDto dto){
		List<ChatDto> list = new ArrayList<ChatDto>();
		//필요한 객체를 담을 지역변수를 미리 만들어 둔다.
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//Connection Pool 에서 Connection 객체를 하나 얻어온다.
			conn = new DbcpBean().getConn();
			//실행할 sql 문의 뼈대 구성하기
			String sql = "SELECT * FROM CHAT"
					+ " WHERE chatTime > ?"
					+ " ORDER BY chatTime";
			pstmt = conn.prepareStatement(sql);
			//sql 문의 ? 에 바인딩 할게 있으면 한다.
			pstmt.setString(1, dto.chatTime);			
			//SELECT 문을 수행하고 결과값을 받아온다.
			rs = pstmt.executeQuery();
			list = new ArrayList<ChatDto>();
			//반복문 돌면서 ResultSet 에서 필요한 값을 얻어낸다.
			while (rs.next()) {
				ChatDto chat = new ChatDto();
				chat.setChatName(rs.getString("chatName"));
				chat.setChatContent(rs.getString("chatContent"));
				chat.setChatTime(rs.getString("chatTime"));
				list.add(chat);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close(); //Connection Pool 에 Connection 반납하기
			} catch (Exception e) {
			}
		}
		return list;
	}
	
	public boolean insert(ChatDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			conn = new DbcpBean().getConn();
			//실행할 sql 문
			String sql = "INSERT INTO CHAT VALUES"
					+ " (?, ?, sysdate)";
			pstmt = conn.prepareStatement(sql);
			//? 값을 바인딩 할게 있으면 바인딩하기
			pstmt.setString(1, dto.chatName);
			pstmt.setString(2, dto.chatContent);
			//insert, update, delete 를 수행하고 변화된 row의 갯수를 리턴받기
			rowCount=pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		if (rowCount > 0) {
			return true;
		} else {
			return false;
		}
	}
	
}

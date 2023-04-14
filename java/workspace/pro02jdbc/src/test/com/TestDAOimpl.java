package test.com;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TestDAOimpl implements TestDAO {

	// 6.커넥션
	private Connection conn = null;
	// 7. 질의문 요청용 객체
	private PreparedStatement pstmt;
	// 7-1 Select 질의문 응답객체
	private ResultSet rs;

	private String driver_name = "oracle.jdbc.OracleDriver";
	private final String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private final String user = "HR";
	private final String password = "pi123456";

	// 생성자에 oracle Driver을 연결
	public TestDAOimpl() {
		System.out.println("TestDAOimpl 생성자");
		try {
			// 5.Driver 연결
			Class.forName(driver_name);
			System.out.println("Driver successed");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public List<TestVO> selectAll() {
		System.out.println("selectAll()...");

		// 받아온 행을 담을 상자
		List<TestVO> vos = new ArrayList<TestVO>();
		// 커넥션
		try {
			// HR계정으로 연결
			conn = DriverManager.getConnection(url, user, password);
			System.out.println("conn successed...");

			pstmt = conn.prepareStatement("select * from test");// 실제 질의문

			rs = pstmt.executeQuery();

			// rs가 받아온 행의 수 만큼 반복
			while (rs.next()) {
//				System.out.print(rs.getInt("num"));
//				System.out.print(rs.getString("name"));
//				System.out.println(rs.getInt("age"));
				TestVO vo = new TestVO();
				vo.setNum(rs.getInt("num"));
				vo.setName(rs.getString("name"));
				vo.setAge(rs.getInt("age"));
				vos.add(vo);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 커넥션이 끝나면 닫아주는 작업이 필수적이다
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return vos;
	}

	@Override
	public TestVO selectOne(TestVO vo) {
		System.out.println("selectOne()...");
		System.out.println(vo);
		
		TestVO vo2 = new TestVO();

		// 커넥션
		try {
			// HR계정으로 연결
			conn = DriverManager.getConnection(url, user, password);
			System.out.println("conn successed...");

			pstmt = conn.prepareStatement(
					"select * from test where num=?");// 실제 질의문
			//1번째 물음표에 넣어라!
			pstmt.setInt(1, vo.getNum());
			rs = pstmt.executeQuery();

			while (rs.next()) {
//				System.out.print(rs.getInt("num"));
//				System.out.print(rs.getString("name"));
//				System.out.println(rs.getInt("age"));
				vo2.setNum(rs.getInt("num"));
				vo2.setName(rs.getString("name"));
				vo2.setAge(rs.getInt("age"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 커넥션이 끝나면 닫아주는 작업이 필수적이다
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return vo2;
	}

}

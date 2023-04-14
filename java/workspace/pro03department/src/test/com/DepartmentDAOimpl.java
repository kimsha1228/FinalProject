package test.com;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DepartmentDAOimpl implements DepartmentDAO {
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

	public DepartmentDAOimpl() {
		System.out.println("DepartmentDAOimpl()...");
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
	public List<DepartmentVO> selectAll() {
		System.out.println("selectAll()...");
		// 받아온 행을 담을 상자
		List<DepartmentVO> vos = new ArrayList<DepartmentVO>();
		// 커넥션
		try {
			// HR계정으로 연결
			conn = DriverManager.getConnection(url, user, password);
			System.out.println("conn successed...");

			pstmt = conn.prepareStatement("select * from departments");// 실제 질의문

			rs = pstmt.executeQuery();

			// rs가 받아온 행의 수 만큼 반복
			while (rs.next()) {
				DepartmentVO vo = new DepartmentVO();
				vo.setDepartment_id(rs.getInt("DEPARTMENT_ID"));
				vo.setDepartment_name(rs.getString("Department_name"));
				vo.setManager_id(rs.getInt("Manager_id"));
				vo.setLocation_id(rs.getInt("Location_id"));
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
	public DepartmentVO selectOne(DepartmentVO vo) {
		System.out.println("selectOne()...");
		System.out.println("selectOne()..." + vo);
		DepartmentVO vo2= new DepartmentVO();
		// 커넥션
		try {
			// HR계정으로 연결
			conn = DriverManager.getConnection(url, user, password);
			System.out.println("conn successed...");

			pstmt = conn.prepareStatement("select * from departments where department_id=?");// 실제 질의문
			pstmt.setInt(1,vo.getDepartment_id());//?에 넣어줄 값 받기
			
			rs = pstmt.executeQuery();

			// rs가 받아온 행의 수 만큼 반복
			while (rs.next()) {
				vo2.setDepartment_id(rs.getInt("DEPARTMENT_ID"));
				vo2.setDepartment_name(rs.getString("Department_name"));
				vo2.setManager_id(rs.getInt("Manager_id"));
				vo2.setLocation_id(rs.getInt("Location_id"));
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

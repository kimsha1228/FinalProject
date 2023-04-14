package test.com;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmpDeptDAOimpl implements EmpDeptDAO {
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

	public EmpDeptDAOimpl() {
		System.out.println("EmpDeptDAOimpl()...");
		try {
			// 5.Driver 연결
			Class.forName(driver_name);
			System.out.println("Driver successed");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<EmpDeptVO> selectJoin() {
		System.out.println("selectJoin()......");
		List<EmpDeptVO> vos = new ArrayList<>();

		try {
			conn = DriverManager.getConnection(url, user, password);
			System.out.println("conn successed...");

			pstmt = conn.prepareStatement(
					"Select e.employee_id , e.first_name, e.last_name, e.salary, e.hire_date ,d.department_name "
							+ "From employees e left outer join departments d "
							+ "on (e.department_id=d.department_id) " + "order by e.employee_id");// 실제 질의문

			rs = pstmt.executeQuery();

			while (rs.next()) {
				EmpDeptVO vo = new EmpDeptVO();
				vo.setEmployee_id(rs.getInt("Employee_id"));
				vo.setFirst_name(rs.getString("First_name"));
				vo.setLast_name(rs.getString("Last_name"));
				vo.setSalary(rs.getInt("Salary"));
				vo.setHire_date(rs.getDate("hire_date"));
				vo.setDepartment_name(rs.getString("department_name"));
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
	public int getTotalCount() {
		System.out.println("getTotalCount()...");
		
		int total_count = 0;
		
		try {
			conn = DriverManager.getConnection(url, user, password);
			System.out.println("conn successed...");

			pstmt = conn.prepareStatement(
					"select count(*) as cnt from employees");// 실제 질의문

			rs = pstmt.executeQuery();

			while (rs.next()) {
				total_count=rs.getInt("cnt");
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
		
		return total_count;
	}

}

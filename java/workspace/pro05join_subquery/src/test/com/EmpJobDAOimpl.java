package test.com;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmpJobDAOimpl implements EmpJobDAO {
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

	public EmpJobDAOimpl() {
		System.out.println("EmpJobDAOimpl()...");
		try {
			// 5.Driver 연결
			Class.forName(driver_name);
			System.out.println("Driver successed");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<EmpJobVO> selectJoin() {
		System.out.println("selectJoin()...");
		List<EmpJobVO> vos = new ArrayList<>();
		
		try {
			conn = DriverManager.getConnection(url, user, password);
			System.out.println("conn successed...");

			pstmt = conn.prepareStatement("Select e.employee_id , e.first_name, e.last_name, e.salary, e.hire_date ,j.job_title "
					+ "From employees e join jobs j "
					+ "on (e.job_id=j.job_id) "
					+ "order by e.employee_id desc");// 실제 질의문

			rs = pstmt.executeQuery();

			while (rs.next()) {
				EmpJobVO vo = new EmpJobVO();
				vo.setEmployee_id(rs.getInt("Employee_id"));
				vo.setFirst_name(rs.getString("First_name"));
				vo.setLast_name(rs.getString("Last_name"));
				vo.setSalary(rs.getInt("Salary"));
				vo.setHire_date(rs.getDate("hire_date"));
				vo.setJob_title(rs.getString("Job_title"));
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

}

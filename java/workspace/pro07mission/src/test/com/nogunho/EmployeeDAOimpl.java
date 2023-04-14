package test.com.nogunho;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class EmployeeDAOimpl implements EmployeeDAO {
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
	
	public EmployeeDAOimpl() {
		System.out.println("EmployeeDAOimpl생성자...");
		try {
			// 5.Driver 연결
			Class.forName(driver_name);
			System.out.println("Driver successed");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public List<EmployeeVO> selectAll() {
		System.out.println("selectAll()...");

		List<EmployeeVO> vos = new ArrayList<>();
		
		try {
			conn = DriverManager.getConnection(url,user,password);
			System.out.println("conn successed...");
			
			pstmt = conn.prepareStatement("select * from employees "
					+ "order by employee_id asc");// 실제 질의문

			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				EmployeeVO vo = new EmployeeVO();
				vo.setEmployee_id(rs.getInt("employee_id"));
				vo.setFirst_name(rs.getString("First_name"));
				vo.setLast_name(rs.getString("Last_name"));
				vo.setHire_date(rs.getDate("hire_date"));
				vo.setSalary(rs.getInt("salary"));
				vo.setJob_id(rs.getString("Job_Id"));
				vo.setCommission_pct(rs.getDouble("COMMISSION_PCT"));
				vo.setDepartment_id(rs.getInt("DEPARTMENT_ID"));
				vo.setEmail(rs.getString("EMAIL"));
				vo.setManager_id(rs.getInt("MANAGER_ID"));
				vo.setPhone_number(rs.getString("PHONE_NUMBER"));
				vos.add(vo);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
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
	public List<EmployeeVO> searchList(String searchKey, String searchWord) {
		System.out.println("searchList()...");
		System.out.println("searchKey..."+searchKey);
		System.out.println("searchWord..."+searchWord);
		
		List<EmployeeVO> vos = new ArrayList<>();
		
		try {
			conn = DriverManager.getConnection(url,user,password);
			System.out.println("conn successed...");
			String sql="";
			
			//TODO 코드줄이기
			if(searchKey.equals("First_name")) {
				sql ="select * from employees where First_name like ?";
				pstmt = conn.prepareStatement(sql);// 실제 질의문
				pstmt.setString(1, "%"+searchWord+"%");
			} else if(searchKey.equals("salary")){
				sql ="select * from employees where salary = ?";
				pstmt = conn.prepareStatement(sql);// 실제 질의문
				pstmt.setInt(1, Integer.parseInt(searchWord));
			}
		
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				EmployeeVO vo = new EmployeeVO();
				vo.setEmployee_id(rs.getInt("employee_id"));
				vo.setFirst_name(rs.getString("First_name"));
				vo.setLast_name(rs.getString("Last_name"));
				vo.setHire_date(rs.getDate("hire_date"));
				vo.setSalary(rs.getInt("salary"));
				vo.setJob_id(rs.getString("Job_Id"));
				vo.setCommission_pct(rs.getDouble("COMMISSION_PCT"));
				vo.setDepartment_id(rs.getInt("DEPARTMENT_ID"));
				vo.setEmail(rs.getString("EMAIL"));
				vo.setManager_id(rs.getInt("MANAGER_ID"));
				vo.setPhone_number(rs.getString("PHONE_NUMBER"));
				vos.add(vo);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
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
	public EmployeeVO selectOne(EmployeeVO vo) {
		System.out.println("selectOne()...");
		System.out.println("selectOne()..."+vo);

		EmployeeVO vo2 = new EmployeeVO();
		
		try {
			conn = DriverManager.getConnection(url,user,password);
			System.out.println("conn successed...");
			
			pstmt = conn.prepareStatement("select * from employees where employee_id = ?");// 실제 질의문
			pstmt.setInt(1, vo.getEmployee_id());
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo2.setEmployee_id(rs.getInt("employee_id"));
				vo2.setFirst_name(rs.getString("First_name"));
				vo2.setLast_name(rs.getString("Last_name"));
				vo2.setHire_date(rs.getDate("hire_date"));
				vo2.setSalary(rs.getInt("salary"));
				vo2.setJob_id(rs.getString("Job_Id"));
				vo2.setCommission_pct(rs.getDouble("COMMISSION_PCT"));
				vo2.setDepartment_id(rs.getInt("DEPARTMENT_ID"));
				vo2.setEmail(rs.getString("EMAIL"));
				vo2.setManager_id(rs.getInt("MANAGER_ID"));
				vo2.setPhone_number(rs.getString("PHONE_NUMBER"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
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

	@Override
	public List<EmployeeVO> searchDeptList(int dept_num) {
		System.out.println("searchDeptList()..."+"넘어온 부서번호: "+dept_num);

		List<EmployeeVO> vos = new ArrayList<>();
		
		try {
			conn = DriverManager.getConnection(url,user,password);
			System.out.println("conn successed...");
			
			pstmt = conn.prepareStatement("select * from employees "
					+ "Where department_id = ? "
					+ "order by employee_id asc");// 실제 질의문
			pstmt.setInt(1, dept_num);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				EmployeeVO vo = new EmployeeVO();
				vo.setEmployee_id(rs.getInt("employee_id"));
				vo.setFirst_name(rs.getString("First_name"));
				vo.setLast_name(rs.getString("Last_name"));
				vo.setHire_date(rs.getDate("hire_date"));
				vo.setSalary(rs.getInt("salary"));
				vo.setJob_id(rs.getString("Job_Id"));
				vo.setCommission_pct(rs.getDouble("COMMISSION_PCT"));
				vo.setDepartment_id(rs.getInt("DEPARTMENT_ID"));
				vo.setEmail(rs.getString("EMAIL"));
				vo.setManager_id(rs.getInt("MANAGER_ID"));
				vo.setPhone_number(rs.getString("PHONE_NUMBER"));
				vos.add(vo);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
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

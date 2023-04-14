package test.com;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmpDAOimpl implements EmpDAO {
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

	public EmpDAOimpl() {
		System.out.println("EmpDAOimpl...");
		try {
			// 5.Driver 연결
			Class.forName(driver_name);
			System.out.println("Driver successed");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public int copytable() {
		System.out.println("copytable()...");
		int flag = 0;
		
		try {
			conn = DriverManager.getConnection(url,user,password);
			System.out.println("conn successed...");
			
			pstmt = conn.prepareStatement(
					"CREATE TABLE EMP AS "
					+ "(select employee_id,first_name,last_name, salary,hire_date,job_id from employees)");

			flag=pstmt.executeUpdate();
			
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
		
		return flag;
	}

	@Override
	public int insert(EmpVO vo) {
		System.out.println("Insert()...."+vo); //잘 넘어왔나 확인
		int flag=0;
		
		try {
			conn = DriverManager.getConnection(url,user,password);
			System.out.println("conn successed...");
			
			pstmt = conn.prepareStatement(
					"insert into EMP "
					+ "(Employee_id,First_name,Last_name,Hire_date,Salary,Job_id) "
					+ "values(?,?,?,?,?,?)");
			pstmt.setInt(1, vo.getEmployee_id());
			pstmt.setString(2, vo.getFirst_name());
			pstmt.setString(3, vo.getLast_name());
			pstmt.setDate(4, vo.getHire_date());
			pstmt.setInt(5, vo.getSalary());
			pstmt.setString(6, vo.getJob_id());
			
			
			//Returns:either 
//			(1) the row count for SQL Data Manipulation Language (DML) statementsor 
//			(2) 0 for SQL statements that return nothing
			flag=pstmt.executeUpdate(); //DML: INSERT,UPDATE,DELETE 할때는 executeUpdate
			
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
		
		return flag;
	}

	@Override
	public int update(EmpVO vo) {
		System.out.println("update()...."+vo); //잘 넘어왔나 확인
		int flag=0;
		
		try {
			conn = DriverManager.getConnection(url,user,password);
			System.out.println("conn successed...");
			
			pstmt = conn.prepareStatement(
					"UPDATE EMP SET First_name=?, Last_name=?, Hire_date=?,Salary=?,Job_id=? "
					+ "WHERE Employee_id=?");
			pstmt.setString(1, vo.getFirst_name());
			pstmt.setString(2, vo.getLast_name());
			pstmt.setDate(3, vo.getHire_date());
			pstmt.setInt(4, vo.getSalary());
			pstmt.setString(5, vo.getJob_id());
			pstmt.setInt(6, vo.getEmployee_id());
			
			
			//Returns:either 
//			(1) the row count for SQL Data Manipulation Language (DML) statementsor 
//			(2) 0 for SQL statements that return nothing
			flag=pstmt.executeUpdate(); //DML: INSERT,UPDATE,DELETE 할때는 executeUpdate
			
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
		
		return flag;
	}

	@Override
	public int delete(EmpVO vo) {
		System.out.println("delete()...."+vo); //잘 넘어왔나 확인
		int flag=0;
		
		try {
			conn = DriverManager.getConnection(url,user,password);
			System.out.println("conn successed...");
			
			pstmt = conn.prepareStatement(
					"DELETE FROM EMP where Employee_id=?");
			pstmt.setInt(1, vo.getEmployee_id());
			
			//Returns:either 
//			(1) the row count for SQL Data Manipulation Language (DML) statementsor 
//			(2) 0 for SQL statements that return nothing
			flag=pstmt.executeUpdate(); //DML: INSERT,UPDATE,DELETE 할때는 executeUpdate
			
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
		
		return flag;
	}

	@Override
	public List<EmpVO> selectAll() {
		System.out.println("selectAll()...");

		List<EmpVO> vos = new ArrayList<>();
		
		
		try {
			conn = DriverManager.getConnection(url,user,password);
			System.out.println("conn successed...");
			
			pstmt = conn.prepareStatement("select * from emp "
					+ "order by employee_id desc");// 실제 질의문

			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				EmpVO vo = new EmpVO();
				vo.setEmployee_id(rs.getInt("employee_id"));
				vo.setFirst_name(rs.getString("First_name"));
				vo.setLast_name(rs.getString("Last_name"));
				vo.setHire_date(rs.getDate("hire_date"));
				vo.setSalary(rs.getInt("salary"));
				vo.setJob_id(rs.getString("Job_Id"));
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
	public List<EmpVO> searchList(String searchKey, String searchWord) {
		System.out.println("searchList()...");
		System.out.println("searchKey..."+searchKey);
		System.out.println("searchWord..."+searchWord);
		
		List<EmpVO> vos = new ArrayList<>();
		
		try {
			conn = DriverManager.getConnection(url,user,password);
			System.out.println("conn successed...");
			String sql="";
			
			if(searchKey.equals("First_name")) {
				sql ="select * from emp where First_name like ?";
			} else if(searchKey.equals("tel")){
				sql ="select * from emp where tel like ?";
			}
			
			pstmt = conn.prepareStatement(sql);// 실제 질의문
			pstmt.setString(1, "%"+searchWord+"%");
		
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				EmpVO vo = new EmpVO();
				vo.setEmployee_id(rs.getInt("employee_id"));
				vo.setFirst_name(rs.getString("First_name"));
				vo.setLast_name(rs.getString("Last_name"));
				vo.setHire_date(rs.getDate("hire_date"));
				vo.setSalary(rs.getInt("salary"));
				vo.setJob_id(rs.getString("Job_Id"));
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
	public EmpVO searchNum(EmpVO vo) {
		System.out.println("searchNum()..."+vo);

		try {
			conn = DriverManager.getConnection(url,user,password);
			System.out.println("conn successed...");
			
			pstmt = conn.prepareStatement("select * from EMP where employee_id=?");// 실제 질의문
			pstmt.setInt(1, vo.getEmployee_id());
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo.setFirst_name(rs.getString("First_name"));
				vo.setLast_name(rs.getString("Last_name"));
				vo.setHire_date(rs.getDate("hire_date"));
				vo.setSalary(rs.getInt("salary"));
				vo.setJob_id(rs.getString("Job_Id"));
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
		
		
		
		return vo;
	}

	@Override
	public List<ViewEmpDeptVO> selectView() {
		System.out.println("selectView()...");

		List<ViewEmpDeptVO> vos = new ArrayList<>();
		
		
		try {
			conn = DriverManager.getConnection(url,user,password);
			System.out.println("conn successed...");
			
			pstmt = conn.prepareStatement("select * from view_emp_dept "
					+ "order by empno asc");// 실제 질의문

			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ViewEmpDeptVO vo = new ViewEmpDeptVO();
				vo.setEmpno(rs.getInt("Empno"));
				vo.setFname(rs.getString("Fname"));
				vo.setDeptno(rs.getInt("deptno"));
				vo.setDeptname(rs.getString("deptname"));
				vo.setSalary(rs.getInt("salary"));
				vo.setCommpct(rs.getDouble("commpct"));
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

package test.com;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MemberDAOimpl implements MemberDAO {
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
	// 생성자
	public MemberDAOimpl() {
		System.out.println("MemberDAOimpl()...");
		try {
			// 5.Driver 연결
			Class.forName(driver_name);
			System.out.println("Driver successed");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<MemberVO> selectAll() {
		System.out.println("selectAll()...");

		List<MemberVO> vos = new ArrayList<>();
		
		
		try {
			conn = DriverManager.getConnection(url,user,password);
			System.out.println("conn successed...");
			
			pstmt = conn.prepareStatement("select * from member "
					+ "order by num desc");// 실제 질의문

			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				MemberVO vo = new MemberVO();
				vo.setNUM(rs.getInt("num"));
				vo.setID(rs.getString("ID"));
				vo.setPASSWORD(rs.getString("PASSWORD"));
				vo.setNAME(rs.getString("NAME"));
				vo.setTEL(rs.getString("TEL"));
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
	public MemberVO selectOne(MemberVO vo) {
		System.out.println("selectOne()...");
		System.out.println("selectOne()..."+vo);

		MemberVO vo2 = new MemberVO();
		
		try {
			conn = DriverManager.getConnection(url,user,password);
			System.out.println("conn successed...");
			
			pstmt = conn.prepareStatement("select * from member where num=?");// 실제 질의문
			pstmt.setInt(1, vo.getNUM());
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo2.setNUM(rs.getInt("num"));
				vo2.setID(rs.getString("ID"));
				vo2.setPASSWORD(rs.getString("PASSWORD"));
				vo2.setNAME(rs.getString("NAME"));
				vo2.setTEL(rs.getString("TEL"));
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
	public List<MemberVO> searchList(String searchKey, String searchWord) {
		System.out.println("searchList()...");
		System.out.println("searchKey..."+searchKey);
		System.out.println("searchWord..."+searchWord);
		
		List<MemberVO> vos = new ArrayList<>();
		
		try {
			conn = DriverManager.getConnection(url,user,password);
			System.out.println("conn successed...");
			String sql="";
			
			if(searchKey.equals("name")) {
				sql ="select * from member where name like ?";
			} else if(searchKey.equals("tel")){
				sql ="select * from member where tel like ?";
			}
			
			pstmt = conn.prepareStatement(sql);// 실제 질의문
			pstmt.setString(1, "%"+searchWord+"%");
		
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				MemberVO vo = new MemberVO();
				vo.setNUM(rs.getInt("num"));
				vo.setID(rs.getString("ID"));
				vo.setPASSWORD(rs.getString("PASSWORD"));
				vo.setNAME(rs.getString("NAME"));
				vo.setTEL(rs.getString("TEL"));
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
	public int insert(MemberVO vo) {
		System.out.println("Insert()...."+vo); //잘 넘어왔나 확인
		int flag=0;
		
		try {
			conn = DriverManager.getConnection(url,user,password);
			System.out.println("conn successed...");
			
			pstmt = conn.prepareStatement(
					"insert into member(num,id,PASSWORD,name,tel) "
					+ "values(SEQ_MEMBER.nextval, "
					+ "?,?,?,?)");
			pstmt.setString(1, vo.getID());
			pstmt.setString(2, vo.getPASSWORD());
			pstmt.setString(3, vo.getNAME());
			pstmt.setString(4, vo.getTEL());
			
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
	public int update(MemberVO vo) {
		System.out.println("update()...."+vo); //잘 넘어왔나 확인
		int flag=0;
		
		try {
			conn = DriverManager.getConnection(url,user,password);
			System.out.println("conn successed...");
			
			pstmt = conn.prepareStatement(
					"UPDATE member SET id=?, PASSWORD=?, name=?,tel=? "
					+ "WHERE num=?");
			pstmt.setString(1, vo.getID());
			pstmt.setString(2, vo.getPASSWORD());
			pstmt.setString(3, vo.getNAME());
			pstmt.setString(4, vo.getTEL());
			pstmt.setInt(5, vo.getNUM());
			
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
	public int delete(MemberVO vo) {
		System.out.println("delete()...."+vo); //잘 넘어왔나 확인
		int flag=0;
		
		try {
			conn = DriverManager.getConnection(url,user,password);
			System.out.println("conn successed...");
			
			pstmt = conn.prepareStatement(
					"DELETE FROM member where num=?");
			pstmt.setInt(1, vo.getNUM());
			
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

}

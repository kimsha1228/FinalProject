package test.com;

public class ViewEmpDeptVO {
	private int empno;
	private String fname;
	private int deptno;
	private String deptname;
	private int salary;
	private double commpct;
	public int getEmpno() {
		return empno;
	}
	public void setEmpno(int empno) {
		this.empno = empno;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public int getDeptno() {
		return deptno;
	}
	public void setDeptno(int deptno) {
		this.deptno = deptno;
	}
	public String getDeptname() {
		return deptname;
	}
	public void setDeptname(String deptname) {
		this.deptname = deptname;
	}
	public int getSalary() {
		return salary;
	}
	public void setSalary(int salary) {
		this.salary = salary;
	}
	public double getCommpct() {
		return commpct;
	}
	public void setCommpct(double commpct) {
		this.commpct = commpct;
	}
	
	@Override
	public String toString() {
		return "ViewEmpDeptVO [empno=" + empno + ", fname=" + fname + ", deptno=" + deptno + ", deptname=" + deptname
				+ ", salary=" + salary + ", commpct=" + commpct + "]";
	}
	
}

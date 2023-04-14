package test.com;

public class MemberVO {
	private int NUM;
	private String ID;
	private String PASSWORD;
	private String NAME;
	private String TEL;

	public int getNUM() {
		return NUM;
	}

	public void setNUM(int nUM) {
		NUM = nUM;
	}

	public String getID() {
		return ID;
	}

	public void setID(String iD) {
		ID = iD;
	}

	public String getPASSWORD() {
		return PASSWORD;
	}

	public void setPASSWORD(String pASSWORD) {
		PASSWORD = pASSWORD;
	}

	public String getNAME() {
		return NAME;
	}

	public void setNAME(String nAME) {
		NAME = nAME;
	}

	public String getTEL() {
		return TEL;
	}

	public void setTEL(String tEL) {
		TEL = tEL;
	}

	@Override
	public String toString() {
		return "MemberVO [NUM=" + NUM + ", ID=" + ID + ", PASSWORD=" + PASSWORD + ", NAME=" + NAME + ", TEL=" + TEL
				+ "]";
	}

}

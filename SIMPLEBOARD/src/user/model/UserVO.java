package user.model;

import java.sql.Timestamp;

public class UserVO {

	private String id;
	private String password;
	private String name;
	private String hp1;
	private String hp2;
	private String hp3;
	private String email1;
	private String email2;
	private String addrbasic;
	private String addrdetail;
	private Timestamp regdate;
	public UserVO() {super();}
	public UserVO(String id, String password, String name, String hp1, String hp2, String hp3, String email1,
			String email2, String addrbasic, String addrdetail, Timestamp regdate) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.hp1 = hp1;
		this.hp2 = hp2;
		this.hp3 = hp3;
		this.email1 = email1;
		this.email2 = email2;
		this.addrbasic = addrbasic;
		this.addrdetail = addrdetail;
		this.regdate = regdate;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getHp1() {
		return hp1;
	}
	public void setHp1(String hp1) {
		this.hp1 = hp1;
	}
	public String getHp2() {
		return hp2;
	}
	public void setHp2(String hp2) {
		this.hp2 = hp2;
	}
	public String getHp3() {
		return hp3;
	}
	public void setHp3(String hp3) {
		this.hp3 = hp3;
	}
	public String getEmail1() {
		return email1;
	}
	public void setEmail1(String email1) {
		this.email1 = email1;
	}
	public String getEmail2() {
		return email2;
	}
	public void setEmail2(String email2) {
		this.email2 = email2;
	}
	public String getAddrbasic() {
		return addrbasic;
	}
	public void setAddrbasic(String addrbasic) {
		this.addrbasic = addrbasic;
	}
	public String getAddrdetail() {
		return addrdetail;
	}
	public void setAddrdetail(String addrdetail) {
		this.addrdetail = addrdetail;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
}

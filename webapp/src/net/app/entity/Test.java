package net.app.entity;

import javax.persistence.Entity;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "xx_test")
@SequenceGenerator(name = "sequenceGenerator", sequenceName = "xx_test_sequence")
public class Test extends BaseEntity{

	private static final long serialVersionUID = 127690436282544904L;

	/** 用户名 */
	private String username;

	/** 密码 */
	private String password;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}

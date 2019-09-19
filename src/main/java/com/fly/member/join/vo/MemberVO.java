package com.fly.member.join.vo;

//memberVO
public class MemberVO {
	private String m_id;// 아이디
	private String m_pw;// 비밀번호
	private String m_phone;// 휴대전화
	private String m_name;// 회원명
	private int m_type = 3;// 회원 유형
	private String email_confirm;// 이메일 인증 상태
	private int m_status;// 회원 상태
	private String m_regdate;// 가입일

	public MemberVO() {
		super();
	}

	public MemberVO(String m_id, int m_type) {
		super();
		this.m_id = m_id;
		this.m_type = m_type;
	}

	public MemberVO(String m_id, String m_pw, String m_phone, String m_name, int m_type, String email_confirm,
			int m_status, String m_regdate) {
		super();
		this.m_id = m_id;
		this.m_pw = m_pw;
		this.m_phone = m_phone;
		this.m_name = m_name;
		this.m_type = m_type;
		this.email_confirm = email_confirm;
		this.m_status = m_status;
		this.m_regdate = m_regdate;
	}

	// Getter Setter
	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getM_pw() {
		return m_pw;
	}

	public void setM_pw(String m_pw) {
		this.m_pw = m_pw;
	}

	public String getM_phone() {
		return m_phone;
	}

	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public int getM_type() {
		return m_type;
	}

	public void setM_type(int m_type) {
		this.m_type = m_type;
	}

	public String getEmail_confirm() {
		return email_confirm;
	}

	public void setEmail_confirm(String email_confirm) {
		this.email_confirm = email_confirm;
	}

	public int getM_status() {
		return m_status;
	}

	public void setM_status(int m_status) {
		this.m_status = m_status;
	}

	public String getM_regdate() {
		return m_regdate;
	}

	public void setM_regdate(String m_regdate) {
		this.m_regdate = m_regdate;
	}

	@Override
	public String toString() {
		return "MemberVO [m_id=" + m_id + ", m_pw=" + m_pw + ", m_phone=" + m_phone + ", m_name=" + m_name + ", m_type="
				+ m_type + ", email_confirm=" + email_confirm + ", m_status=" + m_status + ", m_regdate=" + m_regdate
				+ "]";
	}

}

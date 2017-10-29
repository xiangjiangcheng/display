package com.display.maven.display.domain.extend;

import com.display.maven.display.domain.User;

public class UserAndGroupExtend extends User {
	private String groupid;
	private String groupname;

	public String getGroupname() {
		return groupname;
	}

	public void setGroupname(String groupname) {
		this.groupname = groupname;
	}

	public String getGroupid() {
		return groupid;
	}

	public void setGroupid(String groupid) {
		this.groupid = groupid;
	}

}

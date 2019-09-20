package com.fly.paging.util;

public class Util {
	public static int nvl(String text) {
		return nvl(text, 0);
	}
	
	// 문자열을 숫자로 변환하는 메서드
	public static int nvl(String text, int def) {
		int ret = def;
		
		try {
			ret = Integer.parseInt(text);
		}catch(Exception e) {
			ret = def;
		}
		return ret;
	}
}

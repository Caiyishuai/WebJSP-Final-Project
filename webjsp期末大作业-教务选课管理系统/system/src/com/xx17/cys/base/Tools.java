package com.xx17.cys.base;

import java.util.*;
import java.text.SimpleDateFormat;

import javafx.scene.chart.PieChart.Data;

public class Tools {
	
	public static int getNum(String str) {
		int result = 0;
		try{
			if(str.length()>0) {
				result = Integer.parseInt(str);
			}
		}catch(Exception e){
		}
		return result;
	}
	
	/*
	 * 判断是否包含非法字符
	 * 返回：包含（false）、不包含（true）
	 * 修改：cys,2019-4-4
	 * */
	public static boolean checkChar(String str) {
		boolean result = true;
		String validStr="0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
		for(int i=0; i<str.length();i++) {
			String s = str.substring(i, i+1);
			if(validStr.indexOf(s)==-1) {
				System.out.println(s+"非法字符！！！");
				result = false;
				break;
			}
		}
		return result;
	}
	/*
	 * 用户名判断3-20位，字母（不分大小写）和数字
	 * cys 2019-04-10
	 */
	public static boolean checkUserName(String str) {
		boolean result = true;
		if(str.length()<3 || str.length()>20) {
			result = false;
		}
		return result;
	}
	/*
	 * 密码判断3-30位，字母（不分大小写）和数字
	 * cys 2019-04-10
	 */
	public static boolean checkPass(String str) {
		boolean result = true;
		if(str.length()<3 || str.length()>30 || !checkChar(str)) {
			result = false;
		}
		return result;
	}
	
	public static String getTime() {
		String time;
		Date today = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return sdf.format(today);
	}
}

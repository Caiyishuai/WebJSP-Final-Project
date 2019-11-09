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
	 * �ж��Ƿ�����Ƿ��ַ�
	 * ���أ�������false������������true��
	 * �޸ģ�cys,2019-4-4
	 * */
	public static boolean checkChar(String str) {
		boolean result = true;
		String validStr="0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
		for(int i=0; i<str.length();i++) {
			String s = str.substring(i, i+1);
			if(validStr.indexOf(s)==-1) {
				System.out.println(s+"�Ƿ��ַ�������");
				result = false;
				break;
			}
		}
		return result;
	}
	/*
	 * �û����ж�3-20λ����ĸ�����ִ�Сд��������
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
	 * �����ж�3-30λ����ĸ�����ִ�Сд��������
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

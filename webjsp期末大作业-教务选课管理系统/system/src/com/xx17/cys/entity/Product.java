package com.xx17.cys.entity;


public class Product {

	private String name; 			// �������
	private int num; 				// ����

	public Product(String name, int num) {
		this.name = name;
		this.num = num;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	@Override
	public String toString() {
		return "Product [name=" + name + ", num=" + num + "]";
	}
}



package com.webapp.myalumniroster;

public class ReverseStringStringBuffer {

	public static void main(String[] args) {

		String string = "Centene";
		String reverse = new StringBuffer(string).reverse().toString();
		
		System.out.println(reverse);

	}

}

package com.webapp.myalumniroster;

import java.lang.reflect.Array;
import java.util.Arrays;

public class StringReverseHalfLength {

	public static void main(String Args[]) {
		

		String str = "Centene";
		char[] array = str.toCharArray();
//		char[] ary = {'C', 'e', 'n', 't', 'e', 'n','e'};
		System.out.println(Arrays.toString(array));
		
		reverse(array);
		System.out.println(Arrays.toString(array));
		
	}
	
	
	private static void reverse(char[] array) {
		
		
		
		int maxIndex = array.length-1; 
		int halfIndex = (array.length-1) /2;
		for (int i=0; i<halfIndex; i++) {
			
			char temp = array[i];
			array[i] = array[maxIndex-1];
			array[maxIndex-1] = temp;
		}
		
		
	}
	
	
	
	
}

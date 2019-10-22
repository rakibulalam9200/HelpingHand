package com.helpinghand.utils;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.itextpdf.text.pdf.PdfStructTreeController.returnType;

public class Formate {

	public boolean checkNumbervalidator(String name) {
		int flag = 1;
		for (int i = 0; i < name.length(); i++) {
			char ch = name.charAt(i);
			if (Character.isLetter(ch)) {
				flag = 2;
			}
		}
		if (flag == 2) {
			return true;
		}
		return false;
	}

	public boolean checkSpecialcharacter(String value) {
		Pattern special = Pattern.compile("[$&+,:;=\\\\\\\\?@#|/'<>.^*()%!-]");
		Matcher hasSpecial = special.matcher(value);
		if (hasSpecial.find() == true) {
			return true;
		}
		return false;
	}

	public boolean checkNID(String nid) {
		String getNID = nid;
		if (getNID.length() == 13) {
			return true;
		} else {
			return false;
		}

	}

	public boolean checkPassword(String password) {
		String getpassword = password;
		if (getpassword.length() >= 5) {
			return true;
		} else {
			return false;
		}
	}

	public boolean checkContactNo(String contactNo) {
		String getcontactNo = contactNo;
		if (getcontactNo.length() == 11) {
			return true;
		} else {
			return false;
		}

	}

}

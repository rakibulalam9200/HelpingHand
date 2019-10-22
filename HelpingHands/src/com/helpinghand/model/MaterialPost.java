package com.helpinghand.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "matrialpost")
public class MaterialPost {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int matrialId;

	@Column(name = "matrialemail")
	private String matrialEmail;

	@Column(name = "matrialarea")
	private String matrialarea;

	@Column(name = "matrialname")
	private String matrialItemname;

	@Column(name = "matrialbrandname")
	private String matrialBrandname;

	@Column(name = "matrialcategory")
	private String matrialCategory;

	@Column(name = "matrialcondition")
	private String matrialCondition;

	@Column(name = "materialdescription")
	private String matrialDescription;

	@Column(name = "materialoptin")
	private String matrialOption;

	@Column(name = "materialcontact")
	private String matrialContactnumber;

	@Column(name = "materialimg")
	private String matrialImg;

	@Column(name = "mexchangeitemname")
	private String matrialExitemname;

	@Column(name = "mexbarndname")
	private String matrialExbarndname;

	@Column(name = "mexcategory")
	private String matrialExcategory;

	@Column(name = "mexcondition")
	private String matrialExcondtion;

	@Column(name = "paidprice")
	private int paidPrice;
	
	@Column(name = "userstatus")
	private boolean userstatus;

	@Column(name = "materialdate")
	private String matrialDate;

	public MaterialPost() {

	}

	public MaterialPost(int matrialId, String matrialEmail, String matrialarea, String matrialItemname,
			String matrialBrandname, String matrialCategory, String matrialCondition, String matrialDescription,
			String matrialOption, String matrialContactnumber, String matrialImg, String matrialExitemname,
			String matrialExbarndname, String matrialExcategory, String matrialExcondtion, int paidPrice,
			boolean userstatus, String matrialDate) {
		super();
		this.matrialId = matrialId;
		this.matrialEmail = matrialEmail;
		this.matrialarea = matrialarea;
		this.matrialItemname = matrialItemname;
		this.matrialBrandname = matrialBrandname;
		this.matrialCategory = matrialCategory;
		this.matrialCondition = matrialCondition;
		this.matrialDescription = matrialDescription;
		this.matrialOption = matrialOption;
		this.matrialContactnumber = matrialContactnumber;
		this.matrialImg = matrialImg;
		this.matrialExitemname = matrialExitemname;
		this.matrialExbarndname = matrialExbarndname;
		this.matrialExcategory = matrialExcategory;
		this.matrialExcondtion = matrialExcondtion;
		this.paidPrice = paidPrice;
		this.userstatus = userstatus;
		this.matrialDate = matrialDate;
	}



	public int getMatrialId() {
		return matrialId;
	}

	public void setMatrialId(int matrialId) {
		this.matrialId = matrialId;
	}

	public String getMatrialEmail() {
		return matrialEmail;
	}

	public void setMatrialEmail(String matrialEmail) {
		this.matrialEmail = matrialEmail;
	}

	public String getMatrialarea() {
		return matrialarea;
	}

	public void setMatrialarea(String matrialarea) {
		this.matrialarea = matrialarea;
	}

	public String getMatrialItemname() {
		return matrialItemname;
	}

	public void setMatrialItemname(String matrialItemname) {
		this.matrialItemname = matrialItemname;
	}

	public String getMatrialBrandname() {
		return matrialBrandname;
	}

	public void setMatrialBrandname(String matrialBrandname) {
		this.matrialBrandname = matrialBrandname;
	}

	public String getMatrialCategory() {
		return matrialCategory;
	}

	public void setMatrialCategory(String matrialCategory) {
		this.matrialCategory = matrialCategory;
	}

	public String getMatrialCondition() {
		return matrialCondition;
	}

	public void setMatrialCondition(String matrialCondition) {
		this.matrialCondition = matrialCondition;
	}

	public String getMatrialDescription() {
		return matrialDescription;
	}

	public void setMatrialDescription(String matrialDescription) {
		this.matrialDescription = matrialDescription;
	}

	public String getMatrialOption() {
		return matrialOption;
	}

	public void setMatrialOption(String matrialOption) {
		this.matrialOption = matrialOption;
	}

	public String getMatrialContactnumber() {
		return matrialContactnumber;
	}

	public void setMatrialContactnumber(String matrialContactnumber) {
		this.matrialContactnumber = matrialContactnumber;
	}

	public String getMatrialImg() {
		return matrialImg;
	}

	public void setMatrialImg(String matrialImg) {
		this.matrialImg = matrialImg;
	}

	public String getMatrialExitemname() {
		return matrialExitemname;
	}

	public void setMatrialExitemname(String matrialExitemname) {
		this.matrialExitemname = matrialExitemname;
	}

	public String getMatrialExbarndname() {
		return matrialExbarndname;
	}

	public void setMatrialExbarndname(String matrialExbarndname) {
		this.matrialExbarndname = matrialExbarndname;
	}

	public String getMatrialExcategory() {
		return matrialExcategory;
	}

	public void setMatrialExcategory(String matrialExcategory) {
		this.matrialExcategory = matrialExcategory;
	}

	public String getMatrialExcondtion() {
		return matrialExcondtion;
	}

	public void setMatrialExcondtion(String matrialExcondtion) {
		this.matrialExcondtion = matrialExcondtion;
	}

	public int getPaidPrice() {
		return paidPrice;
	}

	public void setPaidPrice(int paidPrice) {
		this.paidPrice = paidPrice;
	}

	public boolean isUserstatus() {
		return userstatus;
	}

	public void setUserstatus(boolean userstatus) {
		this.userstatus = userstatus;
	}

	public String getMatrialDate() {
		return matrialDate;
	}

	public void setMatrialDate(String matrialDate) {
		this.matrialDate = matrialDate;
	}
	
	

	
	

	
}

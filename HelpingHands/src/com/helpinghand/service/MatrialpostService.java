package com.helpinghand.service;

import java.util.List;
import com.helpinghand.model.MaterialPost;

public interface MatrialpostService {
	
	public void addMaterialpost(MaterialPost addmatrialpost);

	public List<MaterialPost> getMaterialpostList(String email);

	public void deleteMateralpost(int id);

	public MaterialPost getMaterialPost(int id);

	public void updateMaterialpostInfo(MaterialPost updatematerialInfo);

	public List<MaterialPost> getMatrialpostList(int status);
	
	public List<MaterialPost> getMatrialpostListadmin();
	
	public List<MaterialPost> searchMaterialpost(String location);
	
	public List<MaterialPost> searchMaterialNamepost(String matrialname);
}

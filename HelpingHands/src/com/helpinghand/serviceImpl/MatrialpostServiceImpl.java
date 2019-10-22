package com.helpinghand.serviceImpl;

import java.util.List;

import com.helpinghand.dao.MatrialpostDao;
import com.helpinghand.daoImpl.MatrialpostDaoImpl;
import com.helpinghand.model.MaterialPost;
import com.helpinghand.service.MatrialpostService;

public class MatrialpostServiceImpl implements MatrialpostService {

	MatrialpostDao matrialpostdao = new MatrialpostDaoImpl();

	@Override
	public void addMaterialpost(MaterialPost addmatrialpost) {
		matrialpostdao.addMaterialpost(addmatrialpost);
	}

	@Override
	public List<MaterialPost> getMaterialpostList(String email) {
		return matrialpostdao.getMaterialpostList(email);
	}

	@Override
	public void deleteMateralpost(int id) {
		matrialpostdao.deleteMateralpost(id);
	}

	@Override
	public MaterialPost getMaterialPost(int id) {
		return matrialpostdao.getMaterialPost(id);
	}

	@Override
	public void updateMaterialpostInfo(MaterialPost updatematerialInfo) {
		matrialpostdao.updateMaterialpostInfo(updatematerialInfo);
	}

	@Override
	public List<MaterialPost> getMatrialpostList(int status) {
		return matrialpostdao.getMatrialpostList(status);
	}

	@Override
	public List<MaterialPost> getMatrialpostListadmin() {
		return matrialpostdao.getMatrialpostListadmin();
	}

	@Override
	public List<MaterialPost> searchMaterialpost(String location) {
		return matrialpostdao.searchMaterialpost(location);
	}

	@Override
	public List<MaterialPost> searchMaterialNamepost(String matrialname) {
		return matrialpostdao.searchMaterialNamepost(matrialname);
	}
}

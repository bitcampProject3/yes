package com.bit.yes.model;

import java.sql.SQLException;


import com.bit.yes.model.entity.UserVo;
public interface UserDao {

	
	
	public void insertOne(UserVo bean) throws SQLException; //ȸ������
	//�α���
	public UserVo loginCheck(String id,String password) throws SQLException;
	public UserVo login(String id) throws SQLException;
	//���̵� ��й�ȣ ã��
	public String findId(String name,String email,String birth) throws SQLException;
	public String findPw(String id,String name,String birth,String email,String answer) throws SQLException;
	public void updatePw(String pw,String id) throws SQLException; //��й�ȣ ����
	//������ 
	public int updateInfo(UserVo bean) throws SQLException;
}

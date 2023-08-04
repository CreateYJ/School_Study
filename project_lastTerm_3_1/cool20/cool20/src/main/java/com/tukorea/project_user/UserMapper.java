package com.tukorea.project_user;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface UserMapper {
	@Select
	("SELECT * FROM project_user WHERE username = #{username} AND password = #{password}")
	User loginProcess(@Param("username")String username, @Param("password")String password);
	
	@Insert("INSERT INTO project_user (username, password, p_name, gender, birth, pnum, address_num, address_road, address_detail, created_at, updated_at) " +
	        "VALUES (#{username}, #{password}, #{p_name}, #{gender}, #{birth}, #{pnum}, #{address_num}, #{address_road}, #{address_detail}, #{created_at}, #{updated_at})")
	void registerUser(User user);
	
	@Select("SELECT * FROM project_user WHERE username = #{username}")
	User findUser(@Param("username") String username);

}

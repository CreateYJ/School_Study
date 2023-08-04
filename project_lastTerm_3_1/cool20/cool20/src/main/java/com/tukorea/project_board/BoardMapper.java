package com.tukorea.project_board;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.tukorea.project_user.User;


@Mapper
public interface BoardMapper {
	
	@Select
	("SELECT board_seq, CASE WHEN LENGTH(title) <= 10 THEN title ELSE CONCAT(SUBSTRING(title, 1, 10), '...') END AS title, CASE WHEN LENGTH(contents) <= 100 THEN contents ELSE CONCAT(SUBSTRING(contents, 1, 100), '...') END AS contents, writer, hits FROM project_board")
	List<Board> showAllboard();
	
	@Select
	("SELECT * FROM project_board WHERE board_seq = #{board_seq}")
	Board findboard(@Param("board_seq") Integer board_seq);
	
	@Insert
	("INSERT INTO project_board (title, writer, password, contents) " +
	        "VALUES (#{title}, #{writer}, #{password}, #{contents})")
	void insertBoard(Board board);

	@Delete
	("DELETE FROM project_board WHERE board_seq = #{board_seq}")
	void deleteBoard(Integer board_seq);
	
	
	@Update
	("UPDATE project_board SET title = #{title}, writer = #{writer}, password = #{password}, " +
	        "contents = #{contents} " + "WHERE board_seq = #{board_seq}")
	void updateBoard(Board board);


}

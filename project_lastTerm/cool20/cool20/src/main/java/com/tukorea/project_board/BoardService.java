package com.tukorea.project_board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tukorea.project_user.User;

@Service
public class BoardService {
	private final BoardMapper boardMapper;
	
	@Autowired
	public BoardService(BoardMapper boardMapper) {this.boardMapper = boardMapper;}
	
	public 	List<Board> showAllboard(){
		System.out.println(boardMapper.showAllboard());
		return boardMapper.showAllboard();
	}
	
	public Board findboard(Integer board_seq) {
		return boardMapper.findboard(board_seq);
	}
	
	public void deleteBoard(Integer board_seq) {
	    boardMapper.deleteBoard(board_seq);
	}

	public void updateBoard(Board board) {
		boardMapper.updateBoard(board);
	}
	
	public void insertBoard(Board board){
		boardMapper.insertBoard(board);
	}
}

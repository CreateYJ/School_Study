package com.tukorea.project_board;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class BoardController {
    private final BoardService boardService;

    public BoardController(BoardService boardService) {
        this.boardService = boardService;
    }

    @GetMapping("/board/board_list")
    public String showBoardList(Model model) {
        List<Board> boardList = boardService.showAllboard();
        model.addAttribute("boardList", boardList);
        return "board/board_list";
    }

    @GetMapping("/board_edit/{board_seq}")
    public String showEditForm(@PathVariable Integer board_seq, Model model) {
        Board board = boardService.findboard(board_seq);
        model.addAttribute("board", board);
        return "board/board_edit";
    }

    @PostMapping("/board_edit/{board_seq}")
    public String updateBoard(@PathVariable("board_seq") int boardSeq, Board board) {
        boardService.updateBoard(board);
        return "redirect:/board/board_list";
    }
    
    @GetMapping("/board_delete")
    public String deleteBoard(@RequestParam("board_seq") int boardSeq) {
        boardService.deleteBoard(boardSeq);
        return "redirect:/board/board_list";
    }
    
 // 글 작성 페이지를 보여주는 요청 처리
    @GetMapping("/board/board_create")
    public String showCreateForm() {
        return "board/board_create"; // board_create.jsp로 이동
    }
    @PostMapping("/board_create")
    public String insertBoard(Board board) {
        boardService.insertBoard(board);
        return "redirect:/board/board_list";
    }
    
    @GetMapping("/board_detail/{board_seq}")
    public String showBoardDetail(@PathVariable Integer board_seq, Model model) {
        Board board = boardService.findboard(board_seq);
        model.addAttribute("board", board);
        return "board/board_detail";
    }
    
   
    
}
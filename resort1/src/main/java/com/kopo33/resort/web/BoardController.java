package com.kopo33.resort.web;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kopo33.resort.dao.BoardItemRepository;
import com.kopo33.resort.domain.BoardItem;

import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping(value = "/resort1")
public class BoardController {

	@Autowired
	private BoardItemRepository boardItemRepository;

	// 리스트 보기
	@GetMapping("/resortBoard_list")
	public String findAll(Model model, Pageable pageable,
			@RequestParam(value = "page", defaultValue = "0") Integer curPage) {
		int currentPage = curPage;
		if (currentPage < 0)
			currentPage = 0;

		PageRequest pageRequest = PageRequest.of(currentPage, 10, Sort.by(Sort.Direction.DESC, "id"));
		Page<BoardItem> pages = boardItemRepository.findAll(pageRequest);
		model.addAttribute("pages", pages);

		// 페이지네이션 블록 리스트 동적 설정
		ArrayList<Integer> pageNumbers = new ArrayList<>();
		int totalPages = pages.getTotalPages(); // 총 페이지 수
		int startPage = currentPage / 10 * 10; // 시작 페이지 번호

		for (int i = startPage; i < Math.min(startPage + 10, totalPages); i++) {
			pageNumbers.add(i);
		}

		model.addAttribute("pageNumbers", pageNumbers);
		return "/board/resort/resortBoard_list";
	}

	// 검색 기능(첫번째 검색)
	@GetMapping("/resortBoard_search")
	public String search(Model model, Pageable pageable, @RequestParam("search") String search,
			HttpServletRequest req) {
		int curPage = 0;
		if (req.getParameter("page") == null) {
			curPage = 0;
		} else {
			curPage = Integer.parseInt(req.getParameter("page")) - 1;
		}
		if (curPage < 0)
			curPage = 0;
		Sort sort = Sort.by(Sort.Direction.DESC, "id");
		Pageable pageableWithSorting = PageRequest.of(curPage, 10, sort);

		Page<BoardItem> pages = boardItemRepository.findAllByTitleContaining(search, pageableWithSorting);
		model.addAttribute("pages", pages);
		model.addAttribute("search", search);

		// 페이지네이션 블록 리스트 동적 설정
		ArrayList<Integer> pageNumbers = new ArrayList<>();
		int totalPages = pages.getTotalPages(); // 총 페이지 수
		int startPage = curPage / 10 * 10; // 시작 페이지 번호

		for (int i = startPage; i < Math.min(startPage + 10, totalPages); i++) {
			pageNumbers.add(i);
		}

		model.addAttribute("pageNumbers", pageNumbers);
		return "/board/resort/resortBoard_search";
	}

	// 검색 기능(재검색)
	@GetMapping("/resortBoard_searchNext")
	public String searchNext(Model model, Pageable pageable, @RequestParam("search") String search,
			HttpServletRequest req) {
		int curPage = 0;
		if (req.getParameter("page") == null) {
			curPage = 0;
		} else {
			curPage = Integer.parseInt(req.getParameter("page"));
		}
		if (curPage < 0)
			curPage = 0;
		Sort sort = Sort.by(Sort.Direction.DESC, "id");
		Pageable pageableWithSorting = PageRequest.of(curPage, 10, sort);

		Page<BoardItem> pages = boardItemRepository.findAllByTitleContaining(search, pageableWithSorting);
		model.addAttribute("pages", pages);
		model.addAttribute("search", search);

		// 페이지네이션 블록 리스트 동적 설정
		ArrayList<Integer> pageNumbers = new ArrayList<>();
		int totalPages = pages.getTotalPages(); // 총 페이지 수
		int startPage = curPage / 10 * 10; // 시작 페이지 번호

		for (int i = startPage; i < Math.min(startPage + 10, totalPages); i++) {
			pageNumbers.add(i);
		}

		model.addAttribute("pageNumbers", pageNumbers);
		return "/board/resort/resortBoard_search";
	}

	// 글 보기
	@GetMapping("/resortBoard_view")
	public String view(Model model, @RequestParam("id") int id) {
		BoardItem item = boardItemRepository.findById((long) id).get();

		model.addAttribute("item", item);
		return "/board/resort/resortBoard_view";
	}

	// 게시물 작성 페이지 이동
	@GetMapping("/resortBoard_insert")
	public String insertItem(Model model) {
		String dfdate = new SimpleDateFormat("yyyy-MM-dd").format(new Date());

		model.addAttribute("date", dfdate);
		return "/board/resort/resortBoard_insert";
	}

	// 게시물 작성
	@PostMapping("/resortBoard_write")
	public String writeItem(Model model, @RequestParam("writer") String writer, @RequestParam("title") String title,
			@RequestParam("content") String content) {

		BoardItem resortBoardItem = new BoardItem();

		resortBoardItem.setWriter(writer);
		resortBoardItem.setTitle(title);
		resortBoardItem.setContent(content);

		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Date currentDate = new Date();
		String formattedDate = df.format(currentDate);
		java.sql.Date sqlDate = java.sql.Date.valueOf(formattedDate); // 문자열을 java.sql.Date로 변환
		resortBoardItem.setDate(sqlDate);

		boardItemRepository.save(resortBoardItem);
		return "redirect:/resort1/resortBoard_list";
	}

	// 게시물 삭제
	@GetMapping("/resortBoard_delete")
	public String deleteItem(Model model, @RequestParam("id") int id) {
		boardItemRepository.deleteById((long) id);

		return "redirect:/resort1/resortBoard_list";
	}

	// 게시물 수정(수정 페이지로 이동)
	@PostMapping("/resortBoard_updatepage")
	public String updatePageGo(Model model, @RequestParam("id") int id) {
		BoardItem resortBoardItem = boardItemRepository.findById((long) id).get();

		// 업데이트 날짜 수정(화면용)
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Date currentDate = new Date();
		String formattedDate = df.format(currentDate);
		java.sql.Date sqlDate = java.sql.Date.valueOf(formattedDate); // 문자열을 java.sql.Date로 변환
		resortBoardItem.setDate(sqlDate);

		model.addAttribute("item", resortBoardItem);
		return "/board/resort/resortBoard_update";
	}

	// 게시물 수정(수정)
	@PostMapping("/resortBoard_update")
	public String updateItem(Model model, @RequestParam("id") int id, @RequestParam("title") String title,
			@RequestParam("content") String content) {

		BoardItem resortBoardItem = boardItemRepository.findById((long) id).get();
		resortBoardItem.setTitle(title);
		resortBoardItem.setContent(content);

		// 업데이트 날짜 수정(db저장용)
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Date currentDate = new Date();
		String formattedDate = df.format(currentDate);
		java.sql.Date sqlDate = java.sql.Date.valueOf(formattedDate); // 문자열을 java.sql.Date로 변환
		resortBoardItem.setDate(sqlDate);

		boardItemRepository.save(resortBoardItem);
		return "redirect:/resort1/resortBoard_view?id=" + id;
	}

}

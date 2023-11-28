package com.kopo33.resort.web;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.kopo33.resort.dao.reservRepository;
import com.kopo33.resort.domain.Reservation;
import com.kopo33.resort.domain.User;
import com.kopo33.resort.service.UserService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping(value = "/resort1")
public class resortController {

	@Autowired
	private reservRepository reservRepository;

	@Autowired
	private UserService userService;

	@GetMapping("/")
	public String mainpage(Model model, @SessionAttribute(name = "userId", required = false) Long userId) {
		User loginUser = userService.getLoginUserById(userId);

		if (loginUser != null) {
			model.addAttribute("loginId", loginUser.getLoginId());
		} else {
			model.addAttribute("loginId", null); // 로그인되지 않은 상태를 나타내는 값
		}
		return "main";
	}

//	@GetMapping("/home")
//	public String homepage() {
//		return "main";
//	}

	@GetMapping("/introduce")
	public String introduce(Model model, @SessionAttribute(name = "userId", required = false) Long userId) {
		User loginUser = userService.getLoginUserById(userId);

		if (loginUser != null) {
			model.addAttribute("loginId", loginUser.getLoginId());
		} else {
			model.addAttribute("loginId", null); // 로그인되지 않은 상태를 나타내는 값
		}
		return "introduce";
	}

	@GetMapping("/around_01")
	public String aroundOne(Model model, @SessionAttribute(name = "userId", required = false) Long userId) {
		User loginUser = userService.getLoginUserById(userId);

		if (loginUser != null) {
			model.addAttribute("loginId", loginUser.getLoginId());
		} else {
			model.addAttribute("loginId", null); // 로그인되지 않은 상태를 나타내는 값
		}
		return "around_01";
	}

	@GetMapping("/around_02")
	public String aroundTwo(Model model, @SessionAttribute(name = "userId", required = false) Long userId) {
		User loginUser = userService.getLoginUserById(userId);

		if (loginUser != null) {
			model.addAttribute("loginId", loginUser.getLoginId());
		} else {
			model.addAttribute("loginId", null); // 로그인되지 않은 상태를 나타내는 값
		}
		return "around_02";
	}

	@GetMapping("/around_03")
	public String aroundThree(Model model, @SessionAttribute(name = "userId", required = false) Long userId) {
		User loginUser = userService.getLoginUserById(userId);

		if (loginUser != null) {
			model.addAttribute("loginId", loginUser.getLoginId());
		} else {
			model.addAttribute("loginId", null); // 로그인되지 않은 상태를 나타내는 값
		}
		return "around_03";
	}

	@GetMapping("/room1")
	public String room1(Model model, @SessionAttribute(name = "userId", required = false) Long userId) {
		User loginUser = userService.getLoginUserById(userId);

		if (loginUser != null) {
			model.addAttribute("loginId", loginUser.getLoginId());
		} else {
			model.addAttribute("loginId", null); // 로그인되지 않은 상태를 나타내는 값
		}
		return "room1";
	}

	@GetMapping("/room2")
	public String room2(Model model, @SessionAttribute(name = "userId", required = false) Long userId) {
		User loginUser = userService.getLoginUserById(userId);

		if (loginUser != null) {
			model.addAttribute("loginId", loginUser.getLoginId());
		} else {
			model.addAttribute("loginId", null); // 로그인되지 않은 상태를 나타내는 값
		}
		return "room2";
	}

	@GetMapping("/room3")
	public String room3(Model model, @SessionAttribute(name = "userId", required = false) Long userId) {
		User loginUser = userService.getLoginUserById(userId);

		if (loginUser != null) {
			model.addAttribute("loginId", loginUser.getLoginId());
		} else {
			model.addAttribute("loginId", null); // 로그인되지 않은 상태를 나타내는 값
		}
		return "room3";
	}

	@GetMapping("/place")
	public String place(Model model, @SessionAttribute(name = "userId", required = false) Long userId) {
		User loginUser = userService.getLoginUserById(userId);

		if (loginUser != null) {
			model.addAttribute("loginId", loginUser.getLoginId());
		} else {
			model.addAttribute("loginId", null); // 로그인되지 않은 상태를 나타내는 값
		}
		return "place";
	}

	// 예약하기(현황 확인)
	@RequestMapping("/calendar")
	public String showCalendar(Model model, @SessionAttribute(name = "userId", required = false) Long userId) {
		User loginUser = userService.getLoginUserById(userId);

		if (loginUser == null) {
			model.addAttribute("loginId", null); // 로그인되지 않은 상태를 나타내는 값
			model.addAttribute("message", "먼저 로그인 해주세요!");

			return "/adm_login";
		} else {
			model.addAttribute("loginId", loginUser.getLoginId());

			Calendar cal = Calendar.getInstance(); // 현재 날짜 불러오기
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");

			String[] set = null; // 해당 날짜 세트로 만들어서 배열 완성
			List<String[]> sets = new ArrayList<>(); // 여러 개의 set을 담는 리스트

			for (int i = 0; i < 30; i++) { // 화면에 30개씩 출력
				Date date = cal.getTime();
				List<Reservation> reservlist = reservRepository.findAllByDate(df.format(date)); // 해당 날짜와 연관된 예약 데이터 확인

				set = new String[4]; // 초기화
				set[0] = df.format(date); // 예약일
				set[1] = "예약가능"; // 1호실
				set[2] = "예약가능"; // 2호실
				set[3] = "예약가능"; // 3호실

				for (int j = 0; j < reservlist.size(); j++) {
					Reservation reserv = reservlist.get(j);
					if (reserv.getRoom() == 101 && reserv.getName() != null) {
						set[1] = "예약마감";
					}
					if (reserv.getRoom() == 102 && reserv.getName() != null) {
						set[2] = "예약마감";
					}
					if (reserv.getRoom() == 103 && reserv.getName() != null) {
						set[3] = "예약마감";
					}
				}
				sets.add(set); // 리스트에 set 추가
				cal.add(Calendar.DAY_OF_MONTH, 1); // 다음 날짜로 설정
			}

			model.addAttribute("sets", sets); // view에 뿌리기

			return "/calendar";
		}
	}

	// 예약하기(예약하기 페이지 들어가기)
	@GetMapping("/cal_insert")
	public String calendar_insert(Model model, HttpServletRequest req, @SessionAttribute(name = "userId", required = false) Long userId) {
		User loginUser = userService.getLoginUserById(userId);

		String date = req.getParameter("date");
		String roomType = req.getParameter("room").replace("'", ""); // 따옴표 제거

		model.addAttribute("Date", date);
		model.addAttribute("roomType", roomType);
		model.addAttribute("name", loginUser.getName());
		model.addAttribute("loginId", loginUser.getLoginId());
		return "/reserv_insert";
	}

	// 예약하기(예약하기)
	@PostMapping("/reserv_insert")
	public String reservation_insert(Model model, HttpServletRequest req) {
		String date = req.getParameter("date"); // 날짜
		String roomType = req.getParameter("room").replace("'", ""); // 따옴표 제거
		int roomNumber = 0;
		if (roomType.equals("1호실"))
			roomNumber = 101;
		else if (roomType.equals("2호실"))
			roomNumber = 102;
		else if (roomType.equals("3호실"))
			roomNumber = 103;
		String name = req.getParameter("name"); // 예약자명
		String tel = req.getParameter("tel"); // 예약자명
		String email = req.getParameter("email"); // 예약자명
		String depname = req.getParameter("depname"); // 입금자명
		String comment = req.getParameter("comment"); // 날짜

		Reservation reservation = new Reservation();
		reservation.setDate(date);
		reservation.setRoom(roomNumber);
		reservation.setName(name);
		reservation.setTel(tel);
		reservation.setEmail(email);
		reservation.setDepname(depname);
		reservation.setComment(comment);

		reservation.setProcessing(1);
		LocalDateTime currentDateTime = LocalDateTime.now();
		reservation.setRegdate(currentDateTime);

		reservRepository.save(reservation);
		return "redirect:/resort1/calendar";
	}

	// 예약체크
		@GetMapping("/check")
		public String reservation_check(Model model, @SessionAttribute(name = "userId", required = false) Long userId) {

			User loginUser = userService.getLoginUserById(userId);
			
			if (loginUser != null) {
				model.addAttribute("loginId", loginUser.getLoginId());
				String name = loginUser.getName();

				List<Reservation> reservations = reservRepository.findByName(name);
				model.addAttribute("reservations", reservations);

				return "/check";

			} else {
				model.addAttribute("loginId", null); // 로그인되지 않은 상태를 나타내는 값
				model.addAttribute("message", "로그인 후 이용해주세요!"); // 알림 메시지 추가

				return "/adm_login";
			}
		}
}

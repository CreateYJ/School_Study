package com.tukorea.homeController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
    @GetMapping("/") // 1. 슬래시(/) 뒤에 있는 URL에 있다면
    public String home() {
        return "home"; // 2. main_page.jsp 파일을 반환합니다. views 폴더에 있는 파일을 반환합니다.
    }
}
package org.zerock.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

//<div class="boardTitle">
//<!-- 게시판 제목 -->
//<h3> T i t l e </h3>
//</div>
//
//<!-- 게시판 목록  -->
//<div class="boardList">
//<table>
//    <thead>
//        <tr>
//            <th class="th_no">No</th>
//            <th class="th_title">제목</th>
//            <th class="th_writer">작성자</th>
//            <th class="th_date">작성일</th>
//        </tr>
//    </thead>
//    <!-- 게시물이 출력될 영역 -->
//    <tbody>
//        <tr>
//            <td>1</td>
//            <td><a href="#">제목입니당</a></td>
//            <td>나</td>
//            <td>2020.02.23</td>
//        </tr>
//        <tr>
//            <td>2</td>
//            <td><a href="#">제목입니당</a></td>
//            <td>나</td>
//            <td>2020.02.23</td>
//        </tr>
//        <tr>
//            <td>3</td>
//            <td><a href="#">제목입니당</a></td>
//            <td>나</td>
//            <td>2020.02.23</td>
//        </tr>
//    </tbody>
//</table>
//</div>
//
//
//<!-- 글쓰기 -->
//<div class="bo_register">
//    <a href="#" class="pg_regi"><span class="material-icons">
//        create
//        </span>글쓰기</a>
//</div>
//
//<!-- 페이징  -->
//<div class="bo_pages">
//<nav class="pg_wrap">
//    <span class="pg">
//        <strong class="pg_current">1</strong>
//        <a href="#" class="pg_page">2</a>
//        <a href="#" class="pg_page pg_end">맨끝</a>
//    </span></nav>
//</div>
//
//
//<!-- 검색창 { -->
//<div class="bo_search">
//<form name="fsearch" method="get">
//    <input type="hidden" name="bo_table" value="mo_board1">
//    <input type="hidden" name="sca" value="">
//    <input type="hidden" name="sop" value="and">
//    <div class="bo_searchBox">
//        <select name="sfl" id="sfl" class="s21_view01_se">
//            <option value="wr_subject">제목</option>
//            <option value="wr_content">내용</option>
//            <option value="wr_subject||wr_content">제목+내용</option>
//            <!-- <option value="mb_id,1">회원아이디</option>
//<option value="mb_id,0">회원아이디(코)</option> -->
//            <option value="wr_name,1">글쓴이</option>
//            <!-- <option value="wr_name,0">글쓴이(코)</option> -->
//        </select>
//        <input type="text" name="stx" value="" required id="stx" class="s21_view01_in"
//            placeholder="검색어를 입력하세요.">
//        <button type="button"><span class="material-icons">
//            search
//            </span></button> 
//    </div>
//</form>
//</div>
//<!--  } 검색창 end -->



/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	
}

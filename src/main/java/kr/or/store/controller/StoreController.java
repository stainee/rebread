package kr.or.store.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.member.model.vo.Member;
import kr.or.store.model.service.StoreService;
import kr.or.store.model.vo.Store;
import kr.or.store.model.vo.StoreFileVO;

@Controller
public class StoreController {

	@Autowired
	private StoreService sservice;
	
	@ResponseBody
	@RequestMapping(value="/storeUpdate.do", produces = "application/json;charset=utf-8")
	public void storeUpdate(Store s) {
		int result = sservice.updateStoreDetail(s);
	}
	
	// ceoStoreInfo 이동 (가게 정보)
	@RequestMapping(value="/ceoStoreInfo.do")
	public String ceoStoreInfo(Model model, HttpSession session){	
		Member member = (Member)session.getAttribute("m");
//		System.out.println(member.getMemberNo());
		ArrayList<Store> list = sservice.selectMemberStore(member);
		model.addAttribute("list",list);
		return "store/ceoStoreInfo";
	}
	
	@RequestMapping(value = "/storeInsert.do")
	public String storeInsert(Store s) {
//		ArrayList<StoreFileVO> storeFileList = new ArrayList<StoreFileVO>();
//		if(!boardFile[0].isEmpty()) {
//			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/board/");
//			for(MultipartFile file : boardFile) {
//				String filename = file.getOriginalFilename();
//				String filepath = fileRename.fileRename(savePath, filename);
//				
//				FileOutputStream fos;
//				try {
//					fos = new FileOutputStream(new File(savePath+filepath));
//					BufferedOutputStream bos = new BufferedOutputStream(fos);
//					byte[] bytes = file.getBytes();
//					bos.write(bytes);
//					bos.close();
//				} catch (FileNotFoundException e) {
//					// TODO Auto-generated catch block
//					e.printStackTrace();
//				} catch (IOException e) {
//					// TODO Auto-generated catch block
//					e.printStackTrace();
//				}
//				// 파일 업로드 끝(파일 1개 업로드)
//				FileVO fv = new FileVO();
//				fv.setFilename(filename);
//				fv.setFilepath(filepath);
//				fileList.add(fv);
//			}
//		}
//		b.setFileList(fileList);
		
		int result = sservice.insertStore(s);
		if(result>0) {
			return "redirect:/";
		}else {
			return "store/ceoStoreInfo";
		}
	}
	
	// 가게 정보 페이징 처리
//	@RequestMapping(value = "/storeInfoList.do")
//	public String storeInfoList(int reqPage, Model model) {
//		StorePageData spd = sservice.selectStoreList(reqPage);
//		model.addAttribute("list",spd.getList());
//		model.addAttribute("pageNavi",spd.getPageNavi());
//		model.addAttribute("reqPage",spd.getReqPage());
//		model.addAttribute("numPerPage",spd.getNumPerPage());
//		return "store/ceoStoreInfo";
//	}
		
	// 가게 정보 수정창으로 이동
	@RequestMapping(value = "/storeInfoUpdate.do")
	public String storeInfoUpdate(Store s, Model model) {
		Store store = sservice.updateStore(s);
		model.addAttribute("s",store);		
		return "store/storeInfoUpdate";
	}
	
	@RequestMapping(value = "/storeInfoUpdateSuccess")
	public String storeInfoUpdateSuccess(Store s) {
		Store store = sservice.updateStore(s);
		return "store/storeInfoUpdate";
	}
	
	
	// ceoStoreSalesInfo 이동 (판매 정보 관리)
	@RequestMapping(value="/ceoStoreSalesInfo.do")
	public String ceoStoreSalesInfo() {
		return "/store/ceoStoreSalesInfo";
	}
	
}

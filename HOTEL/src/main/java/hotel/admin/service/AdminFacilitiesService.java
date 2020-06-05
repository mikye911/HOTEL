package hotel.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;


@Service("AdminFacilitiesService")
public interface AdminFacilitiesService {
	
	//리스트
	List<Map<String, Object>> selectFacList(Map<String, Object> map) throws Exception;
	
	//등록
	void insertFacilities (Map<String, Object> map) throws Exception;
	
	//상세보기
	Map<String, Object> adminFacDetail(Map<String, Object> map) throws Exception;
}

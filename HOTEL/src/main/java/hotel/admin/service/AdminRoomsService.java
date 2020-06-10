package hotel.admin.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import hotel.common.common.CommandMap;

public interface AdminRoomsService {

	List<Map<String, Object>> selectRoomsList(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> selectRoomType(Map<String, Object> map) throws Exception;
	
	void insertNewRoom (Map<String, Object> map, HttpServletRequest request) throws Exception;
	 /* 
	 * void updateBoard(Map<String, Object> map) throws Exception;
	 * 
	 * void deleteBoard(Map<String, Object> map) throws Exception;
	 */

}

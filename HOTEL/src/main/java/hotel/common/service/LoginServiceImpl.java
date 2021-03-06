package hotel.common.service;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import hotel.common.dao.LoginDAO;

@Service("LoginService")
public class LoginServiceImpl implements LoginService{
	Logger log = Logger.getLogger(this.getClass());


	@Resource(name="LoginDAO")
	private LoginDAO loginDAO;
	
	// org.springframework.mail.javamail.JavaMailSender
    private JavaMailSender javaMailSender;
 
    public void setJavaMailSender(JavaMailSender javaMailSender) {
        this.javaMailSender = javaMailSender;
    } 
	/*
	 * @Override public List<Map<String, Object>> selectBoardList(Map<String,
	 * Object> map) throws Exception { return sampleDAO.selectBoardList(map);
	 * 
	 * }
	 */

	@Override
	public Map<String, Object> selectLogin(Map<String, Object> map) throws Exception {
		Map<String, Object> resultMap = loginDAO.selectLogin(map);
		
		return resultMap;
	}

	@Override
	public Map<String, Object> selectSearchMyId(Map<String, Object> map) throws Exception {
		Map<String, Object> resultMap = loginDAO.selectSearchMyId(map);
		
		return resultMap;
	}

	@Override
	public String findPwd(Map<String, Object> map) throws Exception {
		
		return loginDAO.findPwd(map);
	}

	@Override
	public void updatePwd(Map<String, Object> map) throws Exception {
		loginDAO.updatePwd(map);
	}

	@Override
	public boolean send(String subject, String text, String from, String to, String filePath) {
		// javax.mail.internet.MimeMessage
        MimeMessage message = javaMailSender.createMimeMessage();
 
        try {
            // org.springframework.mail.javamail.MimeMessageHelper
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
            helper.setSubject(subject);
            helper.setText(text, true);
            helper.setFrom(from);
            helper.setTo(to);
 
          
            if (filePath != null) {
                File file = new File(filePath);
                if (file.exists()) {
                    helper.addAttachment(file.getName(), new File(filePath));
                }
            }
 
            javaMailSender.send(message);
            return true;
        } catch (MessagingException e) {
            e.printStackTrace();
        }
        return false;
	}

	

	/*
	 * @Override public Map<String, Object> selectBoardDetail(Map<String, Object> map) throws Exception {
	 *  sampleDAO.updateHitCnt(map); 
	 *  Map<String, Object> resultMap = sampleDAO.selectBoardDetail(map); 
	 *  
	 *  return resultMap; 
	 *  }
	 * 
	 * @Override public void updateBoard(Map<String, Object> map) throws Exception{
	 * sampleDAO.updateBoard(map); }
	 * 
	 * @Override public void deleteBoard(Map<String, Object> map) throws Exception {
	 * sampleDAO.deleteBoard(map); }
	 */

}

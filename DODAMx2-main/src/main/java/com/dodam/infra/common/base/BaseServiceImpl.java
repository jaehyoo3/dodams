package com.dodam.infra.common.base;

import java.security.SecureRandom;
import java.util.Date;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Service;

@Service
public class BaseServiceImpl {
	
	@Autowired   //context-mail에서 빈 등록했기 때문에 주입받을 수 있다. Spring에서 제공하는 MailSender. 
    private JavaMailSenderImpl mailSender;
    
    
    private String getKey(int size,int dupCd) {
    	 Random rand = new Random();
         String numStr = ""; //난수가 저장될 변수
         for(int i=0;i<size;i++) {
             //0~9 까지 난수 생성
             String ran = Integer.toString(rand.nextInt(10));
             if(dupCd==1) {
                 //중복 허용시 numStr에 append
                 numStr += ran;
             }else if(dupCd==2) {
                 //중복을 허용하지 않을시 중복된 값이 있는지 검사한다
                 if(!numStr.contains(ran)) {
                     //중복된 값이 없으면 numStr에 append
                     numStr += ran;
                 }else {
                     //생성된 난수가 중복되면 루틴을 다시 실행한다
                     i-=1;
                 }
             }
         }
         return numStr;
    }
    
    public String getRamdomPassword(int size) {
        char[] charSet = new char[] {
                '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
                'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
                'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
                '!', '@', '#', '$', '%', '^', '&' };

        StringBuffer sb = new StringBuffer();
        SecureRandom sr = new SecureRandom();
        sr.setSeed(new Date().getTime());

        int idx = 0;
        int len = charSet.length;
        for (int i=0; i<size; i++) {
            // idx = (int) (len * Math.random());
            idx = sr.nextInt(len);    // 강력한 난수를 발생시키기 위해 SecureRandom을 사용한다.
            sb.append(charSet[idx]);
        }

        return sb.toString();
    }
    public String sendAuthMail(String mail) throws MessagingException{
        String authKey = getKey(6,2);
        MimeMessage mailMessage = mailSender.createMimeMessage();
        String mailContent = "인증번호:   "+authKey ;     //보낼 메시지 
            mailMessage.setSubject("인증번호 발급(DoDamX2)", "utf-8"); //메일 제목설정
            mailMessage.setText(mailContent, "utf-8", "html");  //메일 내용 설정
			mailMessage.addRecipient(Message.RecipientType.TO,new InternetAddress(mail));
            mailSender.send(mailMessage);
            System.out.println("___________________________________________________________");
            System.out.println("authKey: " + authKey);
            System.out.println("mail: " + mail);
          return authKey;
    }
    
    public String sendPw(String mail) throws MessagingException{
        String authKey = getRamdomPassword(8);
        MimeMessage mailMessage = mailSender.createMimeMessage();
        String mailContent = "변경된 비밀번호: "+authKey ;     //보낼 메시지 
            mailMessage.setSubject("임시비밀번호 발급(DoDamX2)", "utf-8"); 
            mailMessage.setText(mailContent, "utf-8", "html");  
            mailMessage.addRecipient(Message.RecipientType.TO,new InternetAddress(mail));
            mailSender.send(mailMessage);
            System.out.println("___________________________________________________________");
            System.out.println("authKey: " + authKey);
            System.out.println("mail: " + mail);
          return authKey;
    }

}

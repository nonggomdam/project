package com.spring_boot_dolls_ticket.project.service;

import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Map;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.stereotype.Service;

import com.spring_boot_dolls_ticket.project.model.TransferEmailMessageVO;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;

@Service
@EnableAsync
public class TransferEmailService {

	@Autowired
	private JavaMailSender javaMailSender;

	private final ScheduledExecutorService scheduler = Executors.newScheduledThreadPool(1);
	
	//스케줄링방식
	@Async("mailExecutor")
	public void scheduleEmailAsync(TransferEmailMessageVO emailMessage) {
		
		scheduler.schedule(() -> {
	         send(emailMessage); 
	    }, 60, TimeUnit.SECONDS);
		
	}
	
	//다이렉트로보내는방식
	@Async("mailExecutor")
	public void send(TransferEmailMessageVO emailMessage) {
		
		sendMail(emailMessage);
		
	}
	
    // 이메일 템플릿 로드 메서드
    public String loadTemplate(String filePath) throws Exception {
        return new String(Files.readAllBytes(Paths.get(filePath)), "UTF-8");
    }

    // 템플릿에 데이터를 삽입하는 메서드
    public String renderTemplate(String templateContent, Map<String, String> parameters) {
        for (Map.Entry<String, String> entry : parameters.entrySet()) {
            templateContent = templateContent.replace("${" + entry.getKey() + "}", entry.getValue());
        }
        return templateContent;
    }
	
	private void sendMail(TransferEmailMessageVO emailMessage) {
		MimeMessage mimeMessage = javaMailSender.createMimeMessage();
		
		try {
			MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage, false, "UTF-8");
			mimeMessageHelper.setTo(emailMessage.getTo());
			mimeMessageHelper.setSubject(emailMessage.getSubject());
			mimeMessageHelper.setText(emailMessage.getMessage(), true);
			javaMailSender.send(mimeMessage);
			System.out.printf("sent email : %s \n", emailMessage.getMessage());
		} catch (MessagingException e) {
			System.out.printf("failed to send email %s \n", e);
		}
	}
	
	

}

package com.spring_boot_dolls_ticket.project.common;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.UUID;
import java.security.SecureRandom;

public class TransOrderNumGen {
    private static final SecureRandom secureRandom = new SecureRandom();
    private static final String ALPHABET = "ABCDEFGHIJKLMNPQRSTUVWXYZ123456789"; // O,0 제외
    private static final String NATURAL_NUM = "123456789"; // O,0 제외
    private static final String NUM = "0123456789";  
    
    /**
     * 타임스탬프 + 랜덤문자열 조합 방식
     */
    public static String generateOrderNumber(int length) {
        // 날짜시간 부분 (예: 24110218 = 2024년 11월 02일 18시)
        String timestamp = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyMMddHH"));
        
        
        StringBuilder randomPart = new StringBuilder();
        for (int i = 0; i < length-8 ; i++) {
            int index = secureRandom.nextInt(NUM.length());
            randomPart.append(NUM.charAt(index));
        }
        
        return timestamp + randomPart.toString();
    }
    
    public static String generateReservationId(int length) { 
        
        StringBuilder randomPart = new StringBuilder();
        for (int i = 0; i < length; i++) {
            int index = secureRandom.nextInt(NUM.length());
            randomPart.append(NUM.charAt(index));
        }
        
        return  randomPart.toString();
    }
    
    /**
     * UUID 기반 방식
     */
    public static String generateUuidBasedNumber() {
        String uuid = UUID.randomUUID().toString().replaceAll("-", "");
        return uuid.substring(0, 12).toUpperCase(); // 앞 12자리만 사용
    }
    
    /**
     * 시퀀스 넘버를 Base62로 인코딩하는 방식
     */
    public static String encodeSequential(long sequenceNumber) {
        // 시퀀스 앞에 타임스탬프 추가
        String prefix = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyMMdd"));
        return prefix + base62Encode(sequenceNumber);
    }
    
    private static String base62Encode(long value) {
        if (value == 0) return String.valueOf(ALPHABET.charAt(0));
        
        StringBuilder sb = new StringBuilder();
        while (value > 0) {
            sb.append(ALPHABET.charAt((int)(value % ALPHABET.length())));
            value /= ALPHABET.length();
        }
        return sb.reverse().toString();
    }
}
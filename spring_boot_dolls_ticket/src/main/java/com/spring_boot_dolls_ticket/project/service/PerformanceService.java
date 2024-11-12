package com.spring_boot_dolls_ticket.project.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.spring_boot_dolls_ticket.project.dao.IPerformanceDAO;
import com.spring_boot_dolls_ticket.project.model.PerformanceScheduleVO;
import com.spring_boot_dolls_ticket.project.model.PerformanceSeatVO;
import com.spring_boot_dolls_ticket.project.model.PerformanceVO;
import com.spring_boot_dolls_ticket.project.model.ReservationVO;

@Service
public class PerformanceService implements IPerformanceService {
	
	@Autowired
	@Qualifier("IPerformanceDAO")
	IPerformanceDAO dao;
	
	// application.properties에서 file.upload.dir=본인 프로젝트 내 resources/static/image 절대 경로 입력
	@Value("${file.upload.dir}")
	private String imgUploadPath;

	public PerformanceVO detailViewPerformance(String performanceId) {
		// TODO Auto-generated method stub
		return dao.detailViewPerformance(performanceId);
	}


	@Override
	public PerformanceVO getEventById(String performanceId) {
		// TODO Auto-generated method stub
		return dao.getEventById(performanceId);
	}
	@Override
	public ArrayList<PerformanceVO> listAllPerformance() {
		return dao.listAllPerformance();
	}
	// 공연 정보 수정 및 이미지 업데이트
	@Override
    public void updatePerformance(PerformanceVO performance, MultipartFile performancePoster, MultipartFile performanceInfoImg) throws IOException {
		
		String performanceId = performance.getPerformanceId();
		
		// 1. 기존 경로 가져오기
		String oldPosterPath = performance.getPerformanceImagePath();
		String oldInfoImgPath = performance.getPerformanceInformationImagePath();
		
		System.out.println(oldPosterPath);
		System.out.println(oldInfoImgPath);
		
		// 2. 새 파일 업로드 확인
		if (performancePoster != null && !performancePoster.isEmpty()) {
			String posterExtension = getFileExtension(performancePoster);
			String newPosterPath = performanceId + posterExtension;
			deleteFile(oldPosterPath);
			saveFile(performancePoster, newPosterPath);
			performance.setPerformanceImagePath(newPosterPath);
			System.out.println("새 이미지 경로 : " + newPosterPath);
		} else {
			performance.setPerformanceImagePath(oldPosterPath);
			System.out.println("기존 이미지 경로 : " + oldPosterPath);
		}
		
		if (performanceInfoImg != null && !performanceInfoImg.isEmpty()) {
			String infoImgExtension = getFileExtension(performanceInfoImg);
			String newInfoImgPath = performanceId + "_info" + infoImgExtension;
			deleteFile(oldInfoImgPath);
			saveFile(performanceInfoImg, newInfoImgPath);
			performance.setPerformanceInformationImagePath(newInfoImgPath);
			System.out.println("새 이미지 경로 : " + newInfoImgPath);
		} else {
			performance.setPerformanceInformationImagePath(oldInfoImgPath);
			System.out.println("기존 이미지 경로 : " + oldInfoImgPath);
		}
		
		// 7. 이미지 경로 먼저 update
		dao.updateImgPath(performance);
		dao.updatePerformance(performance);
		dao.deletePerformanceSchedulesByPerformanceId(performanceId);
		insertPerformanceSchedule(performance);
		
    }
	@Override
	public void deletePerformance(String performanceId) {
		dao.deletePerformanceSchedulesByPerformanceId(performanceId);
		dao.deletePerformance(performanceId);
	}
	// 공연 정보 등록 및 이미지 경로 설정
	@Override
	//@Transactional(propagation = Propagation.REQUIRES_NEW)
    public void insertPerformance(PerformanceVO performance, MultipartFile performancePoster, MultipartFile performanceInfoImg) throws IOException {
        // 공연 정보 삽입 -> 삽입 후 performanceId가 자동으로 설정됨
        dao.insertPerformance(performance);
        String generatedId = dao.selectGeneratedId();
        performance.setPerformanceId(generatedId);
        
        // ID가 제대로 생성되었는지 확인하는 디버깅 코드
        System.out.println("Generated PERFORMANCE_ID: " + performance.getPerformanceId());

        // 파일 확장자 추출 메서드 호출
        String posterExtension = getFileExtension(performancePoster);
        String infoImgExtension = getFileExtension(performanceInfoImg);
        
        System.out.println(posterExtension);
        System.out.println(infoImgExtension);
        
        // 생성된 performanceId로 이미지 경로 생성
        String posterPath = generatedId + posterExtension;
        String infoImgPath = generatedId + "_info" + infoImgExtension;
        
        System.out.println(posterPath);
        System.out.println(infoImgPath);

        // 이미지 경로 VO에 설정
        performance.setPerformanceImagePath(posterPath);
        performance.setPerformanceInformationImagePath(infoImgPath);

        // 이미지 파일 저장
        saveFile(performancePoster, posterPath);
        saveFile(performanceInfoImg, infoImgPath);
        
        // 이미지 경로를 DB에 업데이트
        dao.updateImgPath(performance);
        
        // 스케줄 테이블에 공연 ID, 공연장 ID, 공연 일시 삽입
        //insertPerformanceSchedule(performance);
    }
	// 파일 삭제 메서드
    private void deleteFile(String filePath) {
        File file = new File(imgUploadPath + filePath);
        if (file.exists()) {
            if (file.delete()) {
                System.out.println("파일 삭제 성공: " + filePath);
            } else {
                System.out.println("파일 삭제 실패: " + filePath);
            }
        } else {
            System.out.println("파일이 존재하지 않음: " + filePath);
        }
    }
    private String getFileExtension(MultipartFile file) {
    	String fileName = file.getOriginalFilename();
        String extension = fileName.substring(fileName.lastIndexOf("."));
        return extension;
	}
    // 파일 저장 메서드
    private void saveFile(MultipartFile file, String filePath) throws IOException {
        if (!file.isEmpty()) {
            Path path = Paths.get(imgUploadPath + filePath);
            Files.copy(file.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);
        }
    }
    // 이미지 경로를 DB에 업데이트
    public void updateImgPath(PerformanceVO performance) {
        dao.updateImgPath(performance);
    }

	@Override
	public List<PerformanceVO> selectPerformance() {
		// TODO Auto-generated method stub
		return dao.selectPerformance();
	}


	@Override
	public List<PerformanceScheduleVO> selectPerformanceDate(String performanceId) {
		// TODO Auto-generated method stub
		return dao.selectPerformanceDate(performanceId);
	}


	@Override
	public List<PerformanceSeatVO> selectPerformanceSeatInfoList(PerformanceSeatVO performanceSeatVO) {
		// TODO Auto-generated method stub
		return dao.selectPerformanceSeatInfoList(performanceSeatVO);
	}


	@Override
	public List<PerformanceVO> getRankedPerformances() {
		return dao.getRankedPerformances();
	}
	
	@Transactional
	public void incrementClickCount(String performanceId) {
	    System.out.println("서비스 메서드 호출됨: " + performanceId); // 로그 추가
	    dao.incrementClickCount(performanceId);
	}


	@Override
	public PerformanceSeatVO selectPerformanceSeatInfo(PerformanceSeatVO performanceSeatVO) {
		// TODO Auto-generated method stub
		return dao.selectPerformanceSeatInfo(performanceSeatVO);
	}


	@Override
	public int insertReservationInfo(ReservationVO reservationVO) {
		// TODO Auto-generated method stub
		return dao.insertReservationInfo(reservationVO);
	}


	@Override
	public ArrayList<PerformanceSeatVO> locationList() {
		return dao.locationList();
	}

	@Override
	public PerformanceSeatVO getLocation(String performanceLocationId) {
		return dao.getLocation(performanceLocationId);
	}

	private void insertPerformanceSchedule(PerformanceVO performance) {
	    PerformanceScheduleVO schedule1 = new PerformanceScheduleVO();
	    schedule1.setPerformanceId(performance.getPerformanceId());
	    schedule1.setPerformanceLocationId(performance.getPerformanceLocationId());
	    schedule1.setPerformanceDate(performance.getPerformanceDate1());
	    
	    PerformanceScheduleVO schedule2 = new PerformanceScheduleVO();
	    schedule2.setPerformanceId(performance.getPerformanceId());
	    schedule2.setPerformanceLocationId(performance.getPerformanceLocationId());
	    schedule2.setPerformanceDate(performance.getPerformanceDate2());

	    // 두 개의 스케줄 정보를 DB에 삽입
	    dao.insertPerformanceSchedule(schedule1);
	    dao.insertPerformanceSchedule(schedule2);
	}


	@Override
	public void insertPerformanceSchedule(PerformanceScheduleVO performanceScheduleVO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<PerformanceVO> selectRanking() {
		// TODO Auto-generated method stub
		return dao.selectRanking();
	}

}

package com.hmis.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.hmis.util.MediaUtils;
import com.hmis.util.UploadFileUtils;


@Controller
public class UploadController {
   
  private static final Logger logger = LoggerFactory.getLogger(UploadController.class);

  @Resource(name = "uploadPath")
  private String uploadPath;

  @RequestMapping(value = "/uploadForm", method = RequestMethod.GET)
  public void uploadForm() {
  }

  @RequestMapping(value = "/uploadForm", method = RequestMethod.POST)
  //파일업로드의 결과화면을 처리하고자 void 대신 String 리턴타입으로 설정
  public String uploadForm(MultipartFile file, Model model) throws Exception {

    logger.info("originalName: " + file.getOriginalFilename());
    logger.info("size: " + file.getSize());
    logger.info("contentType: " + file.getContentType());

    String savedName = uploadFile(file.getOriginalFilename(), file.getBytes());

    model.addAttribute("savedName", savedName);
    
    return "uploadResult";
  }

  @RequestMapping(value = "/uploadAjax", method = RequestMethod.GET)
  public void uploadAjax() {
  }
  
  /**
   * 업로드할 파일의 확장자를 검사하는 메소드
   * 
   * @param filepath
   * @return
   */
  public static boolean isImage(String filepath) {
     String[] extensions = { ".jpg", ".png", ".jpeg", ".JPG", ".PNG", ".JPEG" };
     for (String extension : extensions) {
        if (filepath.endsWith(extension)) {
         
           return true;
        }
     }
     return false;
  }
  
  private String uploadFile(String originalName, byte[] fileData) throws Exception {

	  //UUID 중복되지 않는 고유한 키 값 설정 (파일 업로드 이름 중복 예방)
	  UUID uid = UUID.randomUUID();

    String savedName = uid.toString() + "_" + originalName;

    File target = new File(uploadPath, savedName);

    FileCopyUtils.copy(fileData, target);

    return savedName;

  }
  
  //uploadAjax처리
  @ResponseBody 
  @RequestMapping(value ="/uploadAjax", method=RequestMethod.POST, produces = "text/plain;charset=UTF-8")
//@RequestMapping의 속성인 produces 속성 지정을 한국어로 전송하기 위한 설정
  public ResponseEntity<String> uploadAjax(MultipartFile file)throws Exception{
    
    logger.info("originalName: " + file.getOriginalFilename());
    
   
  
    
    return 
      new ResponseEntity<>(
    		  //UploadFileUtils를 사용
    		  UploadFileUtils.uploadFile(uploadPath,
    				  file.getOriginalFilename(),
    				  file.getBytes()),
    		  HttpStatus.CREATED);
      //ResponseEntity를 전송하는 부분에서 HttpStatus.CREATED 값을 지정해 리소스가 정상적으로 생겅되었다는 상태코드를 사용
  }

  
  @ResponseBody
  @RequestMapping("/displayFile")
  public ResponseEntity<byte[]>  displayFile(String fileName)throws Exception{
    
    InputStream in = null; 
    ResponseEntity<byte[]> entity = null;
    
    logger.info("FILE NAME: " + fileName);
    
    try{
      
      String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
      
      MediaType mType = MediaUtils.getMediaType(formatName);
      
      HttpHeaders headers = new HttpHeaders();
      
      in = new FileInputStream(uploadPath+fileName);
      
      if(mType != null){
               
        headers.setContentType(mType);
      }else{
        fileName = fileName.substring(fileName.indexOf("_")+1);  
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        headers.add("Content-Disposition", "attachment; filename=\""+ 
          new String(fileName.getBytes("UTF-8"), "ISO-8859-1")+"\"");
      }
       //실제 byte[] 데이터가 그대로 전송 @ResponseBody이용함
        entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), 
          headers, 
          HttpStatus.CREATED);
    }catch(Exception e){
      e.printStackTrace();
      entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
    }finally{
      in.close();
    }
      return entity;    
  }
    
  @ResponseBody
  @RequestMapping(value="/deleteFile", method=RequestMethod.POST)
  public ResponseEntity<String> deleteFile(String fileName){
    
    logger.info("delete file: "+ fileName);
    
  
    
    String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
    
    MediaType mType = MediaUtils.getMediaType(formatName);
    
    if(mType != null){      
      //fileName.substring(0,12)/년/월/일 경로 추출  
      //fileName.substring(14) 파일 이름앞의 's_'제거
      String front = fileName.substring(0,12);
      String end = fileName.substring(14);
      new File(uploadPath + (front+end).replace('/', File.separatorChar)).delete();
    }
    
    new File(uploadPath + fileName.replace('/', File.separatorChar)).delete();
    
    
    return new ResponseEntity<String>("deleted", HttpStatus.OK);
  }  
  
  
  @ResponseBody
  @RequestMapping(value="/deleteAllFiles", method=RequestMethod.POST)
  public ResponseEntity<String> deleteFile(@RequestParam("files[]") String[] files){
    
    logger.info("delete all files: "+ files);
    
    if(files == null || files.length == 0) {
      return new ResponseEntity<String>("deleted", HttpStatus.OK);
    }
    
    for (String fileName : files) {
      String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
      
      MediaType mType = MediaUtils.getMediaType(formatName);
      
      if(mType != null){      
        
        String front = fileName.substring(0,12);
        String end = fileName.substring(14);
        new File(uploadPath + (front+end).replace('/', File.separatorChar)).delete();
      }
      
      new File(uploadPath + fileName.replace('/', File.separatorChar)).delete();
      
    }
    return new ResponseEntity<String>("deleted", HttpStatus.OK);
  }  

}
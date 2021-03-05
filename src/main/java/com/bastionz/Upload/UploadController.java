package com.bastionz.Upload;

import com.bastionz.Upload.Services.FileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

@RestController
public class UploadController {

	@Autowired
	public FileService fileService;

	@RequestMapping("/")
	public String index() {
		return "Use `curl -F 'file=@nameFile.ext' http://localhost:8080/upload` and see file into /tmp \n";
	}

    @PostMapping("/upload")
    public ResponseEntity uploadFile(@RequestParam MultipartFile file){
        return this.fileService.upload(file);
    }
}
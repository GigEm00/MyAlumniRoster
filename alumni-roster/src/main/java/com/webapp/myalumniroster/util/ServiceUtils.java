package com.webapp.myalumniroster.util;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.webapp.myalumniroster.model.Customers;
import com.webapp.myalumniroster.repository.CustomerRepository;

@Component
public class ServiceUtils{
    
	private JavaMailSender sender;
	
	private CustomerRepository customerRepository;

	private static final String UPLOADED_FOLDER = "C:\\Tutorials\\images\\users\\myalumniroster\\";
    
    @Autowired    
    public ServiceUtils(JavaMailSender sender, CustomerRepository customerRepository) {
		super();
		this.sender = sender;
		this.customerRepository = customerRepository;
	}
	public String sendMail(String to, String msg, String subject) {
        MimeMessage message = sender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message);
        try {
            helper.setTo(to);
            helper.setText(msg);
            helper.setSubject(subject);
        } catch (MessagingException e) {
            e.printStackTrace();
            return "Error while sending mail ..";
        }
        try {
			sender.send(message);
		} catch (MailException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        return "E-Mail Sent Successfully!";
     }
    
	//save a single file to locale file system
	public void saveImage(MultipartFile file, long id) throws IllegalStateException, IOException {
      try {
		 // save dir
		 String destDir = UPLOADED_FOLDER+ File.separator + id;                        
		 //innitalize file
		 File dir = new File(destDir);
		 //if folder does not exist create it
		 if(!dir.exists()){                                    	 
		    new File(destDir).mkdirs();                                        
			}
			//get file from form
			MultipartFile multipartFile = (MultipartFile) file; 
			//set folder to save file system 
			File doc = new File(destDir + File.separator +  multipartFile.getOriginalFilename());
			//save to file system
			multipartFile.transferTo(doc);
			//save to db
			if(customerRepository.findById(id).get().getImage() != null) {
			Customers cus=customerRepository.findById(id).get();
			cus.setImage(multipartFile.getOriginalFilename());
			customerRepository.save(cus);
			}
		  } catch (Exception e) {
			e.printStackTrace();
		}
			 
	   }
	   
	   //save multiple files to locale file system
	   public String multiplesave(MultipartFile[] files, long id) throws IllegalStateException, IOException {
		    	  
		      File dir = new File(UPLOADED_FOLDER + File.separator + id );			  
			  for (int i = 0; i < files.length; i++){ 
			  MultipartFile file = files[i]; 
			  try { 		      
			  if (!dir.exists()) dir.mkdirs();			  
			  String destpath=UPLOADED_FOLDER + File.separator + id+ File.separator+ file.getOriginalFilename(); 
			  File destfile= new File(destpath);			  
			  file.transferTo(destfile);
		     } catch (Exception e) {
			  e.printStackTrace();
			  return "Upload fail";
		   } 
		  }
		return "Success";
	   }
	   
		   
	   public void removefiles(long id, String image) {
		try {
			File file = new File(UPLOADED_FOLDER + File.separator 
					+ id+ File.separator +image+"");    		
	 	    if(file.delete()){
	 	    	if(customerRepository.findById(id).get().getImage() != null) {
					Customers cus=customerRepository.findById(id).get();
					cus.setImage("");
					customerRepository.save(cus);
				}	
			System.out.println(file.getName() + " is deleted!");				
			}else{
				System.out.println("Delete operation is failed.");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	   }
	   
	   public void getFiles(Model model, long id) {
	    	List<String> results = new ArrayList<String>();
			try {
				File dir = new File(UPLOADED_FOLDER + File.separator + id );			  
				File[] files = new File(UPLOADED_FOLDER + File.separator + id).listFiles();
				if (!dir.exists()) dir.mkdirs();
				for (File file : files) {
				    if (file.isFile()) {
				        results.add(file.getName());
				        model.addAttribute("filesname", results);
				     }				   
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    }
		
       
    
}
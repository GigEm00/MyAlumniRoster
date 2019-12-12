package com.webapp.capstone;

import java.util.concurrent.TimeUnit;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.ie.InternetExplorerDriver;

import io.github.bonigarcia.wdm.WebDriverManager;

public class WebDriverTests {

	static WebDriver driver;
	
    @BeforeClass
	public static void openBrowser() {
   
    	System.setProperty("webdriver.ie.driver", "C:\\ws\\drivers\\IEDriverServer.exe");
        driver=new InternetExplorerDriver();
    	
		/*
		 * WebDriverManager.chromedriver() .setup(); driver = new ChromeDriver();
		 */
        driver.manage().window().maximize();
        driver.manage().timeouts().implicitlyWait(30, TimeUnit.SECONDS);
        
    }
    
    
	/*
	 * @Test public void testWeb() throws InterruptedException {
	 * driver.get("http://localhost:6050/capstoneone/"); Thread.sleep(3000); }
	 */
	
	@Test
	public void register() throws Exception {
		driver.get("http://localhost:6050/capstoneone/register");
		driver.findElement(By.id("f_name")).sendKeys("Owino");
		driver.findElement(By.id("l_name")).sendKeys("Omollo");
		driver.findElement(By.id("_email")).sendKeys("Owino_one@gmail.com");
		driver.findElement(By.id("pass")).sendKeys("1234");
		driver.findElement(By.id("pass2")).sendKeys("1234");
		Thread.sleep(3000);
		driver.findElement(By.id("submit")).click();
	}
	
	@Test
	public void login() throws InterruptedException {
		driver.get("http://localhost:6050/capstoneone/login");
		driver.findElement(By.id("username")).sendKeys("Owino_one@gmail.com");
		Thread.sleep(3000);
	    driver.findElement(By.id("pass")).sendKeys("1234");
	    Thread.sleep(3000);
	    driver.findElement(By.id("submit")).click(); 
		
	}
	
	
	@AfterClass
	public static void closeBrowser() {		
		driver.quit();
	}
	
	
	
}

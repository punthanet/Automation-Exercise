*** Settings ***
Library		SeleniumLibrary


*** Variables ***
${message}					My Message Variables
${Emailที่ใช้ทดสอบ}			Test@Test
${Passwordที่ใช้ทดสอบ}		admin123



*** Keywords ***
Say Hello
	Log To Console		ThisIsSayHelloKeywords

Skip Google Ads
    Execute Javascript    const elements = document.getElementsByClassName('adsbygoogle adsbygoogle-noablate'); while (elements.length > 0) elements[0].remove()




*** Test cases ***
Test Case 1: Register User
	Open Browser				https://automationexercise.com		browser=chrome 				
	...     options=add_experimental_option("detach", True)										
	Element Should Be Visible	xpath=//li/a[@href='/' and @style= 'color: orange;']			
	Click element				xpath=//a[@href='/login']										
	Element Should Be Visible	xpath=//h2[text()='New User Signup!']							
	input text					xpath=//input[@data-qa='signup-name']		Testname		 	
	input text					xpath=//input[@data-qa='signup-email']		Test@555			
	Click element				xpath=//button[@data-qa="signup-button"]						
	Element Should Be Visible	xpath=//b[text()='Enter Account Information']					
	Click element				id=id_gender1													
	input text					xpath=//input[@data-qa='password']			MyPassword			
	Select From List By Value	id=days			7												
	Select From List By Value	id=months		7												
	Select From List By Value	id=years		2001											
	Skip Google Ads																				
	Select Checkbox				id=newsletter													
	Select Checkbox				id=optin														
	input text					xpath=//input[@data-qa='first_name']		MyFirstname			
	input text					xpath=//input[@data-qa='last_name']			MyLastname		
	input text					xpath=//input[@data-qa='company']			MyCompany			
	input text					xpath=//input[@data-qa='address']			Address				
	input text					xpath=//input[@data-qa='address2']			address2			
	Select From List By Value	id=country		United States								
	input text					xpath=//input[@data-qa='state']				state				
	input text					xpath=//input[@data-qa='city']				city				
	input text					xpath=//input[@data-qa='zipcode']			zipcode				
	input text					xpath=//input[@data-qa='mobile_number']		0877777777       
	Click element				xpath=//button[@data-qa='create-account']					
	Element Should Be Visible	xpath=//b[text()='Account Created!']							
	Click element				xpath=//a[@href='/' and @data-qa='continue-button']				
	Element Should Be Visible	xpath=//a[text()=' Logged in as ']								
	Click element				xpath=//a[@href='/delete_account']							
	Element Should Be Visible	xpath=//b[text()='Account Deleted!']							
	Click Element				xpath=//a[@data-qa='continue-button']						

Test Case 2: Login User with correct email and password
	Open Browser				https://automationexercise.com		browser=chrome 				
	...     options=add_experimental_option("detach", True)									
	Element Should Be Visible	xpath=//li/a[@href='/' and @style= 'color: orange;']		
	Click element				xpath=//a[@href='/login']									
	Element Should Be Visible	xpath=//h2[text()='Login to your account']						
	input text					xpath=//input[@data-qa='login-email']		${Emailที่ใช้ทดสอบ}	 
	input text					xpath=//input[@data-qa='login-password']	${Passwordที่ใช้ทดสอบ}  
	Click element				xpath=//button[@data-qa='login-button']							
	Element Should Be Visible	xpath=//a[text()=' Logged in as ']								

Test Case 3: Login User with incorrect email and password
	Open Browser				https://automationexercise.com		browser=chrome 				
	...     options=add_experimental_option("detach", True)										
	Element Should Be Visible	xpath=//li/a[@href='/' and @style= 'color: orange;']		
	Click element				xpath=//a[@href='/login']										
	Element Should Be Visible	xpath=//h2[text()='Login to your account']						
	input text					xpath=//input[@data-qa='login-email']		fake@fake		   
	input text					xpath=//input[@data-qa='login-password']	fake123			  
	Click element				xpath=//button[@data-qa='login-button']							
	Element Should Be Visible 	xpath=//p[text()='Your email or password is incorrect!']  	   

Test Case 4: Logout User
	Open Browser				https://automationexercise.com		browser=chrome 				
	...     options=add_experimental_option("detach", True)										
	Element Should Be Visible	xpath=//li/a[@href='/' and @style= 'color: orange;']			
	Click element				xpath=//a[@href='/login']										
	Element Should Be Visible	xpath=//h2[text()='Login to your account']						
	input text					xpath=//input[@data-qa='login-email']		${Emailที่ใช้ทดสอบ}	  
	input text					xpath=//input[@data-qa='login-password']	${Passwordที่ใช้ทดสอบ}  
	Click element				xpath=//button[@data-qa='login-button']							
	Element Should Be Visible	xpath=//a[text()=' Logged in as ']								
	Click element				xpath=//a[@href='/logout']									
	Element Should Be Visible	xpath=//h2[text()='Login to your account']						

Test Case 5: Register User with existing email
	Open Browser				https://automationexercise.com		browser=chrome 				
	...     options=add_experimental_option("detach", True)										
	Element Should Be Visible	xpath=//li/a[@href='/' and @style= 'color: orange;']			
	Click element				xpath=//a[@href='/login']										
	Element Should Be Visible	xpath=//h2[text()='New User Signup!']							
	input text					xpath=//input[@data-qa='signup-name']      TestName   			
	input text					xpath=//input[@data-qa='signup-email']     ${Emailที่ใช้ทดสอบ}	 
	Click element				xpath=//button[@data-qa='signup-button']						
	Element Should Be Visible	xpath=//p[text()='Email Address already exist!']				

Test Case 6: Contact Us Form
	Open Browser				https://automationexercise.com		browser=chrome 				
	...     options=add_experimental_option("detach", True)										
	Element Should Be Visible	xpath=//li/a[@href='/' and @style= 'color: orange;']			
	Click element				xpath=//a[@href='/contact_us']									
	Element Should Be Visible	xpath=//h2[text()='Get In Touch']								
	input text					xpath=//input[@data-qa='name']			TestName				
	input text					xpath=//input[@data-qa='email']	   		Test@555				
	input text 					xpath=//input[@data-qa='subject']		TestSubject			
	Skip Google Ads
	input text					xpath=//textarea[@data-qa='message']	This is a test message  # Enter message
	Choose File  				xpath=//input[@name='upload_file']		D:/Automation_Exercise/This is for uploading file.txt  # Upload file
	Click element				xpath=//input[@data-qa='submit-button']							
	Handle Alert															
	Element Should Be Visible	xpath=//div[@class='status alert alert-success']			
	Click element				xpath=//a[@class='btn btn-success']								
	Element Should Be Visible	xpath=//li/a[@href='/' and @style= 'color: orange;']			

Test Case 7: Verify Test Cases Page
	Open Browser				https://automationexercise.com		browser=chrome 				
	...     options=add_experimental_option("detach", True)									
	Element Should Be Visible	xpath=//li/a[@href='/' and @style= 'color: orange;']		
	Click element				xpath=//a[@href='/test_cases']									
	Element Should Be Visible   xpath=//b[text()='Test Cases']								

Test Case 8: Verify All Products and product detail page
	Open Browser				https://automationexercise.com		browser=chrome 				
	...     options=add_experimental_option("detach", True)									
	Element Should Be Visible	xpath=//li/a[@href='/' and @style= 'color: orange;']			
	Click element				xpath=//a[@href='/products']								
	Element Should Be Visible	xpath=//h2[text()='All Products']							
	Element Should Be Visible	xpath=//div[@class='col-sm-4']//li								
	Click element				xpath=//a[@href='/product_details/1']						
	Element Should Be Visible	xpath=//h2[text()='Blue Top']								
	Element Should Be Visible	xpath=//p[text()='Category: Women > Tops']						
	Element Should Be Visible	xpath=//span[contains(text(), 'Rs.')]						
	Element Should Be Visible	xpath=//b[text()='Availability:']								
	Element Should Be Visible	xpath=//b[text()='Condition:']								
	Element Should Be Visible	xpath=//b[text()='Brand:']									

Test Case 9: Search Product
	Open Browser				https://automationexercise.com		browser=chrome 				
	...     options=add_experimental_option("detach", True)									
	Element Should Be Visible	xpath=//li/a[@href='/' and @style= 'color: orange;']		
	Click element				xpath=//a[@href='/products']							
	Element Should Be Visible	xpath=//h2[text()='All Products']							
	Skip Google Ads
	input text					xpath=//input[@id='search_product']		dress				
	Click element				xpath=//button[@id='submit_search']							
	Skip Google Ads
	Element Should Be Visible	xpath=//h2[text()='Searched Products']							
	Element Should Be Visible	xpath=//p[contains(text(), 'Dress')]							

	





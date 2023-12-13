*** Settings ***
Library		SeleniumLibrary


*** Variables ***
${message}				My Message Variables
${Emailที่ใช้ทดสอบ}			Test@Test
${Passwordที่ใช้ทดสอบ}		admin123



*** Keywords ***
Say Hello
	Log To Console		ThisIsSayHelloKeywords

Skip Google Ads
    Execute Javascript    const elements = document.getElementsByClassName('adsbygoogle adsbygoogle-noablate'); while (elements.length > 0) elements[0].remove()




*** Test cases ***
Test Case 1: Register User
	Open Browser				https://automationexercise.com		browser=chrome 				# Launch browser and Navigate to url 'http://automationexercise.com'
	...     options=add_experimental_option("detach", True)										# ทำให้โปรแกรมไม่ปิดเองหลังจากทดสอบเสร็จแล้ว ทั้ง Google Chrome และ Microsoft Edge
	Element Should Be Visible	xpath=//li/a[@href='/' and @style= 'color: orange;']			# Verify that home page is visible successfully
	Click element				xpath=//a[@href='/login']										# Click on 'Signup / Login' button
	Element Should Be Visible	xpath=//h2[text()='New User Signup!']							# Verify 'New User Signup!' is visible
	input text					xpath=//input[@data-qa='signup-name']		Testname		 	# Enter name
	input text					xpath=//input[@data-qa='signup-email']		Test@555			# Enter email address
	Click element				xpath=//button[@data-qa="signup-button"]						# Click 'Signup' button
	Element Should Be Visible	xpath=//b[text()='Enter Account Information']					# Verify that 'ENTER ACCOUNT INFORMATION' is visible
	Click element				id=id_gender1													# Select Title เป็น Radio button      Password, Date of birth
	input text					xpath=//input[@data-qa='password']			MyPassword			# Enter Password
	Select From List By Value	id=days			7												# Select Date of birth (days)
	Select From List By Value	id=months		7												# Select Date of birth (months)
	Select From List By Value	id=years		2001											# Select Date of birth (years)
	Skip Google Ads																				# ข้ามโฆษณา เพราะทำให้การ Test ค้างและเกิด Fail 
	Select Checkbox				id=newsletter													# Select checkbox 'Sign up for our newsletter!'
	Select Checkbox				id=optin														# Select checkbox 'Receive special offers from our partners!'
	input text					xpath=//input[@data-qa='first_name']		MyFirstname			# Enter Firstname
	input text					xpath=//input[@data-qa='last_name']			MyLastname			# Enter Lastname
	input text					xpath=//input[@data-qa='company']			MyCompany			# Enter Company
	input text					xpath=//input[@data-qa='address']			Address				# Enter Address
	input text					xpath=//input[@data-qa='address2']			address2			# Enter Address2
	Select From List By Value	id=country		United States									# Select Drop down list country
	input text					xpath=//input[@data-qa='state']				state				# Enter state
	input text					xpath=//input[@data-qa='city']				city				# Enter city
	input text					xpath=//input[@data-qa='zipcode']			zipcode				# Enter zipcode
	input text					xpath=//input[@data-qa='mobile_number']		0877777777       	# Enter mobile_number
	Click element				xpath=//button[@data-qa='create-account']						# Click 'Create Account button'
	Element Should Be Visible	xpath=//b[text()='Account Created!']							# Verify that 'ACCOUNT CREATED!' is visible
	Click element				xpath=//a[@href='/' and @data-qa='continue-button']				# Click 'Continue' button
	Element Should Be Visible	xpath=//a[text()=' Logged in as ']								# Verify that 'Logged in as username' is visible
	Click element				xpath=//a[@href='/delete_account']								# Click 'Delete Account' button
	Element Should Be Visible	xpath=//b[text()='Account Deleted!']							# Verify that 'ACCOUNT DELETED!' is visible and click 'Continue' button
	Click Element				xpath=//a[@data-qa='continue-button']							# Click continue

Test Case 2: Login User with correct email and password
	Open Browser				https://automationexercise.com		browser=chrome 				# Launch browser and Navigate to url 'http://automationexercise.com'
	...     options=add_experimental_option("detach", True)										# ทำให้โปรแกรมไม่ปิดเองหลังจากทดสอบเสร็จแล้ว ทั้ง Google Chrome และ Microsoft Edge
	Element Should Be Visible	xpath=//li/a[@href='/' and @style= 'color: orange;']			# Verify that home page is visible successfully
	Click element				xpath=//a[@href='/login']										# Click on 'Signup / Login' button
	Element Should Be Visible	xpath=//h2[text()='Login to your account']						# Verify 'Login to your account' is visible
	input text					xpath=//input[@data-qa='login-email']		${Emailที่ใช้ทดสอบ}	  # Enter correct email address
	input text					xpath=//input[@data-qa='login-password']	${Passwordที่ใช้ทดสอบ}  # Enter correct password
	Click element				xpath=//button[@data-qa='login-button']							# Click 'login' button
	Element Should Be Visible	xpath=//a[text()=' Logged in as ']								# Verify that 'Logged in as username' is visible

Test Case 3: Login User with incorrect email and password
	Open Browser				https://automationexercise.com		browser=chrome 				# Launch browser and Navigate to url 'http://automationexercise.com'
	...     options=add_experimental_option("detach", True)										# ทำให้โปรแกรมไม่ปิดเองหลังจากทดสอบเสร็จแล้ว ทั้ง Google Chrome และ Microsoft Edge
	Element Should Be Visible	xpath=//li/a[@href='/' and @style= 'color: orange;']			# Verify that home page is visible successfully
	Click element				xpath=//a[@href='/login']										# Click on 'Signup / Login' button
	Element Should Be Visible	xpath=//h2[text()='Login to your account']						# Verify 'Login to your account' is visible
	input text					xpath=//input[@data-qa='login-email']		fake@fake		    # Enter incorrect email address
	input text					xpath=//input[@data-qa='login-password']	fake123			    # Enter incorrect password
	Click element				xpath=//button[@data-qa='login-button']							# Click 'login' button
	Element Should Be Visible 	xpath=//p[text()='Your email or password is incorrect!']  	    # Verify error 'Your email or password is incorrect!' is visible

Test Case 4: Logout User
	Open Browser				https://automationexercise.com		browser=chrome 				# Launch browser and Navigate to url 'http://automationexercise.com'
	...     options=add_experimental_option("detach", True)										# ทำให้โปรแกรมไม่ปิดเองหลังจากทดสอบเสร็จแล้ว ทั้ง Google Chrome และ Microsoft Edge
	Element Should Be Visible	xpath=//li/a[@href='/' and @style= 'color: orange;']			# Verify that home page is visible successfully
	Click element				xpath=//a[@href='/login']										# Click on 'Signup / Login' button
	Element Should Be Visible	xpath=//h2[text()='Login to your account']						# Verify 'Login to your account' is visible
	input text					xpath=//input[@data-qa='login-email']		${Emailที่ใช้ทดสอบ}	  # Enter correct email address
	input text					xpath=//input[@data-qa='login-password']	${Passwordที่ใช้ทดสอบ}  # Enter correct password
	Click element				xpath=//button[@data-qa='login-button']							# Click 'login' button
	Element Should Be Visible	xpath=//a[text()=' Logged in as ']								# Verify that 'Logged in as username' is visible
	Click element				xpath=//a[@href='/logout']										# Click 'Logout' button
	Element Should Be Visible	xpath=//h2[text()='Login to your account']						# Verify that user is navigated to login page

Test Case 5: Register User with existing email
	Open Browser				https://automationexercise.com		browser=chrome 				# Launch browser and Navigate to url 'http://automationexercise.com'
	...     options=add_experimental_option("detach", True)										# ทำให้โปรแกรมไม่ปิดเองหลังจากทดสอบเสร็จแล้ว ทั้ง Google Chrome และ Microsoft Edge
	Element Should Be Visible	xpath=//li/a[@href='/' and @style= 'color: orange;']			# Verify that home page is visible successfully
	Click element				xpath=//a[@href='/login']										# Click on 'Signup / Login' button
	Element Should Be Visible	xpath=//h2[text()='New User Signup!']							# Verify 'New User Signup!' is visible
	input text					xpath=//input[@data-qa='signup-name']      TestName   			# Enter name 
	input text					xpath=//input[@data-qa='signup-email']     ${Emailที่ใช้ทดสอบ}	  # Enter email address that already registered
	Click element				xpath=//button[@data-qa='signup-button']						# Click 'Signup' button
	Element Should Be Visible	xpath=//p[text()='Email Address already exist!']				# Verify error 'Email Address already exist!' is visible

Test Case 6: Contact Us Form
	Open Browser				https://automationexercise.com		browser=chrome 				# Launch browser and Navigate to url 'http://automationexercise.com'
	...     options=add_experimental_option("detach", True)										# ทำให้โปรแกรมไม่ปิดเองหลังจากทดสอบเสร็จแล้ว ทั้ง Google Chrome และ Microsoft Edge
	Element Should Be Visible	xpath=//li/a[@href='/' and @style= 'color: orange;']			# Verify that home page is visible successfully
	Click element				xpath=//a[@href='/contact_us']									# Click on 'Contact Us' button
	Element Should Be Visible	xpath=//h2[text()='Get In Touch']								# Verify 'GET IN TOUCH' is visible
	input text					xpath=//input[@data-qa='name']			TestName				# Enter name
	input text					xpath=//input[@data-qa='email']	   		Test@555				# Enter email
	input text 					xpath=//input[@data-qa='subject']		TestSubject				# Enter subject
	Skip Google Ads
	input text					xpath=//textarea[@data-qa='message']	This is a test message  # Enter message
	Choose File  				xpath=//input[@name='upload_file']		D:/Automation_Exercise/This is for uploading file.txt  # Upload file
	Click element				xpath=//input[@data-qa='submit-button']							# Click 'Submit' button
	Handle Alert															# Pop up เด้งขึ้นแล้วคลิก OK ดูจากที่นี้ https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html#Handle%20Alert
	Element Should Be Visible	xpath=//div[@class='status alert alert-success']				# Verify success message 'Success! Your details have been submitted successfully.' is visible
	Click element				xpath=//a[@class='btn btn-success']								# Click 'Home' button
	Element Should Be Visible	xpath=//li/a[@href='/' and @style= 'color: orange;']			# Verify that home page is visible successfully

Test Case 7: Verify Test Cases Page
	Open Browser				https://automationexercise.com		browser=chrome 				# Launch browser and Navigate to url 'http://automationexercise.com'
	...     options=add_experimental_option("detach", True)										# ทำให้โปรแกรมไม่ปิดเองหลังจากทดสอบเสร็จแล้ว ทั้ง Google Chrome และ Microsoft Edge
	Element Should Be Visible	xpath=//li/a[@href='/' and @style= 'color: orange;']			# Verify that home page is visible successfully
	Click element				xpath=//a[@href='/test_cases']									# Click on 'Test Cases' button
	Element Should Be Visible   xpath=//b[text()='Test Cases']									# Verify user is navigated to test cases page successfully

Test Case 8: Verify All Products and product detail page
	Open Browser				https://automationexercise.com		browser=chrome 				# Launch browser and Navigate to url 'http://automationexercise.com'
	...     options=add_experimental_option("detach", True)										# ทำให้โปรแกรมไม่ปิดเองหลังจากทดสอบเสร็จแล้ว ทั้ง Google Chrome และ Microsoft Edge
	Element Should Be Visible	xpath=//li/a[@href='/' and @style= 'color: orange;']			# Verify that home page is visible successfully
	Click element				xpath=//a[@href='/products']									# Click on 'Products' button
	Element Should Be Visible	xpath=//h2[text()='All Products']								# Verify user is navigated to ALL PRODUCTS page successfully
	Element Should Be Visible	xpath=//div[@class='col-sm-4']//li								# The products list is visible
	Click element				xpath=//a[@href='/product_details/1']							# Click on 'View Product' of first product
	Element Should Be Visible	xpath=//h2[text()='Blue Top']									# Verify that detail detail is visible: product name
	Element Should Be Visible	xpath=//p[text()='Category: Women > Tops']						# Verify that detail detail is visible: category
	Element Should Be Visible	xpath=//span[contains(text(), 'Rs.')]							# Verify that detail detail is visible: price
	Element Should Be Visible	xpath=//b[text()='Availability:']								# Verify that detail detail is visible: Availability
	Element Should Be Visible	xpath=//b[text()='Condition:']									# Verify that detail detail is visible: Condition
	Element Should Be Visible	xpath=//b[text()='Brand:']										# Verify that detail detail is visible: Brand

Test Case 9: Search Product
	Open Browser				https://automationexercise.com		browser=chrome 				# Launch browser and Navigate to url 'http://automationexercise.com'
	...     options=add_experimental_option("detach", True)										# ทำให้โปรแกรมไม่ปิดเองหลังจากทดสอบเสร็จแล้ว ทั้ง Google Chrome และ Microsoft Edge
	Element Should Be Visible	xpath=//li/a[@href='/' and @style= 'color: orange;']			# Verify that home page is visible successfully
	Click element				xpath=//a[@href='/products']									# Click on 'Products' button
	Element Should Be Visible	xpath=//h2[text()='All Products']								# Verify user is navigated to ALL PRODUCTS page successfully
	Skip Google Ads
	input text					xpath=//input[@id='search_product']		dress					# Enter product name in search input
	Click element				xpath=//button[@id='submit_search']								# Click search button
	Skip Google Ads
	Element Should Be Visible	xpath=//h2[text()='Searched Products']							# Verify 'SEARCHED PRODUCTS' is visible
	Element Should Be Visible	xpath=//p[contains(text(), 'Dress')]							# Verify all the products related to search are visible

	





*** Settings ***
Library    SeleniumLibrary
Library    FakerLibrary



*** Keywords ***
Open Home Page
    Open Browser    https://automationexercise.com          browser=chrome
    Element Should Be Visible   xpath=${HOME_PAGE_ELEMENT}

Open Sign up Page
    Click element               xpath=${LOGIN_LINK}
    Element Should Be Visible   xpath=${SIGN_UP_ELEMENT}

Open Login Page
    Click element               xpath=${LOGIN_LINK}
    Element Should Be Visible   xpath=${LOGIN_ELEMENT}

Click Login Button
    Click Element               xpath=${LOGIN_BUTTON}

Click Signup Button
    Click Element               xpath=${SIGN_UP_BUTTON}

Go to Products Page
    Click Element               xpath=${PRODUCTS_LINK}
    Element Should Be Visible    xpath=${PRODUCTS_LISTS_ELEMENT}

Skip Google Ads
    Execute Javascript          const elements = document.getElementsByClassName('adsbygoogle adsbygoogle-noablate'); while (elements.length > 0) elements[0].remove()


*** Variables ***
#Element
${HOME_PAGE_ELEMENT}                    //li/a[@href='/' and @style= 'color: orange;']
${SIGN_UP_ELEMENT}                      //h2[text()='New User Signup!']
${LOGIN_ELEMENT}                        //h2[text()='Login to your account']
${ENTER_ACCOUNT_ELEMENT}                //b[text()='Enter Account Information']
${ACCOUNT_CREATED_ELEMENT}              //b[text()='Account Created!']
${USER_IS_LOGGED_IN_ELEMENT}            //a[text()=' Logged in as ']
${ACCOUNT_DELETED_ELEMENT}              //b[text()='Account Deleted!']
${EMAIL_PASSWORD_INCORRECT_ELEMENT}     //p[text()='Your email or password is incorrect!']
${EMAIL_EXISTED_ELEMENT}                //p[text()='Email Address already exist!']
${CONTACT_US_ELEMENT}                   //h2[text()='Get In Touch']
${CONTACT_SUCCESS_ELEMENT}              //div[@class='status alert alert-success']
${TEST_CASES_ELEMENT}                   //b[text()='Test Cases']
${PRODUCTS_ELEMENT}                     //h2[text()='All Products']
${PRODUCTS_LISTS_ELEMENT}               //div[@class='col-sm-4']//li


#Link
${HOME_LINK}                    //a[@href='/']
${LOGIN_LINK}                   //a[@href='/login']
${CONTACT_US_LINK}              //a[@href='/contact_us']
${TEST_CASES_LINK}              //a[@href='/test_cases']
${PRODUCTS_LINK}                //a[@href='/products']

#Button
${SIGN_UP_BUTTON}               //button[@data-qa='signup-button']
${LOGIN_BUTTON}                 //button[@data-qa='login-button']
${CREATE_ACCOUNT_BUTTON}        //button[@data-qa='create-account']
${CONTINUE_BUTTON}              //a[@data-qa='continue-button']
${DELETE_ACCOUNT_BUTTON}        //a[@href='/delete_account']
${LOGOUT_BUTTON}                //a[@href='/logout']
${CONTACT_SUBMIT_BUTTON}        //input[@data-qa='submit-button']
${VIEW_PRODUCT_BUTTON}          //div[@class='col-sm-4']//li/a[@href='/product_details/1']

#Form
${SIGNUP_NAME_FORM}             //input[@data-qa='signup-name']
${SIGNUP_EMAIL_FORM}            //input[@data-qa='signup-email']
${LOGIN_EMAIL_FORM}             //input[@data-qa='login-email']
${LOGIN_PASSWORD_FORM}          //input[@data-qa='login-password']
${FIRST_NAME_FORM}              //input[@data-qa='first_name']
${LAST_NAME_FORM}               //input[@data-qa='last_name']
${ADDRESS_FORM}                 //input[@data-qa='address']
${PASSWORD_FORM}                //input[@data-qa='password']
${STATE_FORM}                   //input[@data-qa='state']
${CITY_FORM}                    //input[@data-qa='city']
${ZIPCODE_FORM}                 //input[@data-qa='zipcode']
${MOBILE_FORM}                  //input[@data-qa='mobile_number']
${CONTACT_NAME_FORM}            //input[@data-qa='name']
${CONTACT_EMAIL_FORM}           //input[@data-qa='email']
${CONTACT_SUBJECT_FORM}         //input[@data-qa='subject']
${CONTACT_EMAIL_FORM}           //input[@data-qa='email']
${CONTACT_MESSAGE_FORM}         //textarea[@data-qa='message']
${CONTACT_UPLOAD_FILE}          //input[@name='upload_file']
${SEARCH_PRODUCT_FORM}          search_product

#Select
${DAY_SELECT}                   days
${MONTH_SELECT}                 months
${YEAR_SELECT}                  years
${COUNTRY_SELECT}               country

#Radio
${MALE_RADIO}                   id_gender1
${FEMALE_RADIO}                 id_gender2

#Checkbox
${NEWS_CHECKBOX}                newsletter
${OFFERS_CHECKBOX}              optin

#Existed Username
${EXISTED_EMAIL}                existed_user@fake.com
${EXISTED_PASSWORD}             existedpassword

#Product details elements
${name_element}             //div[@class='product-information']/h2
${category_element}         //div[@class='product-information']/p[contains(text(), 'Category:')]
${price_element}            //div[@class='product-information']//span[contains(text(), 'Rs.')]
${availabiltiy}             //div[@class='product-information']//b[contains(text(), 'Availability:')]
${condition}                //div[@class='product-information']//b[contains(text(), 'Condition:')]
${brand}                    //div[@class='product-information']//b[contains(text(), 'Brand:')]


*** Test cases ***
Test Case 1: Register User
    ${username}                 FakerLibrary.User name
    ${email}                    FakerLibrary.Email
    ${password}                 FakerLibrary.Password
    ${day}                      FakerLibrary.Day Of Month
    ${converted_day}            Convert To Integer  ${day}  
    ${month}                    FakerLibrary.Month Name
    ${year}                     FakerLibrary.Year
    ${first_name}               FakerLibrary.First Name
    ${last_name}                FakerLibrary.Last Name
    ${address}                  FakerLibrary.Address
    ${state}                    FakerLibrary.State
    ${city}                     FakerLibrary.City
    ${zipcode}                  FakerLibrary.Zipcode
    ${mobile}                   FakerLibrary.Phone Number

    Open Home Page
    Open Sign up Page
    Input Text                  xpath=${SIGNUP_NAME_FORM}          ${username}  
    Input Text                  xpath=${SIGNUP_EMAIL_FORM}         ${email}
    Click Signup Button
    Element Should Be Visible   xpath=${ENTER_ACCOUNT_ELEMENT} 
    Click Element               id=${MALE_RADIO}
    Input Text                  xpath=${PASSWORD_FORM}             ${password}
    Select From List By Value   id=${DAY_SELECT}                   ${converted_day}
    Select From List By Label   id=${MONTH_SELECT}                 ${month}
    Select From List By Value   id=${YEAR_SELECT}                  ${year}
    Select Checkbox             id=${NEWS_CHECKBOX}
    Select Checkbox             id=${OFFERS_CHECKBOX}
    Input Text                  xpath=${FIRST_NAME_FORM}           ${first_name}
    Input Text                  xpath=${LAST_NAME_FORM}            ${last_name}
    Input Text                  xpath=${ADDRESS_FORM}              ${address}
    Select From List By Value   id=${COUNTRY_SELECT}               Singapore 
    Input Text                  xpath=${STATE_FORM}                ${state}
    Input Text                  xpath=${CITY_FORM}                 ${city}
    Input Text                  xpath=${ZIPCODE_FORM}              ${zipcode}
    Input Text                  xpath=${MOBILE_FORM}               ${mobile}
    Click Element               xpath=${CREATE_ACCOUNT_BUTTON}
    Element Should Be Visible   xpath=${ACCOUNT_CREATED_ELEMENT} 
    Click Element               xpath=${CONTINUE_BUTTON}
    Skip Google Ads
    Click Element               xpath=${CONTINUE_BUTTON}
    Element Should Be Visible   xpath=${USER_IS_LOGGED_IN_ELEMENT}
    Click Element               xpath=${DELETE_ACCOUNT_BUTTON}
    Element Should Be Visible   xpath=${ACCOUNT_DELETED_ELEMENT}

Test Case 2: Login User with correct email and password
    Open Home Page
    Open Login Page
    Input Text                  xpath=${LOGIN_EMAIL_FORM}          ${EXISTED_EMAIL}
    Input Text                  xpath=${LOGIN_PASSWORD_FORM}       ${EXISTED_PASSWORD}
    Click Login Button
    Element Should Be Visible   xpath=${USER_IS_LOGGED_IN_ELEMENT}
    
Test Case 3: Login User with incorrect email and password
    Open Home Page
    Open Login Page
    Input Text                  xpath=${LOGIN_EMAIL_FORM}          thisisfake@fake.com
    Input Text                  xpath=${LOGIN_PASSWORD_FORM}       fakepassword
    Click Login Button
    Element Should Be Visible   xpath=${EMAIL_PASSWORD_INCORRECT_ELEMENT}
Test Case 4: Logout User
    Open Home Page
    Open Login Page
    Input Text                  xpath=${LOGIN_EMAIL_FORM}          ${EXISTED_EMAIL}
    Input Text                  xpath=${LOGIN_PASSWORD_FORM}       ${EXISTED_PASSWORD}
    Click Login Button
    Element Should Be Visible   xpath=${USER_IS_LOGGED_IN_ELEMENT}
    Click Element               xpath=${LOGOUT_BUTTON}
    Element Should Be Visible   xpath=${LOGIN_ELEMENT}
Test Case 5: Register User with existing email
    ${username}                 FakerLibrary.User name

    Open Home Page 
    Open Login Page
    Input Text                  xpath=${SIGNUP_NAME_FORM}          ${username}  
    Input Text                  xpath=${SIGNUP_EMAIL_FORM}         ${EXISTED_EMAIL}
    Click Signup Button
    Element Should Be Visible   xpath=${EMAIL_EXISTED_ELEMENT}

Test Case 6: Contact Us Form
    ${name}                     FakerLibrary.First Name
    ${email}                    FakerLibrary.Email

    Open Home Page
    Click Element               xpath=${CONTACT_US_LINK}
    Element Should Be Visible   xpath=${CONTACT_US_ELEMENT}
    Input Text                  xpath=${CONTACT_NAME_FORM}          ${name}
    Input Text                  xpath=${CONTACT_EMAIL_FORM}         ${email}
    Input Text                  xpath=${CONTACT_SUBJECT_FORM}       Test
    Input Text                  xpath=${CONTACT_MESSAGE_FORM}       This is just a test.
    Choose File                 xpath=${CONTACT_UPLOAD_FILE}        /Users/cindyz/automation_excercise/test.txt
    Click Element               xpath=${CONTACT_SUBMIT_BUTTON}
    Handle Alert
    Element Should Be Visible   xpath=${CONTACT_SUCCESS_ELEMENT}
    Go to Home Page

Test Case 7: Verify Test Cases Page
    Open Home Page
    Click Element               xpath=${TEST_CASES_LINK}
    Skip Google Ads
    Click Element               xpath=${TEST_CASES_LINK}
    Element Should Be Visible   xpath=${TEST_CASES_ELEMENT}

Test Case 8: Verify All Products and product detail page
    Open Home Page
    Go to Products Page
    Click element               xpath=${VIEW_PRODUCT_BUTTON}
    Element Should Be Visible   xpath=${name_element}
    Element Should Be Visible   xpath=${category_element}
    Element Should Be Visible   xpath=${price_element}
    Element Should Be Visible   xpath=${availabiltiy}
    Element Should Be Visible   xpath=${condition}
    Element Should Be Visible   xpath=${brand}

Test Case 9: Search Product
    Open Home Page
    Click Element               xpath=${PRODUCTS_LINK}
    Skip Google Ads
    Click Element               xpath=${PRODUCTS_LINK}
    Input Text                  id=${SEARCH_PRODUCT_FORM}   jeans
    Element Should Be Visible   xpath=//div[@class='col-sm-4']//p[contains(text(), 'Jeans')]


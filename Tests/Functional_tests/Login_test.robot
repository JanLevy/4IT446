*** Settings ***
Library		Selenium2Library
Resource	../../Page_Objects/Login_modal_objects.robot
Resource	../../Keywords/Main_page_keywords.robot
Resource	../../Keywords/Login_modal_keywords.robot
Resource	../../Settings/Settings.robot
Test Setup		Open czc to the main page
Test Teardown	Close All Browsers

*** Variables ***
${invalidUserName}	faultUsername
${invalidPassword}	faultPassword

*** Test Cases ***
Test login without credentials
    [Tags]  Login
	Open login form
    Click Button	${submitLogin}
	Wait Until Page Contains Element	${errorMessagesUser}

Test login with fault credentials
    [Tags]  Login
	Open login form
	Login to czc with creditals		${invalidUserName}	${invalidPassword}
	Wait Until Page Contains Element	${errorMessagesUser}

Test login with fault username and valid password
    [Tags]  Login
	Open login form
	Login to czc with creditals		${invalidUserName}	${validPassword}
	Wait Until Page Contains Element	${errorMessagesUser}

Test login with valid username and fault password
    [Tags]  Login
	Open login form
	Login to czc with creditals		${validUserName}	${invalidPassword}
	Wait Until Page Contains Element	${errorMessagesPass}

Test login with valid credentials
    [Tags]  Login   PositiveSmokeTest
	Open login form
	Login to czc with creditals		${validUserName}	${validPassword}
	Wait Until Element Is Not Visible	${logInForm}


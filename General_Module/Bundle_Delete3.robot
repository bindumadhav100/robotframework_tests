*** Settings ***

Library        SeleniumLibrary      run_on_failure=Nothing
Library	       JSONLibrary 
Library        OperatingSystem
Library        Collections 
Resource        ${CURDIR}${/}variable.robot
Resource        ${CURDIR}${/}keyword.robot
Library         dynamic_script.py
Library        pabot.PabotLib

***Test Cases*** 
    
TC-01: Verify Account Creation in Alice
     [Documentation]     Delete Bundle for Alice Application
     [Tags]     Bundle_Delete_Report    Bundle_delete_3
     
    ${result}=       Load Json From File       ${CURDIR}${/}Input_file1.json
    @{value}=	Get Value From Json	     ${result}         $..Alice_Category
    ${length}         Get length           @{value}  
     
   # open Browser with Alice Url and maximize the window  
    Open Browser      ${value['appurl']}        chrome
    Log               Alice Application Url is opened in chrome browser

    Maximize Browser Window
    Click Element     ${clickssologin} 
    # Input Text       ${inputUsername}     ${object["email"]}
    # Input Text       ${inputPassword}     ${object["password"]}
    # Click Button     ${signUpButton}
    Log            ${SSOLoginMessage}
    
   # Input Account Verification with Configured Email Id
    Log        Alice Authentication has been initated
    Wait Until Element Is Visible        ${inputEmailUrl}
    Input Text       ${inputEmailUrl}       ${value['email']} 
    Log        Alice Authenticate purpose Email given as input
    Click Button     ${emailClickButton}
    Log              ${AccountVerificationMessage}
    

   #Feedback submission if already bundle is there
    # Run Keyword If        ${FeedbackButtonClick}  
    Sleep        5s
    Wait Until Element Is Visible        ${uploadBundleClickButton}        ${TimeoutSetup}
    Click Button         ${uploadBundleClickButton}
    
   # Analysis Button Clicking for All bundle List Purpose
    Sleep        5s
    Mouse Over        ${MouseOverAnalysistab}
    Wait Until Element Is Visible        ${Analysis_button}        ${TimeoutSetup}
    Click Element         ${Analysis_button}
    Sleep        2s
    Wait Until Element Is Visible        ${MouseMovetoDeleteButton}        ${TimeoutSetup}
    Mouse Over            ${MouseMovetoDeleteButton}
     Wait Until Element Is Visible        ${DeleteButtonClick}        ${TimeoutSetup}
    Click Element        ${DeleteButtonClick}
    
    Wait Until Element Is Visible        ${FeedbackOtherButton}        ${TimeoutSetup}
    Scroll Element Into View          ${ClickSubmitForFeedback}
    Click Element          ${ClickOthersButton}
    Click Element          ${ClickSubmitForFeedback} 

    


*** Settings ***

Library        SeleniumLibrary  
Library	       JSONLibrary 
Library        OperatingSystem
Resource        ${CURDIR}${/}variable.robot
Library         dynamic_script.py
Library         cleanup_script.py

*** Keywords ***

 Keyword1
    [Arguments]    ${i}        ${val}
    Wait Until Element Is Visible        ${FeedbackButtonClick}        ${TimeoutSetup}
    # Sleep                 1s
    Click Element        ${FeedbackButtonClick}
    Wait Until Element Is Visible        ${ClickFeedbackSelectBundle}        ${TimeoutSetup}
    Click Element        ${ClickFeedbackSelectBundle}
    Wait Until Element Is Visible        ${ClickDefaultFirstBundle}        ${TimeoutSetup}
    Click Element        ${ClickDefaultFirstBundle}
    Wait Until Element Is Visible        ${ClickOthersButton}        ${TimeoutSetup}
    Scroll Element Into View          ${ClickOthersButton}
    Click Element          ${ClickOthersButton}
    Click Element          ${ClickSubmitForFeedback} 
    # sleep                10s
    Wait Until Element Is Visible          ${finalPathforUploadBundle}        ${TimeoutSetup} 
    Sleep             5s
    Choose File           ${uploadBundleFinalPath}           ${uploadFileLocation}${/}${val[${i}]["filename"]}
    Log             file upload is done
    Log             going to next steps
    
 Keyword2
    [Arguments]         ${i}    ${val}
    Log             Upload 
    Choose File         ${uploadBundleFinalPath}       ${uploadFileLocation}${/}${val[${i}]["filename"]}
    Log             upload button is uploading

 final_bundle_value_compare
    [Documentation]     This Keyword is used for compare to static bundle with Dynamic bundle value
    [Arguments]         ${static_list}   ${dynamic_list}
    ${status}           check_static_bundle_found    ${static_list}    ${dynamic_list}
    Log                 ${status}
    [Return]            ${status}

 Get Final Bundle List
    [Documentation]     Get Final Bundle List
    [Arguments]         ${count}
    ${TotalStatus}        Create List
    FOR   ${i}      IN RANGE      ${count}
            Wait Until Element Is Visible        xpath=(${OutputStatusStringCheck})[${i}+1]        ${TimeoutSetup}
            ${OutputStatus}=     Get Text         xpath=(${OutputStatusStringCheck})[${i}+1]
            Append To List        ${TotalStatus}        ${OutputStatus} 
            Log                  ${TotalStatus}        
    END
    [Return]            ${TotalStatus}
    
 Alice Upload Bundle Activities
    [Documentation]     looping 
    [Arguments]         ${i}    ${val}
    
    # Keyword2         ${i}    ${val}
# open Browser with Alice Url and maximize the window  
    # ${chrome options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    # Call Method    ${chrome_options}    add_argument    --headless
    # Create Webdriver    Chrome    chrome_options=${chrome options}  alias=BrowserInstance1
    
    # Go To   ${val[${i}]["appurl"]}
    Open Browser      ${val[${i}]["appurl"]}        chrome
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
    Input Text       ${inputEmailUrl}     ${val[${i}]["email"]} 
    Log        Alice Authenticate purpose Email given as input
    Click Button     ${emailClickButton}
    Log              ${AccountVerificationMessage}
    

#Feedback submission if already bundle is there
    # Run Keyword If        ${FeedbackButtonClick}  
    # Sleep        5s
    Wait Until Element Is Visible        ${uploadBundleClickButton}        ${TimeoutSetup}
    Click Button         ${uploadBundleClickButton}
    
    
    ${Result}=     Run Keyword And Return Status     Element Should Be Visible      ${FeedbackButtonClick}
    Log            ${Result}
    Run Keyword If  '${Result}' == "True"   Keyword1    ${i}    ${val}    ELSE      Keyword2  ${i}    ${val}    
    
              
# Enter Case ID in the input proceed further
    Wait Until Element Is Visible        ${caseClickElement}       ${TimeoutSetup}
    Click Element         ${caseClickElement}
    Log                 Case Id has been Initated in input
    Input Text          ${caseIdInput}       ${val[${i}]["caseid"]}
    Log                 case Id is ${val[${i}]["caseid"]} 
    Wait Until Element Is Visible    ${caseClickButton}      ${TimeoutSetup}
    Click Button        ${caseClickButton} 
    Log                Case Id input added done and clicked to proceed
   
# Select the Group Purpose click the radio button and proceed further
    Wait Until Element Is Visible       ${groupRadioButtonClick}      ${TimeoutSetup}
    Log                 Group Radio button is able to see but next will happen in next step
    Click Element       //div[contains(text(),'${val[${i}]["group"]}')] 
    Log                    Group for this log is ${val[${i}]["group"]}
    Click Button        ${groupRadioButtonContinueClick} 
    Log                   Group has been submitted
    
# Search Products and Selected Flexi Bsc as of now for static things
    Wait Until Element Is Visible        ${radioButtonFlexiBscselect}
    Log                product name is showing but next will happen in next step
    Click Element    //div[contains(text(),'${val[${i}]["productname"]}')]
    Log                 Product name is ${val[${i}]["productname"]}
    
# Skip and Rule Button Clicking Event
    Wait Until Element Is Visible        ${skipandrulebuttonclick}
    Click Button       ${skipandrulebuttonclick}
    Log                click the Skip and Run Rules button
    
# New Tag name and with Continue button pressing
    Wait Until Element Is Visible        ${newTagnameenter}
    Input Text        ${newTagnameenter}      ${val[${i}]["tagname"]}
    Log                New Tag name has been entered and is ${val[${i}]["tagname"]}
    Click Button        ${Tagsubmit}
    Log                Tag Name Got submitted Done
  
# After Pop for Uploading file and Ok button to click for the uploadation
    Log                Upload progress is showing and click ok to accept the upload work in next step
    Wait Until Element Is Visible        ${popUpLoadingOkButton}       ${FileUploadingTimeout}
    Click Button        ${popUpLoadingOkButton}
    Log                Ok button for Uploading Bundle Done 
    
# Click Here to View Ananysis purpose
    Wait Until Element Is Visible        ${ClickViewAnalysysLink}
    Log                  Click and Analysys Link is showing Click will happen in next step
    Click Element        ${ClickViewAnalysysLink}
    Log                  Click and Analysys Link Got Clicked
    
# check status column for uploading Bundle
    Wait Until Element Is Visible               ${StatusButtonClick}     ${TimeoutSetup}
    Log                      Checking Status button 
    Click Element            ${StatusButtonClick}
    

    Wait Until Element Is Visible        xpath=(${OutputStatusStringCheck})        ${TimeoutSetup}
    FOR    ${item}   IN RANGE     ${BundleStatusRange} 
        ${count}=    Get Element Count         ${OutputStatusStringCheck}  
        ${TotalStatus}=         Get Final Bundle List     ${count}   
        ${found}=    final_bundle_value_compare            ${StaticList}        ${TotalStatus}
        Exit For Loop If     ${found}
        sleep        ${TimeoutSetup}
    END   
    Log            ${TotalStatus} 
    
 # Clean Up Process will begin here

    ${clean}=          clean_up_process
    Log                ${clean}

 # Delete bundle action will start from here
    Sleep        2s
    Mouse Over        ${MouseOverAnalysistab}
    Wait Until Element Is Visible        ${Analysis_button}        ${TimeoutSetup}
    Click Element         ${Analysis_button}
    Sleep        2s
    Wait Until Element Is Visible        ${MouseMovetoDeleteButton}        ${TimeoutSetup}
    Mouse Over            ${MouseMovetoDeleteButton}
    Wait Until Element Is Visible        ${DeleteButtonClick}        ${TimeoutSetup}
    Click Element        ${DeleteButtonClick}
    
    Wait Until Element Is Visible        ${ClickOthersButton}        timeout=15s
    Scroll Element Into View          ${ClickOthersButton}
    Click Element          ${ClickOthersButton}
    Click Element          ${ClickSubmitForFeedback}    
    # Close All Browsers
    
 looping over json object
    [Documentation]     looping 
    [Arguments]         ${val}     ${length}
    FOR  ${i}  IN RANGE   ${length}
       Log        ${val}[${i}]
       Alice Upload Bundle Activities      ${i}    ${val} 
    END
   
 
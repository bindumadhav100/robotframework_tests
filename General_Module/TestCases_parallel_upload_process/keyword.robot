
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
    Sleep                 ${SetTimeOut}
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
    Sleep             12s
    Choose File           ${uploadBundleFinalPath}           ${uploadFileLocation}${/}${val[${i}]["filename"]}
    Log to console             file upload is done
    Log to console             going to next steps
    
 Keyword2
    [Arguments]         ${i}    ${val}
    Log to console             Upload 
    Choose File         ${uploadBundleFinalPath}           ${uploadFileLocation}${/}${val[${i}]["filename"]}
    Log to console             upload button is uploading

 final_bundle_value_compare
    [Documentation]     This Keyword is used for compare to static bundle with Dynamic bundle value
    [Arguments]         ${static_list}   ${dynamic_list}
    ${status}           check_static_bundle_found    ${static_list}    ${dynamic_list}
    Log to console                 ${status}
    [Return]            ${status}

 Get Final Bundle List
    [Documentation]     Get Final Bundle List
    [Arguments]         ${count}
    ${TotalStatus}        Create List
    FOR   ${i}      IN RANGE      ${count}
            Wait Until Element Is Visible        xpath=(${OutputStatusStringCheck})[${i}+1]        ${TimeoutSetup}
            ${OutputStatus}=     Get Text         xpath=(${OutputStatusStringCheck})[${i}+1]
            Append To List        ${TotalStatus}        ${OutputStatus} 
            Log to console                  ${TotalStatus}        
    END
    [Return]            ${TotalStatus}
   
    
 Alice Upload Bundle Activities
    [Documentation]     looping 
    [Arguments]         ${i}    ${val}
    
    # Keyword2         ${i}    ${val}
# open Browser with Alice Url and maximize the window  
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    --headless
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Call Method    ${chromeOptions}    add_argument    --window-size\=1366,768
    Call Method    ${chromeOptions}    add_argument    --disable-gpu
    Create Webdriver    Chrome    executable_path=/root/Desktop/Raft_docker/AI_ML_Test_Execution_Framework/ALICE/chromedriver      chrome_options=${chrome_options}  alias=BrowserInstance1


    
    Go To      ${val[${i}]["appurl"]}
   # Open Browser      ${val[${i}]["appurl"]}        chrome
    Log to console               Alice Application Url is opened in chrome browser

    Maximize Browser Window
   # Click Element     ${clickssologin}
    Wait Until Element Is visible         ${doubleclickbutton}		${TimeoutSetup}
    Double Click Element        ${doubleclickbutton}  
    Wait Until Element Is Visible         ${inputUsername}		${TimeoutSetup}
    Input Text        ${inputUsername}        ${val[${i}]["username"]}
    Wait Until Element Is Visible 		${inputPassword}	${TimeoutSetup}
    Input Text        ${inputPassword}        ${val[${i}]["password"]}
    Click Element      ${signUpButton}
   # Log            ${SSOLoginMessage}
 
    

#Feedback submission if already bundle is there
    # Run Keyword If        ${FeedbackButtonClick}  
    Sleep        ${SetTimeOut}
    Wait Until Element Is Visible        ${uploadBundleClickButton}        ${TimeoutSetup}
    Click Button         ${uploadBundleClickButton}
    
    
    ${Result}=     Run Keyword And Return Status     Element Should Be Visible      ${FeedbackButtonClick}
    Log to console            ${Result}
    Run Keyword If  '${Result}' == "True"   Keyword1    ${i}    ${val}    ELSE      Keyword2  ${i}    ${val}    
    
              
# Enter Case ID in the input proceed further
    Log to console       Entering Case Id
    Wait Until Element Is Visible         ${caseClickElement}        ${TimeoutSetup}
    Click Element         ${caseClickElement}
    Log to console                 Case Id has been Initated in input
    Sleep      ${SetTimeOut}
    Input Text          ${caseIdInput}       ${val[${i}]["caseid"]}
    Log to console                 case Id is ${val[${i}]["caseid"]} 
    Sleep     2s
    Wait Until Element Is Visible        ${caseClickButton}       ${TimeoutSetup}
    Click Button          ${caseClickButton} 
    Log to console                Case Id input added done and clicked to proceed
   
# Select the Group Purpose click the radio button and proceed further
    Wait Until Element Is Visible         ${groupRadioButtonClick}       ${TimeoutSetup}
    Log to console                 Group Radio button is able to see but next will happen in next step
    Click Element       //div[contains(text(),'${val[${i}]["group"]}')] 
    Log to console                    Group for this log is ${val[${i}]["group"]}
    Click Button          ${groupRadioButtonContinueClick} 
    Log to console                   Group has been submitted
    
# Search Products and Selected Flexi Bsc as of now for static things
    Wait Until Element Is Visible         ${radioButtonFlexiBscselect}       ${TimeoutSetup}
    Log to console                product name is showing but next will happen in next step
    Click Element    //div[contains(text(),'${val[${i}]["productname"]}')]
    Log to console                 Product name is ${val[${i}]["productname"]}
    
# Skip and Rule Button Clicking Event
    Wait Until Element Is Visible            ${skipandrulebuttonclick}              ${TimeoutSetup}
    Sleep		${SetTimeOut}
    Click Button           ${skipandrulebuttonclick}
    Log to console                click the Skip and Run Rules button
    
# New Tag name and with Continue button pressing
   # Wait Until Element Is Visible          ${newTagnameenter}             ${TimeoutSetup}
   # Click Element       ${TagProductDropdown}
   # Log to console	    click the first dropdown
   # Click Element         //span[contains(text(),'FlexiBSC')]
   # Log to console 	 selected flexi bsc from first dropdown  
   # Sleep		4s
   # Click Element        ${TagWhoisresponsibleDropdown}
   # Log to console         Click the second dropdown 
   # Sleep		1s
   # Click Element         //span[contains(text(),'3rdParty')]
   # Log to console 	  selected 3rd party from second dropdown
   # Sleep		4s
   # Click Element        ${TagTypeofissueDropdown}
   # Log to console        click 3rd dropdown   
   # Click Element        //span[contains(text(),'Procedural')] 
   # Sleep		4s  
   # Click Element        ${TagIssueDetailsDropdown}  
   # Click Element        //span[contains(text(),'Document')] 
    Sleep		${SetTimeOut}
    Click Button        ${Tagsubmit}
    Log                Tag Name Got submitted Done
   
  
# After Pop for Uploading file and Ok button to click for the uploadation
    Log to console                Upload progress is showing and click ok to accept the upload work in next step
    Wait Until Element Is Visible          ${popUpLoadingOkButton}         ${FileUploadingTimeout}
    Click Button           ${popUpLoadingOkButton}
    Log to console                Ok button for Uploading Bundle Done 
    
# Click Here to View Ananysis purpose
    Wait Until Element Is Visible           ${ClickViewAnalysysLink}            ${TimeoutSetup}
    Log to console                  Click and Analysys Link is showing Click will happen in next step
    Click Element             ${ClickViewAnalysysLink}
    Log to console                  Click and Analysys Link Got Clicked
    
# Check status column for uploading Bundle
    Wait Until Page Contains Element              ${StatusButtonClick}         ${TimeoutSetup}
    Log to console                      Check Status button
    Sleep         	${SetTimeOut} 
    Click Element            ${StatusButtonClick}
    Log				Status Button Clicked
    

    Wait Until Element Is Visible        xpath=(${OutputStatusStringCheck})        ${TimeoutSetup}
    FOR    ${item}   IN RANGE     ${BundleStatusRange} 
        ${count}=    Get Element Count         ${OutputStatusStringCheck}  
        ${TotalStatus}=         Get Final Bundle List     ${count}   
        ${found}=    final_bundle_value_compare            ${StaticList}        ${TotalStatus}
        Exit For Loop If     ${found}
        sleep        ${TimeoutSetup}
    END   
    Log to console            ${TotalStatus} 
    
# clean up process
    ${clean}=         clean_up_process 
    Log to console            ${clean}
    
 # Delete Bundle code will start here
    # Sleep        2s
    # # This below script for deleting the bundles
    # Mouse Over        ${MouseOverAnalysistab}
    # Wait Until Element Is Visible        ${Analysis_button}        ${TimeoutSetup}
    # Click Element         ${Analysis_button}
    # Sleep        2s
    # Wait Until Element Is Visible        ${MouseMovetoDeleteButton}        ${TimeoutSetup}
    # Mouse Over            ${MouseMovetoDeleteButton}
    # Wait Until Element Is Visible        ${DeleteButtonClick}        ${TimeoutSetup}
    # Click Element        ${DeleteButtonClick}
    
    # Wait Until Element Is Visible        ${ClickOthersButton}        timeout=15s
    # Scroll Element Into View          ${ClickOthersButton}
    # Click Element          ${ClickOthersButton}
    # Click Element          ${ClickSubmitForFeedback} 
    
    # Close All Browsers
    
 looping over json object
    [Documentation]     looping 
    [Arguments]         ${val}     ${length}
    FOR  ${i}  IN RANGE   ${length}
       Log to console        ${val}[${i}]
       Alice Upload Bundle Activities      ${i}    ${val} 
    END

 Json variable using 
    ${result}=       Load Json From File       ${CURDIR}${/}Input_file1.json
    @{value}=        Get Value From Json	     ${result}         $..Alice_Category
    ${length}         Get length           @{value}  
    
    
    FOR  ${val}  IN    @{value}
       Log        ${val}
       ${i}=    looping over json object    ${val}    ${length} 
    END
 
    
   
 

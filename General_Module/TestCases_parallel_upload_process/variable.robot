*** Variables ***
${doubleclickbutton}        id=myBtn
${clickssologin}        id=ssoButton
${inputEmailUrl}        //input[@id="i0116"]
${inputUsername}        //input[@id="username"]
${inputPassword}        //input[@id="password"]
${signUpButton}         //input[@id="kc-login"]
${emailClickButton}        idSIButton9
${JsonPath}            ${CURDIR}${/}Input_file2.json
${UploadFilePath}        ${CURDIR}${/}..${/}upload_files
${uploadBundleClickButton}        //button[@class="btn btn-lg btn-primary"]
${uploadBundleFinalPath}           //input[@type="file"][@class="ngx-file-drop__file-input"]  
${uploadFileLocation}             C:\\Users\\bmdesai\\eclipse-workspace\\AI_ML_Test_Execution_Framework\\ALICE\\General_Module\\Input_files
${caseClickElement}            //input[@id="mat-input-0"] 
${caseIdInput}               //input[@id="mat-input-0"]
${caseClickButton}            (//button[@class="mat-button"])[2]
${groupRadioButtonClick}        //div[contains(text(),'Market Europe')]
${groupRadioButtonContinueClick}         (//button[@class="mat-button"])[3]
${radioButtonFlexiBscselect}            //div[contains(text(),' Flexi BSC ')]     
${skipandrulebuttonclick}            (//button[@class="skipbutton mat-button"])[1]
${newTagnameenter}                (//input[@id="mat-chip-list-input-0"])
${Tagsubmit}            (//button[@class="mat-button"])[5]
${popUpLoadingOkButton}            //button[@class="btn btn-lg btn-primary"]
${FeedbackProceedButton}             //p[contains(text(),'Please provide your feedback to proceed')]
${ClickViewAnalysysLink}            //a[contains(text(),'Click here to View Analysis')]
${FeedbackButtonClick}            (//button[contains(text(),'Give Feedback')])[1]   
${ClickFeedbackSelectBundle}            (//div[@class="mat-form-field-infix"])[6]
${BundleNameChooseFromDropdown}            (//span[@class="mat-option-text"])[1]
${ClickOtherButtonInFeedbackFunctionality}            //div[contains(text(),' Others ')]
${FeedbackSubmitButton}            //span[contains(text(),'Submit')]
${Random_Numbers}                   A123B12
${StatusButtonClick}               //div[@id="mat-tab-label-0-5"]
${RuleButtonClick}                //span[contains(text(),'Rules')]
${PatternButtonClick}            //span[contains(text(),'Patterns')]
${OverviewButtonClick}           //div[contains(text(),'Overview')]
${FileUploadingTimeout}           1200s

${FeedbackButtonClick}             (//button[contains(text(),'Give Feedback')])[1]
${SelectBundleClick}              //div[@class="mat-select-arrow-wrapper"]
${ClickDefaultFirstBundle}        (//span[@class="mat-option-text"])[1]
${ClickOthersButton}               //div[contains(text(),' File type not supported ')]
${ClickSubmitForFeedback}         //span[contains(text(),'Submit')]

${SSOLoginMessage}            SSO Login Successfully Done
${AccountVerificationMessage}        Successfully Email Verification Done
${BundleuploadMessage}           Successfully Bundle 

${finalPathforUploadBundle}               //div[@class="ngx-file-drop__content"]

${TimeoutSetup}                    15s

${BundleStatusRange}                219

${BundleLocation}                ${EXECDIR}${/}ALICE${/}Input_files${/}FlexiBSC_220MB.zip

${uploadFileLocation}             C:\\Users\\bmdesai\\eclipse-workspace\\AI_ML_Test_Execution_Framework\\ALICE\\General_Module\\Input_files

${upload}                //div[@class="drop-file-msg"]

${OutputStatusStringCheck}         //td[@class="mat-cell cdk-column-status_msg mat-column-status_msg ng-star-inserted"]

@{StaticList}                           Bundle Processing - Completed          Parser Started        Rule Completed         
${url}                https://alice-test-validation-staging.americas.abi.dyn.nesc.nokia.net/
${Analysis_button}            //span[contains(text(),'Analysis')]
${MouseOverAnalysistab}            (//li[@class="menu-item ng-tns-c8-0 ng-star-inserted"])[2]
${DeleteButtonClick}                (//button[@class="mat-icon-button maticon nok_btn_circle"])[2]
${MouseMovetoDeleteButton}           //div[@class="card-content markdown"]

${FeedbackOtherButton}                //div[contains(text(),'Others')]

${TagProductDropdown}                 //mat-select[@id="mat-select-0"]
${TagWhoisresponsibleDropdown}            //mat-select[@id="mat-select-1"]
${TagTypeofissueDropdown}                //mat-select[@id="mat-select-2"]
${TagIssueDetailsDropdown}                //mat-select[@id="mat-select-3"]


${product}                Flexi BSC
${whois}                   3rdParty
${issue}                Procedural
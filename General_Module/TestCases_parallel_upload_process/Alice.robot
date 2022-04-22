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
     [Documentation]     Open the Alice Application Account
     [Tags]   Test_Report    
     
    
    # ${json}=      Get file      ${JsonPath}   				
    # ${object}=   Evaluate   json.loads('''${json}''')   json
    # Log            ${object}
    ${result}=       Load Json From File       ${CURDIR}${/}Input_file1.json
    @{value}=        Get Value From Json	     ${result}         $..Alice_Category
    ${length}         Get length           @{value}  
    
    
    FOR  ${val}  IN    @{value}
        Log        ${val}
        ${i}=    looping over json object    ${val}    ${length} 
    END
    
    Log        Successfully Complted All Process Like Rules Creation,Pattern Creation And ML With All Status
  
    

*** Settings ***
Library  SeleniumLibrary


*** Variables ***
${browser}  Edge
${url1}  https://www.saucedemo.com/
${error message}    Epic sadface: Username and password do not match any user in this service


*** Test Cases ***
Login Test
    open browser    ${url1}  ${browser}
    Set Browser Implicit Wait   5
    loginToApplication
    close browser

Invalid Login
    open browser    ${url1}  ${browser}
    Invalidusername
    close browser

Invalid Login2
    open browser    ${url1}  ${browser}
    invalidpassword
    close browser

Navigate to LandingPage
    open browser    ${url1}  ${browser}
    loginToApplication











*** Keywords ***
loginToApplication
    input text  id:user-name    standard_user
    input text  id:password     secret_sauce
    click element   xpath://input[@id='login-button']
    close Window

Invalidusername
    input text  id:user-name    abcdef
    input text  id:password     secret_sauce
    click element   xpath://input[@id='login-button']
    Element Should Contain  //h3[@data-test='error']        ${error message}
    close browser

invalidpassword
    input text  id:user-name    standard_user
    input text  id:password     abcd
    click element   xpath://input[@id='login-button']
    Element Should Contain  //h3[@data-test='error']        ${error message}
    close browser


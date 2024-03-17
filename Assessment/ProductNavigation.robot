*** Settings ***
Library     SeleniumLibrary

*** Test Cases ***
Launch Browser Test Cases
    [Documentation]    This test case navigates to the homepage, searches for products, adds them to the cart, and verifies them in the cart.
    [Tags]    Functional Test
    Open Browser    http://automationexercise.com    chrome
    Maximize Browser Window
    Navigate to Homepage
    Navigate to Product Page
    Verify Page Contains "All Products"
    Verify Search Bar is Visible
    Input Text Into Search Bar    men tshirt
    Click Search Button
    Verify Product "Men Tshirt" is Visible
    Add Men Tshirt Product Details Page
    Add Product to Cart
    Wait Until Added Modal is Visible
    Continue Shopping
    Navigate to Men Category
    Click on "JEANS"
    Verify "men Jeans Products" is Visible
    Click on "View Product"
    Verify Product "Soft Stretch Jeans" is Visible
    Add Product to Cart
    Continue Shopping
    Navigate to Cart
    Verify Products are Visible in Cart

*** Keywords ***
Navigate to Homepage
    Go to    http://automationexercise.com

Navigate to Product Page
    Click Element    xpath://a[@href="/products"]

Verify Page Contains "All Products"
    Element Should Contain    xpath://h2[@class="title text-center"]  ALL PRODUCTS

Verify Search Bar is Visible
    Element Should Be Visible    //*[@id="search_product"]

Input Text Into Search Bar
    [Arguments]    ${text}
    Input Text    xpath://*[@id="search_product"]    ${text}

Click Search Button
    Click Button    xpath://*[@id="submit_search"]

Verify Product "${product}" is Visible
    Page Should Contain    ${product}

Add Men Tshirt Product Details Page
    Click Element    xpath://a[@href="/product_details/2"]

Add Product to Cart
    Click Element   xpath://button[@class="btn btn-default cart"]

Wait Until Added Modal is Visible
    Wait Until Element Is Visible   xpath://*[@id="cartModal"]/div/div/div[3]/button

Verify Product Added Successfully
    Element Should Contain    xpath://h4[@class="modal-title w-100"]   Added!

Continue Shopping
    Click Element    xpath://*[@id="cartModal"]/div/div/div[3]/button

Navigate to Men Category and Jean
    Click Element    xpath://div[@id="Men" and contains(@class, "collapse")]//a[text()="Jeans"]

Click on "JEANS"
    Click Element    xpath://a[contains(@href, "men/jeans")]

Verify "${category}" is Visible
    Wait Until Page Contains Element    xpath://*[@id="page-title" and contains(text(), "${category}")]

Click on "View Product"
    Click Element    xpath://a[@href="/product_details/33" and @style="color: brown;"]

Navigate to Cart
    Click Element    xpath://button[@class="btn btn-default cart"]

Verify Products are Visible in Cart
    Page Should Contain    Soft Stretch Jeans
    Page Should Contain    Men Tshirt

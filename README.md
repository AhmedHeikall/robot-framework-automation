## Robot Framework Automation 

This repository contains hands-on practice with Robot Framework and SeleniumLibrary. The exercises cover web UI automation, reusable keywords, test data, flow control, and checking page elements.

## What I Practiced

- Opened a browser, navigated to a web page, and maximized the browser window.
- Automated login scenarios on SauceDemo, including valid credentials, invalid credentials, and empty fields.
- Checked page content and elements to verify expected results, including login errors and the products page.
- Read checkbox state and clicked a checkbox only when it was not already selected.
- Created reusable keywords with arguments to organize repeated actions.
- Used variables for URLs, browser names, credentials, element locators, and expected messages.
- Practiced Robot Framework flow control with `IF/ELSE`, `FOR`, `WHILE`, and `IN ENUMERATE` loops.

## What I Learned

- Robot Framework suites use sections such as `*** Settings ***`, `*** Variables ***`, `*** Keywords ***`, and `*** Test Cases ***`.
- Keywords make test steps reusable and easier to read; arguments let a keyword work with different values.
- Variables help keep test data and locators in one place.
- Setup and teardown can prepare and clean up the browser around each test.
- SeleniumLibrary keywords can interact with browser elements and verify the resulting page state.
- Conditional logic and loops help express decisions and repeated work in readable test steps.
- A test should verify observable behavior with assertions, not just perform browser actions.
- Robot Framework writes reports, logs, and structured output that can be used to review a run.

## Project Structure

```text
.
├── README.md
├── tests/
│   ├── FS_1.robot
│   ├── FS_2.robot
│   ├── FS_3.robot
│   └── FS_4.robot
└── results/
    ├── report.html
    ├── log.html
    └── output.xml
```

### Test files

- [`tests/FS_1.robot`](tests/FS_1.robot) — SauceDemo browser and login exercises. It defines browser setup and teardown, reusable navigation and login keywords, and checks for successful login, invalid credentials, and empty credentials.
- [`tests/FS_2.robot`](tests/FS_2.robot) — Flow-control exercises. It defines keywords using `IF/ELSE`, `FOR`, `WHILE`, and `IN ENUMERATE` to check an age, count numbers, and display names with or without indexes.
- [`tests/FS_3.robot`](tests/FS_3.robot) — SeleniumLibrary checkbox exercise for The Internet website. It reads each checkbox's state and clicks it when it is not already checked.
- [`tests/FS_4.robot`](tests/FS_4.robot) — Present in the project, but currently contains no test content.



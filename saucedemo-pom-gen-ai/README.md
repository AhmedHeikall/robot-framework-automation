# SauceDemo Login Automation

A small Robot Framework and SeleniumLibrary project that automates the SauceDemo login page. It uses the Page Object Model (POM) to keep page locators, browser operations, reusable login workflows, and tests organized.

## Generative AI and human validation

Generative AI can help create a first draft of locators, reusable keywords, test ideas, and documentation. This can reduce repetitive setup and save time, especially in a small project. AI output is a starting point, not proof that the automation is correct.

Human review remains part of the workflow:

1. Review generated locators and keywords against the application.
2. Check that each test has the intended inputs and expected result.
3. Run the tests in a real browser and review failures.
4. Inspect the generated report and log before accepting changes.
5. Update the page object and tests when the UI or requirements change.

## Project structure

```text
saucedemo-pom-gen-ai/
├── business/
│   └── login_keyword.robot       # Reusable login workflows for tests
├── core/
│   └── browser.robot             # Browser setup, timeout, and teardown
├── pages/
│   └── login_page.robot          # Login page locators and page actions
├── resources/                    # Available for shared resources as the project grows
├── results/
│   ├── log.html                  # Detailed keyword and test execution log
│   ├── output.xml                # Machine-readable execution results
│   └── report.html               # Test summary report
├── tests/
│   └── login_tests.robot         # Login scenarios and assertions
└── README.md
```

## Design pattern

The project follows the **Page Object Model**:

- **Page layer** (`pages/login_page.robot`) owns the login-page locators and actions, such as entering credentials, clicking Login, and reading an error message.
- **Business layer** (`business/login_keyword.robot`) combines page actions into reusable login workflows. Test data is passed into these keywords by the tests.
- **Core layer** (`core/browser.robot`) provides shared browser startup and cleanup.
- **Test layer** (`tests/login_tests.robot`) describes scenarios and checks visible outcomes without duplicating locator details.

This separation makes it easier to update a locator or workflow in one place when the application changes.

## Test cases

| # | Test case | Expected result |
|---:|---|---|
| 1 | Standard User Can Log In | Products page is displayed |
| 2 | Problem User Can Log In | Products page is displayed |
| 3 | Performance Glitch User Can Log In | Products page is displayed |
| 4 | Error User Can Log In | Products page is displayed |
| 5 | Visual User Can Log In | Products page is displayed |
| 6 | Locked Out User Cannot Log In | Locked-out error is displayed |
| 7 | Unknown Username Is Rejected | Invalid-credentials error is displayed |
| 8 | Incorrect Password Is Rejected | Invalid-credentials error is displayed |
| 9 | Incorrect Username And Password Are Rejected | Invalid-credentials error is displayed |
| 10 | Both Fields Empty Require Username | Username-required error is displayed |
| 11 | Empty Username Requires Username | Username-required error is displayed |
| 12 | Empty Password Requires Password | Password-required error is displayed |
| 13 | Whitespace Username Is Rejected | Invalid-credentials error is displayed |
| 14 | Whitespace Password Is Rejected | Invalid-credentials error is displayed |
| 15 | Single Character Username Is Rejected | Invalid-credentials error is displayed |
| 16 | Single Character Password Is Rejected | Invalid-credentials error is displayed |
| 17 | Long Username Is Rejected | Invalid-credentials error is displayed |
| 18 | Long Password Is Rejected | Invalid-credentials error is displayed |
| 19 | Username With Surrounding Whitespace Is Rejected | Invalid-credentials error is displayed |
| 20 | Password With Surrounding Whitespace Is Rejected | Invalid-credentials error is displayed |
| 21 | Special Character Credentials Are Rejected | Invalid-credentials error is displayed |

Error scenarios also assert that the login page remains available after the failed attempt.

## Run the tests and create reports

From this project folder, run:

```powershell
robot --outputdir results tests\login_tests.robot
```

Robot Framework writes the execution data and HTML reports to `results\`:

- [HTML report](results/report.html)
- [Detailed execution log](results/log.html)
- [XML output](results/output.xml)
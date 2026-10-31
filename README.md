# Robot Framework UI Automation

Hands-on web testing practice using Robot Framework and SeleniumLibrary.

## Projects

### `foundations/`

Beginner exercises covering SauceDemo login, reusable keywords, variables, flow control, checkboxes, and iframe interaction. Test suites: `FS_1.robot`–`FS_4.robot`. 

### `saucedemo-pom-gen-ai/`

SauceDemo login tests organized with the Page Object Model:

| Folder | Contents |
|---|---|
| `pages/` | Login locators and page actions |
| `business/` | Reusable login workflows |
| `core/` | Browser setup and cleanup |
| `tests/` | 21 login scenarios and assertions |
| `results/` | HTML report, execution log, and XML output |
| `resources/` | Space for shared resources |

The login scenarios cover accepted and locked-out accounts, incorrect or missing credentials, and boundary/edge-case inputs.

## Skills practiced

- Browser automation and page assertions with SeleniumLibrary
- Reusable Robot Framework keywords, variables, and arguments
- Conditional logic and loops
- Test reports and execution logs
- POM structure for maintainable UI tests

## Generative AI

Generative AI helps draft test ideas, locators, keywords, and documentation. I validate suggestions against the application, run the tests, and review results before accepting changes.

## Run the login suite

From `saucedemo-pom-gen-ai/`:

```powershell
robot --outputdir results tests\login_tests.robot
```

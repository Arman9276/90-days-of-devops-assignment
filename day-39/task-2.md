1. Continuous Integration (CI)

Definition:
Continuous Integration is the practice where developers frequently merge their code into a shared repository. Each change automatically triggers builds and automated tests to detect errors early.

How often:
Usually multiple times a day.

What it catches:
Integration issues, build failures, and test failures.

Example:
A developer pushes code to GitHub, and GitHub Actions or Jenkins automatically runs tests to check if the code builds successfully.

2. Continuous Delivery (CD)

Definition:
Continuous Delivery ensures that after CI passes, the application is automatically prepared and ready for deployment to production. Deployment still requires manual approval.

What "delivery" means:
The software is always ready to release at any time.

Example:
After tests pass, the system automatically builds a Docker image and prepares it for production, but a developer clicks a button to deploy.

3. Continuous Deployment

Definition:
Continuous Deployment goes one step further than Continuous Delivery. Every change that passes all tests and checks is automatically deployed to production without manual approval.

When teams use it:
Common in companies with strong automated testing and stable pipelines.

Example:
A developer pushes code → tests pass → the application is automatically deployed to the live website.

✅ Quick Comparison

Feature	Continuous Integration	Continuous Delivery	Continuous Deployment
Main Goal	Integrate code frequently	Keep code ready for release	Automatically release
Deployment	Not included	Manual approval	Fully automatic
Automation Level	Medium	High	Very High

# Training Document for GitHub Demo Project

## Project Overview
This project demonstrates a simple web application using Spring Boot, Thymeleaf, and basic Java services. It includes examples of user interactions, Azure infrastructure definitions, Python scripts, and GitHub migration guidelines.

## Project Structure

### Java Spring Boot Application
- **DemoApplication.java**: Entry point for the Spring Boot application.
- **UserInteractionController.java**: Handles HTTP requests and user interactions.
- **UserInteraction.java**: Defines user interaction logic.
- **TheaterImpl.java & ServerImpl.java**: Service implementations for theater and server logic.

### HTML Templates
- **index.html**: Thymeleaf template for user interaction UI.

### Azure Infrastructure
- **main.tf**: Terraform definitions for Azure resources.
- **main.bicep**: Bicep definitions for Azure resources.

### Python Scripts
- **helloworld.py**: Simple Python script printing "Hello, World!".
- **hello-python-http.py**: Python script demonstrating HTTP GET and POST requests.
- **tk-browser.py**: Basic web browser built with Tkinter.

### SQL Database Schema
- **create_tables.sql**: SQL script to create tables for a flight booking system.

### GitHub Migration and Git Usage
- **github-migration.md**: Guidelines for migrating repositories to GitHub.
- **git-beginner.md**: Quickstart guide for beginners to use Git and GitHub.

### Testing
- **test_helloworld.py**: Pytest script for testing the "Hello, World!" Python script.
- **test_hello-python-http.py**: Unit tests for HTTP request Python script.

## Running the Application

### Java Spring Boot Application
1. Ensure Java and Maven are installed.
2. Navigate to the project root directory.
3. Run the application:
```shell
mvn spring-boot:run
```
4. Open `http://localhost:8080` in your browser.

### Python Scripts
- Run Python scripts individually:
```shell
python helloworld.py
python hello-python-http.py
python tk-browser.py
```

### Azure Infrastructure
- Deploy Azure resources using Terraform:
```shell
terraform init
terraform apply
```
- Deploy Azure resources using Bicep:
```shell
az deployment group create --resource-group example-resources --template-file main.bicep
```

### Database Setup
- Execute `create_tables.sql` in your SQL database environment.

## GitHub and Git Usage
- Follow instructions in `git-beginner.md` and `github-migration.md` for GitHub repository management and migration.

## Testing
- Run Python tests using pytest:
```shell
pytest test_helloworld.py
pytest test_hello-python-http.py
```

## Additional Resources
- [GitHub Copilot for Azure](https://learn.microsoft.com/en-us/azure/developer/github-copilot-azure/get-started)
- [Terraform Documentation](https://www.terraform.io/docs/)
- [Bicep Documentation](https://docs.microsoft.com/en-us/azure/azure-resource-manager/bicep/)

# API Automation with Robot Framework

This project showcases API automation using Robot Framework, a keyword-driven test automation framework.

## Table of Contents
- [Introduction](#introduction)
- [Features](#features)
- [Prerequisites](#prerequisites)
- [Getting Started](#getting-started)
- [Writing Tests](#writing-tests)
- [Running Tests](#running-tests)
- [Project Structure](#project-structure)

## Introduction

This repository contains Robot Framework test scripts for API automation. It provides a structured and keyword-driven approach to testing RESTful APIs.

## Features

- Demonstrates API automation using Robot Framework.
- Keywords for common HTTP methods: GET, POST, PUT, PATCH, DELETE.
- Clear and modular project structure for easy maintenance and extension.

## Prerequisites

Before you begin, ensure you have the following installed:

- [Python](https://www.python.org/downloads/)
- [Robot Framework](https://robotframework.org/)
- [RequestsLibrary](https://github.com/MarketSquare/robotframework-requests)

## Getting Started

1. Clone the repository:

    ```bash
    git clone https://github.com/your-username/API-Automation-with-RobotFramework.git
    cd api-automation-robotframework
    ```

2. Install dependencies:

    ```bash
    pip install -r requirements.txt
    ```

## Writing Tests

You can find API test scripts in the `tests` directory. Each test file (`*.robot`) contains individual test cases demonstrating various HTTP requests.

```robot
# Example test file: tests/api_tests.robot
*** Settings ***
Library    RequestsLibrary

*** Test Cases ***
Example GET Request
    ${response}=    Get    https://jsonplaceholder.typicode.com/posts/1
    Should Be Equal As Numbers    ${response.status_code}    200
    # Add more assertions as needed
```

## Running Tests

Execute Robot Framework tests with the following command:

```bash
  robot TestCase/
```

# Project Structure

```bash
/API-Automation-with-RobotFramework
|-- TestCase/
|   |-- API-Automation.robot
|-- devdata/
|   |-- example.env.json
|-- .gitignore
|-- README.md

```
* TestCase/: Contains Robot Framework test files for API automation.
* devdata/: Contains files that define static data for your tests, such as JSON files.
* .gitignore: Specifies files and directories to be ignored by Git.


# Simple Devops [![Build Status](https://travis-ci.org/tstringer/simple-api.svg?branch=master)](https://travis-ci.org/tstringer/simple-api)

## CI/CD Provisioning and Configuration

### Description

This will create the Jenkins CI/CD server in Azure and then configure it so that it can handle the specific pipeline for this application. This is using infrastructure as code and configuration management so the entire process is repeatable. This will most likely only be run once, or when you ad-hoc need to ensure the build server is consistent.

### Workflow

```
+---------+         +--------------+         +--------------+
|         |         |              |         |              |
| manual  |         | terraform    |         | ansible      |
| kickoff +-------->+ creates      +-------->+ configures   |
|         |         | ci/cd server |         | build server |
+---------+         |              |         |              |
                    +--------------+         +--------------+
```

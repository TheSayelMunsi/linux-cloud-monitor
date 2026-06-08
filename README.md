Linux Cloud Monitoring System

A Bash-based monitoring solution deployed on AWS EC2 that continuously monitors server health, generates reports, checks resource utilization, performs automated log cleanup, and triggers alerts when system thresholds are exceeded.

Project Overview

This project was built to learn Linux administration, Bash scripting, automation, and AWS cloud fundamentals.

The system collects key server metrics such as:

CPU Usage
Memory Usage
Disk Usage
System Uptime
Running Services

It automatically generates timestamped reports, cleans up old logs, and performs alert checks based on configurable thresholds.

                    AWS EC2 Instance
                           │
                           ▼
                    monitor.sh
                           │
        ┌──────────────────┼──────────────────┐
        │                  │                  │
        ▼                  ▼                  ▼
   CPU Metrics       RAM Metrics      Disk Metrics
        │                  │                  │
        └──────────────────┼──────────────────┘
                           │
                           ▼
                    Report Generation
                           │
                           ▼
                   logs/report_*.txt
                           │
        ┌──────────────────┼──────────────────┐
        │                                     │
        ▼                                     ▼
   alerts.sh                           cleanup.sh
        │                                     │
        ▼                                     ▼
 Resource Alerts                  Old Log Deletion
                           │
                           ▼
                     Cron Scheduler
                           │
                           ▼
                 Automated Monitoring


Features
Monitoring
CPU utilization monitoring
RAM utilization monitoring
Disk usage monitoring
Host information collection
Uptime monitoring
Alerting
CPU threshold alerts
RAM threshold alerts
Disk usage alerts
Reporting
Timestamped report generation
Historical log storage
Structured report output
Automation
Cron-based scheduling
Automatic monitoring execution
Automatic cleanup execution

Configuration Management

Thresholds are maintained in:

config.env

Example:

CPU_LIMIT=80
RAM_LIMIT=85
DISK_LIMIT=80

LOG_RETENTION_DAYS=7

Project Structure
linux-cloud-monitor/
│
├── monitor.sh
├── alerts.sh
├── cleanup.sh
├── config.env
├── logs/
└── README.md

Use Case
Scenario

A Linux server is running critical applications.

The operations team wants:

Continuous server monitoring
Resource utilization tracking
Automatic alert generation
Historical report retention
Minimal manual intervention

This project automates all these tasks using lightweight Bash scripts.

Technologies Used
Linux
Bash Scripting
Cron
AWS EC2
SSH
Git & GitHub

Deployment Environment

Cloud Platform:

AWS EC2

Operating System:

Ubuntu Server 24.04 LTS
How To Run

Make scripts executable:

chmod +x monitor.sh
chmod +x alerts.sh
chmod +x cleanup.sh

Run monitoring manually:

./monitor.sh

Run alert checks:

./alerts.sh

Run cleanup:

./cleanup.sh

Cron Automation

Example cron configuration:

*/5 * * * * cd /home/ubuntu/linux-cloud-monitor && ./monitor.sh >> cron.log 2>&1

This executes monitoring every 5 minutes.

Learning Outcomes

Through this project I learned:

Linux administration
Bash scripting
System monitoring
Log management
Cron scheduling
AWS EC2 deployment
SSH connectivity
Troubleshooting and debugging

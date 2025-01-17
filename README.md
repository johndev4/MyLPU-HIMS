# myLPU: Health Information Management System for LPU Clinic

**myLPU HIMS** is a web-based application that aims to improve the function of the clinic and help the students, employees, and especially the clinic personnel, to have the ability to utilize the school clinic in an online set-up even in this pandemic by providing an online consultation service.

The developed system comprises three different user interfaces that will be used by the clinic, lyceans, and administrators. Basically, lyceans will be able to request a consultation at either the clinic for minor sickness or guidance for mental wellness. They can also view or download the medical documents that was sent by the clinic. The health personnel will be able to manage the lyceans’ medical record, consultation history and report, and inventory. Lastly, the admin will be able to view the activity logs, manage the accounts of the students, faculties, staffs, and health personnel.

**The following technologies are used for the project:**

- CodeIgniter 4
- Bootstrap 4
- JQuery

### Project By:

- **Jade Vale** (Team Leader/ System Analyst)
- **John Mistica** (Developer)
- **Jeffrey Dela Cruz** (UI/UX Frontend)
- **Jover De Leon** (Technical Writer)

## Prerequisites

- PHP 8.0

## Deployment Guide

**Setup .env file**

```
# ENVIRONMENT
#--------------------------------------------------------------------

CI_ENVIRONMENT = [production, development]

#--------------------------------------------------------------------
# APP
#--------------------------------------------------------------------

app.baseURL = [hostname:portnumber]

#--------------------------------------------------------------------
# DATABASE
#--------------------------------------------------------------------

database.default.hostname = [database_hostname]
database.default.database = [database_name]
database.default.username = [db_username]
database.default.password = [db_password]
```

**Setup Database**

1. Create a schema named with `database.default.database` from .env file
2. Import `infrastructure/database/sql/init-create-tables.sql`
3. Import `infrastructure/database/csv/administrator-account.csv` into administrators table

### Run using XAMPP:

1. Config php.ini located in php folder and put `extension=intl` on it

   (**NOTE:** You can just uncomment it by removing `;` at the beginning of it)

2. Open the XAMPP control panel
3. Start Apache and MySQL server

### Run using command-line interface:

1. **Change working directory to infrastructure**

```
cd [path_of_client_side]
```

2. **Run php spark serve**

```
php spark serve --port=[port_number]
```

### Run in Docker containers:

1. **Check out the 0002-dockerized branch first.**

```
git checkout 0002-dockerized
```

2. **Build image and create container using docker-compose up**

```
docker-compose up [service_name]
```

or without service name to compose all services in `docker-compose.yml`

```
docker-compose up
```

### Containerize database and use it on host Apache Server:

1. **Uncomment the ports section in db service in docker-compose.yml**

```
ports:
   - 3306:3306
```

2. **Change the database hostname on specific project's .env file (e.g. admin)**

```
database.default.hostname = localhost
```

3. **Build image and create container for the database**

```
docker-compose up db
```

4. Finally, setup and start Apache Server on host 
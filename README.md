# ✈️ Airline Reservation & Ticket Booking System

A web-based Airline Reservation and Ticket Booking System developed using Java, JSP, Servlets, JDBC, MySQL, HTML, CSS, and Bootstrap 5.

The application allows users to search for available flights, book tickets, manage their reservations, and print tickets. Administrators can manage flights, monitor bookings, manage registered users, and view booking reports through an administrative dashboard.

---

## 📌 Table of Contents

- [Overview](#-overview)
- [Features](#-features)
- [Technology Stack](#-technology-stack)
- [Project Architecture](#-project-architecture)
- [Project Structure](#-project-structure)
- [Database Design](#-database-design)
- [Prerequisites](#-prerequisites)
- [Installation and Setup](#-installation-and-setup)
- [Application Modules](#-application-modules)
- [Application Workflow](#-application-workflow)
- [Screenshots](#-screenshots)
- [Future Enhancements](#-future-enhancements)
- [Author](#-author)
- [License](#-license)

---

## 📖 Overview

The Airline Reservation & Ticket Booking System is a Java-based web application designed to simplify airline reservation management.

The system provides separate interfaces for administrators and customers.

Customers can register, log in, search for flights, book tickets, view their booking history, cancel reservations, update their profiles, change passwords, and print tickets.

Administrators can manage flight information, view registered customers, monitor reservations, access booking reports, and track booking statistics through a dashboard.

The project demonstrates Java web development concepts, MVC architecture, database connectivity, session management, CRUD operations, and responsive user interface design.

---

## 🚀 Features

### 👤 User Module

- User registration
- User login and logout
- User dashboard
- Search flights by source, destination, and departure date
- View available flight information
- Book flight tickets
- Calculate total booking fare
- Generate a unique booking reference
- View personal booking history
- Cancel eligible bookings
- Automatically update available seats after booking and cancellation
- View and update profile information
- Change password
- Reset password using registered email and phone details
- View booking confirmation
- Print flight tickets

### 🛡️ Admin Module

- Administrator login and logout
- Admin dashboard
- View dashboard statistics
- Add new flights
- View flight records
- Edit flight information
- Update flight information
- Delete flights
- View all bookings
- View registered users
- Delete users
- View booking reports
- Print booking reports
- View total revenue statistics
- View today's booking count
- View monthly booking count

### 🎨 User Interface

- Responsive Bootstrap 5 layout
- Separate user and administrator interfaces
- Navigation buttons and dashboard cards
- Flight booking forms
- Booking tables
- Printable ticket layout
- Aviation-themed landing page

---

## 🛠️ Technology Stack

| Technology | Purpose |
|---|---|
| Java | Application logic |
| JSP | Dynamic web pages |
| Servlets | Request handling and application control |
| JDBC | Database connectivity |
| MySQL | Relational database |
| HTML5 | Web page structure |
| CSS3 | Styling and layout |
| Bootstrap 5 | Responsive user interface |
| Apache Tomcat 11 | Web application server |
| Maven | Dependency and project management |
| Eclipse IDE | Development environment |

---

## 🏗️ Project Architecture

The application follows the Model-View-Controller (MVC) architectural pattern.

### Model

The model layer represents application entities and their data.

Examples:

- `Admin`
- `User`
- `Flight`
- `Booking`

### View

The view layer displays information to users through JSP pages.

Examples:

- `index.jsp`
- `adminDashboard.jsp`
- `userDashboard.jsp`
- `searchFlights.jsp`
- `searchResults.jsp`
- `myBookings.jsp`
- `ticket.jsp`

### Controller

The controller layer handles HTTP requests and coordinates application operations.

Examples:

- `SearchFlightServlet`
- `BookFlightServlet`
- `ConfirmBookingServlet`
- `ViewMyBookingsServlet`
- `CancelBookingServlet`
- `AdminDashboardServlet`
- `ViewFlightsServlet`
- `ViewBookingsServlet`
- `ViewUsersServlet`
- `BookingReportServlet`

### Data Access Layer

DAO classes perform database operations using JDBC.

Examples:

- `UserDAO`
- `FlightDAO`
- `BookingDAO`
- `DashboardDAO`

This separation helps keep request handling, business logic, database operations, and presentation organized.

---

## 📂 Project Structure

The main application structure is organized as follows:

```text
AirlineReservationSystem/
│
├── src/
│   └── main/
│       ├── java/
│       │   ├── com/
│       │   │   ├── controller/
│       │   │   │   ├── AdminDashboardServlet.java
│       │   │   │   ├── AdminLogoutServlet.java
│       │   │   │   ├── SearchFlightServlet.java
│       │   │   │   ├── BookFlightServlet.java
│       │   │   │   ├── ConfirmBookingServlet.java
│       │   │   │   ├── ViewMyBookingsServlet.java
│       │   │   │   ├── CancelBookingServlet.java
│       │   │   │   ├── ViewFlightsServlet.java
│       │   │   │   ├── ViewBookingsServlet.java
│       │   │   │   ├── ViewUsersServlet.java
│       │   │   │   └── BookingReportServlet.java
│       │   │   │
│       │   │   ├── dao/
│       │   │   │   ├── UserDAO.java
│       │   │   │   ├── FlightDAO.java
│       │   │   │   ├── BookingDAO.java
│       │   │   │   └── DashboardDAO.java
│       │   │   │
│       │   │   ├── model/
│       │   │   │   ├── Admin.java
│       │   │   │   ├── User.java
│       │   │   │   ├── Flight.java
│       │   │   │   └── Booking.java
│       │   │   │
│       │   │   └── util/
│       │   │       └── DBConnection.java
│       │   │
│       │   └── ...
│       │
│       └── webapp/
│           ├── index.jsp
│           │
│           ├── admin/
│           │   ├── adminLogin.jsp
│           │   ├── adminDashboard.jsp
│           │   ├── addFlight.jsp
│           │   ├── viewFlights.jsp
│           │   ├── editFlight.jsp
│           │   ├── viewBookings.jsp
│           │   ├── viewUsers.jsp
│           │   └── bookingReport.jsp
│           │
│           ├── user/
│           │   ├── login.jsp
│           │   ├── register.jsp
│           │   ├── userDashboard.jsp
│           │   ├── searchFlights.jsp
│           │   ├── searchResults.jsp
│           │   ├── bookFlight.jsp
│           │   ├── bookingSuccess.jsp
│           │   ├── myBookings.jsp
│           │   ├── ticket.jsp
│           │   ├── profile.jsp
│           │   ├── changePassword.jsp
│           │   └── forgotPassword.jsp
│           │
│           ├── css/
│           │   └── style.css
│           │
│           └── WEB-INF/
│               └── web.xml
│
├── pom.xml
└── README.md
```

**Note:** This is a representative structure. Keep only the files that exist in your actual project, and update the structure if your folders differ.

---

## 🗄️ Database Design

The application uses MySQL to store user accounts, administrator credentials, flight information, and booking records.

### 1. Admin Table

Stores administrator login information.

| Column | Description |
|---|---|
| admin_id | Administrator ID |
| username | Administrator username |
| password | Administrator password |

### 2. Users Table

Stores registered customer information.

| Column | Description |
|---|---|
| user_id | Unique user ID |
| full_name | Customer's full name |
| email | Customer's email address |
| phone | Customer's phone number |
| gender | Customer's gender |
| password | Customer's password |

### 3. Flights Table

Stores flight information.

| Column | Description |
|---|---|
| flight_id | Unique flight ID |
| flight_number | Flight number |
| airline_name | Airline name |
| source | Departure location |
| destination | Arrival location |
| departure_date | Flight departure date |
| departure_time | Flight departure time |
| arrival_time | Flight arrival time |
| ticket_price | Price per ticket |
| available_seats | Available seat count |

### 4. Bookings Table

Stores customer reservation information.

| Column | Description |
|---|---|
| booking_id | Unique booking ID |
| booking_reference | Unique booking reference |
| user_id | Customer ID |
| flight_id | Flight ID |
| passenger_name | Passenger's name |
| passenger_age | Passenger's age |
| passenger_gender | Passenger's gender |
| seat_count | Number of seats booked |
| total_fare | Total booking amount |
| booking_status | Booking status |
| booking_date | Booking creation timestamp |

**Note:** Column names and data types should match your actual MySQL schema.

---

## 💻 Prerequisites

Install the following software before running the application:

1. Java Development Kit (JDK)
2. Apache Tomcat 11
3. MySQL Server
4. MySQL Workbench (optional)
5. Eclipse IDE or another Java IDE
6. Maven
7. Git

You should have a basic understanding of Java, SQL, JSP, Servlets, and JDBC.

---

## ⚙️ Installation and Setup

### Step 1: Clone the Repository

Open a terminal and run:

```bash
git clone YOUR_GITHUB_REPOSITORY_URL
```

Move into the project directory:

```bash
cd AirlineReservationSystem
```

Replace `YOUR_GITHUB_REPOSITORY_URL` with your actual GitHub repository URL.

### Step 2: Create the MySQL Database

Open MySQL Workbench or your MySQL command-line client.

Create the database:

```sql
CREATE DATABASE airline_reservation;
```

Select the database:

```sql
USE airline_reservation;
```

Create the `admin`, `users`, `flights`, and `bookings` tables using the SQL schema included with your project.

Ensure that the column names, primary keys, foreign keys, and data types match those expected by the DAO classes.

### Step 3: Configure Database Connectivity

Open:

```text
src/main/java/com/util/DBConnection.java
```

Configure the MySQL connection using your local database settings.

Example:

```java
String url = "jdbc:mysql://localhost:3306/airline_reservation";
String username = "YOUR_MYSQL_USERNAME";
String password = "YOUR_MYSQL_PASSWORD";
```

Use your own MySQL credentials.

**Important:** Never commit real database passwords to a public GitHub repository. Use environment variables or a local configuration file excluded from Git.

### Step 4: Configure Maven Dependencies

Open `pom.xml` and ensure the project includes the dependencies required for:

- MySQL Connector/J
- Jakarta Servlet API
- JSTL, if used by your JSP pages

The Servlet API should normally use `provided` scope because Tomcat supplies the Servlet API at runtime.

Check that your dependencies are compatible with Apache Tomcat 11 and Jakarta Servlet.

### Step 5: Import the Project into Eclipse

1. Open Eclipse.
2. Select **File → Import**.
3. Choose **Existing Maven Projects**.
4. Select the project directory.
5. Click **Finish**.
6. Right-click the project.
7. Select **Maven → Update Project**.

Resolve any dependency or compilation errors before running the application.

### Step 6: Configure Apache Tomcat

1. Open the Servers view in Eclipse.
2. Add Apache Tomcat 11 if it is not already configured.
3. Add the Airline Reservation System project to the server.
4. Start Tomcat.

### Step 7: Run the Application

Open your browser and visit:

```text
http://localhost:8080/AirlineReservationSystem/
```

If your Tomcat server uses a different port, replace `8080` with the configured port.

The context path may also differ depending on your deployment configuration.

---

## 🔄 Application Workflow

### Customer Workflow

```text
Home Page
    |
    v
User Registration / Login
    |
    v
User Dashboard
    |
    v
Search Flights
    |
    v
View Search Results
    |
    v
Select Flight
    |
    v
Enter Passenger Details
    |
    v
Confirm Booking
    |
    v
Booking Confirmation
    |
    v
View My Bookings
    |
    +----> Print Ticket
    |
    +----> Cancel Booking
```

### Administrator Workflow

```text
Admin Login
    |
    v
Admin Dashboard
    |
    +----> Manage Flights
    |
    +----> View Bookings
    |
    +----> Manage Users
    |
    +----> Booking Reports
    |
    +----> View Dashboard Analytics
    |
    +----> Logout
```

---

## 📸 Screenshots

Screenshots make a GitHub repository easier to understand and demonstrate.

Create a folder named:

```text
screenshots/
```

Add screenshots of your actual application, such as:

- Home page
- User registration
- User login
- User dashboard
- Flight search results
- Booking confirmation
- My Bookings page
- Printable ticket
- Admin dashboard
- Flight management
- User management
- Booking report

After adding the screenshots, display them in this section.

Example:

```markdown


## 🔮 Future Enhancements

Potential improvements include:

- Online payment gateway integration
- Email booking confirmations
- PDF ticket generation
- Advanced flight filtering and sorting
- Improved form validation
- Password hashing and stronger authentication
- Improved concurrency handling during seat reservations
- Automated unit and integration testing
- Deployment to a cloud platform

These are potential enhancements and should not be considered implemented features unless they have actually been developed.

---

## 🎯 Learning Outcomes

This project demonstrates practical experience with:

- Java web application development
- JSP and Servlet request handling
- MVC architecture
- JDBC database connectivity
- MySQL database design
- CRUD operations
- Session management
- User and administrator authentication
- Relational database operations
- Booking and cancellation workflows
- Responsive UI development using Bootstrap
- Application deployment using Apache Tomcat

---

## 👨‍💻 Author

**Rahul**

Java Web Development Project

### Technology Stack

Java | JSP | Servlets | JDBC | MySQL | HTML5 | CSS3 | Bootstrap 5

---

## 📄 License

This project is intended for educational and portfolio purposes.

If you plan to distribute it publicly, consider adding a `LICENSE` file that specifies the terms under which others may use, modify, and distribute the code.

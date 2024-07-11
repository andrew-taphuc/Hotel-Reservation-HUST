# Hotel-Reservation-HUST

A hotel booking demo website for the Database Lab course at the School of Information and Communication Technology (SOICT) at Hanoi University of Science and Technology (HUST).

## Table of Contents

- [About](#about)
- [Features](#features)
- [Technologies Used](#technologies-used)
- [Setup](#setup)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)

## About

This project is a hotel reservation system designed to demonstrate database management and web application development skills. It allows users to search for hotels, book rooms, and manage reservations.

## Features

- User authentication and authorization
- Hotel search functionality
- Room booking and reservation management
- Admin panel for managing hotels and reservations

## Technologies Used

- **Frontend**: HTML, CSS, JavaScript
- **Backend**: Node.js, Express.js
- **Database**: PostgreSQL
- **Other**: PLpgSQL

## Setup

1. Clone the repository:
    ```bash
    git clone https://github.com/andrew-taphuc/Hotel-Reservation-HUST.git
    cd Hotel-Reservation-HUST
    ```

2. Set up the database:
    - Ensure PostgreSQL is installed and running.
    - Create a database named `hotel_reservation`.
    - Run the SQL scripts located in the `db` directory to set up the database schema.

3. Install dependencies:
    ```bash
    cd server
    npm install
    ```

4. Configure environment variables:
    - Create a `.env` file in the `server` directory.
    - Add the necessary environment variables (e.g., database connection details).

5. Start the server:
    ```bash
    npm start
    ```

6. Open the client:
    - Navigate to the `client` directory.
    - Open `index.html` in a web browser.

## Usage

- Register or log in to the system.
- Search for available hotels.
- Book rooms and manage your reservations through the user interface.
- Admin users can log in to the admin panel to manage hotels and reservations.

## Contributing

Contributions are welcome! Please fork the repository and create a pull request with your changes. Ensure your code follows the project's coding standards and includes appropriate tests.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contact

For any inquiries or issues, please contact Andrew Taphuc at andrew.taphuc@example.com.
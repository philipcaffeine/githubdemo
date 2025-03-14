# Database Schema Documentation

## Tables

### passengers
Stores information about passengers.

| Column                | Data Type     | Constraints          |
|-----------------------|---------------|----------------------|
| id                    | BIGINT        | PRIMARY KEY          |
| first_name            | VARCHAR(50)   |                      |
| last_name             | VARCHAR(50)   |                      |
| date_of_birth         | DATE          |                      |
| country_of_citizenship| VARCHAR(50)   |                      |
| country_of_residence  | VARCHAR(50)   |                      |
| passport_number       | VARCHAR(20)   |                      |
| created_at            | TIMESTAMP     |                      |
| updated_at            | TIMESTAMP     |                      |

### no_fly_list
Stores information about passengers who are on the no-fly list.

| Column                | Data Type     | Constraints          |
|-----------------------|---------------|----------------------|
| id                    | BIGINT        | PRIMARY KEY          |
| active_from           | DATE          |                      |
| active_to             | DATE          |                      |
| no_fly_reason         | VARCHAR(255)  |                      |
| created_at            | TIMESTAMP     |                      |
| updated_at            | TIMESTAMP     |                      |
| psngr_id              | BIGINT        | FOREIGN KEY (psngr_id) REFERENCES passengers(id) |

### flights
Stores information about flights.

| Column                | Data Type     | Constraints          |
|-----------------------|---------------|----------------------|
| flight_id             | BIGINT        | PRIMARY KEY          |
| departing_gate        | VARCHAR(20)   |                      |
| arriving_gate         | VARCHAR(20)   |                      |
| created_at            | TIMESTAMP     |                      |
| updated_at            | TIMESTAMP     |                      |
| airline_id            | BIGINT        | FOREIGN KEY (airline_id) REFERENCES airline(id) |
| departing_airport_id  | BIGINT        | FOREIGN KEY (departing_airport_id) REFERENCES airport(id) |
| arriving_airport_id   | BIGINT        | FOREIGN KEY (arriving_airport_id) REFERENCES airport(id) |

### airport
Stores information about airports.

| Column                | Data Type     | Constraints          |
|-----------------------|---------------|----------------------|
| id                    | BIGINT        | PRIMARY KEY          |
| airport_name          | VARCHAR(50)   |                      |
| country               | VARCHAR(50)   |                      |
| state                 | VARCHAR(50)   |                      |
| city                  | VARCHAR(50)   |                      |
| created_at            | TIMESTAMP     |                      |
| updated_at            | TIMESTAMP     |                      |

### airline
Stores information about airlines.

| Column                | Data Type     | Constraints          |
|-----------------------|---------------|----------------------|
| id                    | BIGINT        | PRIMARY KEY          |
| airline_code          | VARCHAR(20)   |                      |
| airline_name          | VARCHAR(50)   |                      |
| airline_country       | VARCHAR(50)   |                      |
| created_at            | TIMESTAMP     |                      |
| updated_at            | TIMESTAMP     |                      |

### booking
Stores information about flight bookings.

| Column                | Data Type     | Constraints          |
|-----------------------|---------------|----------------------|
| bookingid             | BIGINT        | PRIMARY KEY          |
| flight_id             | BIGINT        | FOREIGN KEY (flight_id) REFERENCES flights(flight_id) |
| status                | VARCHAR(20)   |                      |
| booking_platform      | VARCHAR(20)   |                      |
| created_at            | TIMESTAMP     |                      |
| updated_at            | TIMESTAMP     |                      |
| passenger_id          | BIGINT        | FOREIGN KEY (passenger_id) REFERENCES passengers(id) |

### baggage
Stores information about passenger baggage.

| Column                | Data Type     | Constraints          |
|-----------------------|---------------|----------------------|
| id                    | BIGINT        | PRIMARY KEY          |
| weight_in_kg          | DECIMAL(4,2)  |                      |
| created_date          | TIMESTAMP     |                      |
| updated_date          | TIMESTAMP     |                      |
| booking_id            | BIGINT        | FOREIGN KEY (booking_id) REFERENCES booking(bookingid) |

### flight_manifest
Stores information about flight manifests.

| Column                | Data Type     | Constraints          |
|-----------------------|---------------|----------------------|
| id                    | BIGINT        | PRIMARY KEY          |
| created_at            | TIMESTAMP     |                      |
| updated_at            | TIMESTAMP     |                      |
| booking_id            | BIGINT        | FOREIGN KEY (booking_id) REFERENCES booking(bookingid) |
| flight_id             | BIGINT        | FOREIGN KEY (flight_id) REFERENCES flights(flight_id) |

### boarding_pass
Stores information about boarding passes.

| Column                | Data Type     | Constraints          |
|-----------------------|---------------|----------------------|
| id                    | BIGINT        | PRIMARY KEY          |
| qr_code               | VARCHAR(65535)|                      |
| created_at            | TIMESTAMP     |                      |
| updated_at            | TIMESTAMP     |                      |
| booking_id            | BIGINT        | FOREIGN KEY (booking_id) REFERENCES booking(bookingid) |

### security_check
Stores information about security checks for passengers.

| Column                | Data Type     | Constraints          |
|-----------------------|---------------|----------------------|
| id                    | BIGINT        | PRIMARY KEY          |
| check_result          | VARCHAR(20)   |                      |
| comments              | VARCHAR(65535)|                      |
| created_at            | TIMESTAMP     |                      |
| updated_at            | TIMESTAMP     |                      |
| passenger_id          | BIGINT        | FOREIGN KEY (passenger_id) REFERENCES passengers(id) |

### baggage_check
Stores information about baggage checks.

| Column                | Data Type     | Constraints          |
|-----------------------|---------------|----------------------|
| id                    | BIGINT        | PRIMARY KEY          |
| check_result          | VARCHAR(50)   |                      |
| created_at            | TIMESTAMP     |                      |
| updated_at            | TIMESTAMP     |                      |
| booking_id            | BIGINT        | FOREIGN KEY (booking_id) REFERENCES booking(bookingid) |
| passenger_id          | BIGINT        | FOREIGN KEY (passenger_id) REFERENCES passengers(id) |
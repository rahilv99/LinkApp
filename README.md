# Link: A Social Networking App

This document provides a comprehensive overview of the Link application, a social networking app built using SwiftUI and Firebase.  Link allows users to connect with friends, create groups ("Circles"), and share location information (with permission).


## Features

* **User Authentication:** Secure user registration and login using email/password and phone number verification.
* **Profile Management:**  Users can create and manage their profiles, including name, email, phone number, school, and location.
* **Friend Discovery and Management:** Explore and add friends, view contact information, and manage friend lists.
* **Group Creation and Management ("Circles"):** Create groups, add/remove members, and manage location-sharing permissions within each group.
* **Location Sharing (with Permissions):** Share location data within groups, with user-controlled permissions.
* **Messaging (Future Feature):**  Planned functionality for direct messaging between users.


## Usage

The Link app provides a user-friendly interface for connecting with friends and managing groups. Users can create profiles, search for friends, join and create groups, and share their location with selected groups.  Navigation is intuitive through tabs and navigation links.


## Installation

This project requires Xcode and a Firebase account.  Clone the repository and open the Xcode project.  Configure your Firebase project and integrate the necessary Firebase SDKs.


## Technologies Used

* **SwiftUI:** The primary UI framework for building the user interface.
* **Firebase:** A backend platform providing authentication, database (Firestore), and storage services.
    * **Firebase Authentication:** Used for secure user authentication with email/password and phone number.
    * **Firebase Firestore:**  NoSQL document database storing user data and group information.
* **MapKit:** Used to display maps and location data.


## Dependencies

* Firebase SDKs (Authentication, Firestore)
* SwiftUI


## Contributing

Contributions are welcome! Please open issues or submit pull requests.


## Testing

Unit tests and UI tests are recommended but currently not fully implemented.




*README.md was made with [Etchr](https://etchr.dev)*
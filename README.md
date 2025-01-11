# egy_tour

a mobile application for tourists visiting Egypt to explore landmarks, museums, and other attractions across different Egyptian governorates
![th](https://github.com/user-attachments/assets/7de6e0b7-42ab-4d28-b1b8-c69c9bb36702)

## Screens

1. ### Login
    the login screen has two form fields for email and password
    below them is the login button which verifies the credentials entered and if they are correct navigates to home screen
    in the bottom of the page is the sign-up button which navigates to the sign-up screen in order to create a new account
    account data is stored in a hive box
2. ### Sign-up
    the sign-up screen has four fields:
        1. username
        2. email
        3. phone number
        4. password
    name must start with upper-case letter
    email must contain @
    password must be at least 6 characters
    on pressing the sign-up button, the data is stored in a hive box which can be later accessed to login and then navigate to the login screen
3. ### Home
    the home page has two tabs
        1. a grid of suggested places 
        2. a horizontal list of popular places
    each place is a card containing a photo of the place, the name and the government of the place with the ability to add any place into your favorites
4. ### Governments
    the governments screen contains three governments with each government having 2 landmarks
5. ### Favorites
    this screen displays the users chosen favorites
6. ### Profile
    this screen displays the users info(name, email, phone number, password(obscured))

packages used:
shared preferences
Hive
flutter localization
dartz

[ui design](https://www.figma.com/design/sBPzQg1RO0wmHxRJJHVtpZ/Egy-Tour?node-id=0-1&p=f&t=bnztC7PVr0QlNAls-0)

team members:
Mostafa Elzohirey( Coordinator)
Mahmoud Sobhi awad
Mohamed Salah
Ahmed Emad Mahmoud
Shaza Allam
Menna Raafat

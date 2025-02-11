# egy_tour

A mobile application for tourists visiting Egypt to explore landmarks, museums, and other attractions across different Egyptian governorates

![th](https://github.com/user-attachments/assets/7de6e0b7-42ab-4d28-b1b8-c69c9bb36702)

## Screens

1. ### Login
    the login screen has two form fields for email and password
    below them is the login button which verifies the credentials entered and if they are correct navigates to home screen
    in the bottom of the page is the sign-up button which navigates to the sign-up screen in order to create a new account
    account data is stored in a hive box
2. ### Sign-up
    the sign-up screen has four fields:
   * username
   * email
   * phone number
   * password 

   name must start with upper-case letter\
   email must contain @\
   password must be at least 6 characters\
   on pressing the sign-up button, the data is stored in a hive box which can be later accessed to login and then navigate to the login screen
3. ### Home
    the home page has two tabs
     * a grid of suggested places 
     * a horizontal list of popular places
     each place is a card containing a photo of the place, the name and the government of the place with the ability to add any place into your favorites
4. ### Governments
    the governments screen contains three governments with each government having 2 landmarks
5. ### Favorites
    this screen displays the users chosen favorites
6. ### Profile
    this screen displays the users info(name, email, phone number, password(obscured))

## Managers: 
all managers are made using bloc pattern
### Authentication Managers:
1. #### States: 
   * AuthInitial - initial state
   * AuthLoading - loading state
   * AuthAuthenticated - authenticated state when credentials are verified
   * AuthUnauthenticated - unauthenticated state when credentials are not correct
   * AuthError - error state to handle any type of error (authentication or network error)
   * ChangeObsecureTextState - state to change the visibility of the password field
   * ChangePickedCountryState - change the country code for the phone number

2. #### Events: 
   * LoginRequested - this event occurs when the user presses the login button and takes the email and password as required parameters to verify them
   * SignUpRequested - this even occurs when the user presses the sign-up button and takes the user model as a required parameter and searches for it in the users list stored in a hive box if it wasn't found adds the user in the users list 
   * LogoutRequested - this event occurs when the user presses the logout button
   * ChangeObsecureTextEvent - this event occurs when the user toggles the visibility of the password field in the login and sign-up screens
   * ChangePickedCountryEvent - this event occurs when the user changes the selected country in the phone number field in the sign-up screen

   
### Home Managers: 
1. #### States:
   * HomeInitial - initial state
   * ComparingBetweenLoadingListState - compares all places with th e list of favorites and marks the ones found as favorites
   * ToggleFavoritedState - toggles the the item to make it a favorite or remove it from favorites
   * ComparingBetweenListState - the state of success after comparing all places with the list of favorites
   * ComparingBetweenListFailureState - the state of failure after or during comparing all places with the list of favorites
   * SuccessToggleState - the state of success after toggling the item to make it a favorite or remove it from favorites
   * FailureToggleState - the state of failure in toggling the item to make it a favorite or remove it from favorites
 
2. #### Events:
   * ToggleItemInFavouriteEvent - occurs after the user presses the favorite button on a place
   * LoadAllPlacesDataEvent - loads all the places


### Places Managers:
1. #### States:
   * PlacesInitial - initial state
   * PlacesLoading - loading places state
   * PlacesLoaded - loading success state
   * PlacesUpdated - state for after updating a place
   * PlacesError - handles any error occurring during either Loading the places or updating a place
2. #### Events: 
   * LoadPlaces - triggers loading the places
   * LoadMorePlaces - triggers loading more places


### Firebase Implementation
- implemented firebase authentication on the login and sign-up screens and when creating a new user the data is stored in a cloud firestore database
- created a firestore collection for places that is used to load the places in the home page
- when adding or removing a place from favorites the data is updated in the firestore database in the user's document
- the user's favorites are stored in the users collection and is used to load the favorite places in the favorites screen
- the user's profile data is stored in the users collection and is used to load the profile data in the profile screen and can be updated in the profile screen 

### Location Access
- in the home screen added a button that navigates to a google maps page and shows the landmark's location
### Image picker
- used Image picker to enable the user to pick a profile picture from his gallery

### packages used:
- [Country Code Picker](https://pub.dev/packages/country_code_picker)
- [Build Runner](https://pub.dev/packages/build_runner)
- [Shared Preferences](https://pub.dev/packages/shared_preferences)
- [Hive Flutter](https://pub.dev/packages/hive_flutter)
- [Easy Localization](https://pub.dev/packages/easy_localization)
- [dartz](https://pub.dev/packages/dartz)
- [Flutter BLoC](https://pub.dev/packages/flutter_bloc)
- [Firebase core](https://pub.dev/packages/firebase_core)
- [Firebase Authentication](https://pub.dev/packages/firebase_auth)
- [Cloud Firestore](https://pub.dev/packages/cloud_firestore)
- [Image Picker](https://pub.dev/packages/image_picker)
- [Google Maps Flutter](https://pub.dev/packages/google_maps_flutter)

# [ui design](https://www.figma.com/design/sBPzQg1RO0wmHxRJJHVtpZ/Egy-Tour?node-id=0-1&p=f&t=bnztC7PVr0QlNAls-0)





### team members:
- Mostafa Elzohirey( Coordinator)
- Mahmoud Sobhi awad
- Mohamed Salah
- Ahmed Emad Mahmoud
- Shaza Allam
- Menna Raafat

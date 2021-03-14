# irisvision

Simple photo app for IrisVision test <br>

Gets dummy json users, albums, and photos and displays them in a simple GUI


#### App flow: <br>
##### Lauch/Splash screen
##### main.dart
  * sets up app, pushes loading screen <br>
##### LoadingScreen.dart
* gets user json data, loading UserScreen when done <br>
##### UserScreen.dart
  * shows list of users with links to Album and Info pages <br>
##### AlbumScreen.dart
  * shows list of user's albums, with links to PhotoScreen page for each album <br>
##### InfoScreen.dart
  * shows list of user attributes <br>
##### PhotoScreen.dart 
  * shows gridview of photos, each clickable to pull up a PhotoViewGallery <br>
##### json.dart
  * houses the json data getters and converter classes <br>


#### Bugs
 * On launch, there is sometimes a black flutter waiting screen that flashes for ~0.3 seconds. This seems to be related to this issue: https://stackoverflow.com/questions/63978396/launch-screen-not-working-on-ios-14-with-xcode-12. Most likely it is due to the choice of image for the splash screen, I did not spend time photoshopping it with the right dpi or attributes because that's unimportant for this demo.

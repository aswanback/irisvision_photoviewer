# irisvision

Simple photo app for IrisVision test <br>

Gets dummy json users, albums, and photos and displays them in a simple GUI


#### App flow: <br>
Lauch/Splash screen
main.dart //sets up app, pushes loading screen
LoadingScreen.dart //gets user json data, loading UserScreen when done
UserScreen.dart //shows list of users with links to Album and Info pages
AlbumScreen.dart //shows list of user's albums, with links to PhotoScreen page for each album
InfoScreen.dart //shows list of user attributes
PhotoScreen.dart //shows gridview of photos, each clickable to pull up a PhotoViewGallery
json.dart //houses the json data getters and converter classes

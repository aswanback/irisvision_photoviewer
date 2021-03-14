import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

// json.dart hols all the json fetching methods and formatting classes, they are all very similar

/*
Future<List> getUsers() and class User{}
Gets the full list of users from json, converts to better objects to work with
*/
Future<List> getUsers() async {
  final response = await http.get(Uri.https('jsonplaceholder.typicode.com', 'users'));
  if (response.statusCode == 200) {
    List UserList = (json.decode(response.body) as List).map((data) => User.fromJson(data)).toList();
    return UserList;
  } else {
    throw Exception("Couldn't load users");
  }
}

class User {
  final int id;
  final String name;
  final String username;
  final String email;
  final String phone;
  final String address;

  User({this.id, this.name, this.username,this.email,this.phone,this.address});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
      phone: json['phone'],
      address: json['address']['street']+', '+json['address']['suite']+', '+json['address']['city']+', '+json['address']['zipcode'],
    );
  }
}

/*
Future<List> getAlbums() and class Album{}
Gets the full list of albums from json, converts to better objects to work with
*/
Future<List> getAlbums() async {
  final response =
  await http.get(Uri.https('jsonplaceholder.typicode.com', 'albums'));
  if (response.statusCode == 200) {
    List AlbumList = (json.decode(response.body) as List)
        .map((data) => Album.fromJson(data))
        .toList();
    return AlbumList;
  } else {
    throw Exception("Couldn't load albums");
  }
}

class Album {
  final int userId;
  final int id;
  final String title;
  Album({this.userId, this.id, this.title});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}

/*
Future<List> getPhotos() and class Photo{}
Gets the full list of photos from json, converts to better objects to work with the metadata
*/
Future<List> getPhotos() async {
  final response = await http.get(Uri.https('jsonplaceholder.typicode.com', 'photos'));
  if (response.statusCode == 200) {
    List PhotoList = (json.decode(response.body) as List)
        .map((data) => Photo.fromJson(data))
        .toList();
    return PhotoList;
  } else {
    throw Exception("Couldn't load photos");
  }
}

class Photo {
  final int id;
  final int albumId;
  final String title;
  final String url;
  final String thumbnailUrl;

  Photo({this.id, this.albumId, this.title,this.url,this.thumbnailUrl});

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      id: json['id'],
      albumId: json['albumId'],
      title: json['title'],
      url: json['url'],
      thumbnailUrl: json['thumbnailUrl'],
    );
  }
}


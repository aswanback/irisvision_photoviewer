import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:irisvision/main.dart';
import 'package:irisvision/json.dart';

void main() {
  test('getUsers gets users correctly', () async {
    List UserList = await getUsers();
    expect(UserList.length, equals(10));
    expect(UserList.runtimeType.toString(), equals('List<User>'));
    expect(UserList[0].runtimeType, equals(User));
    expect(UserList[8].name, equals('Glenna Reichert'));
  });
  test('getAlbums gets users correctly', () async {
    List AlbumList = await getAlbums();
    expect(AlbumList.length, equals(100));
    expect(AlbumList.runtimeType.toString(), equals('List<Album>'));
    expect(AlbumList[0].runtimeType, equals(Album));
    expect(AlbumList[8].title, equals('saepe unde necessitatibus rem'));
    expect(AlbumList[57].title, equals("nulla illo consequatur aspernatur veritatis aut error delectus et"));
  });

  test('getPhotos gets users correctly', () async {
    List PhotoList = await getPhotos();
    expect(PhotoList.length, equals(5000));
    expect(PhotoList.runtimeType.toString(), equals('List<Photo>'));
    expect(PhotoList[0].runtimeType, equals(Photo));
    expect(PhotoList[3343].title, equals("quia et quis voluptatibus hic et voluptates expedita"));
  });

}

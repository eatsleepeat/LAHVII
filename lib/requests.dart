import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'dart:async';

import 'keys.dart';
import 'post.dart';
import 'package:flutter/cupertino.dart';

import 'package:http/http.dart' as http;

class Requests {
//  var url = 'http://169.254.111.186:8000';

//  static Future<String> getUnits(String category) async {
//    var response = await HttpClient().get(Uri.parse(""));
//    return response.body;
//  }

  static Future<File> uploadImage(File fileImg) async {
    var path = "/upload_image";
//    var postInfo = Provider.of<EcoPostInfo>(EcoPostInfo);

//    Future<String> networkImageToBase64(String imageUrl) async {
//      http.Response response = await http.get(imageUrl);
//      final bytes = response?.bodyBytes;
//      return (bytes != null ? base64Encode(bytes) : null);
//    }
//    final imgBase64Str = await networkImageToBase64('https://picsum.photos/250?image=9');
//    print(imgBase64Str);

    print("HERERE");
//    print("HERERE");

//    final pth = await _localPath;
//    File img = File.fromRawPath("assets/avatar2.jpg");
//    print("file: " + img.path);

//    final byteData = await rootBundle.load('assets/avatar2.jpg');
//
//    final file = File('${(await getTemporaryDirectory()).path}/$path');
//    File img = await file.writeAsBytes(byteData.buffer
//        .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
//    print()
    String base64Image = base64Encode(fileImg.readAsBytesSync());

//    String base64Image = base64Encode(img.readAsBytesSync());
    print("base");

    String fileName = fileImg.path.split("/").last;

    http.post("https://earth-hacks-eco-post.herokuapp.com" + path, body: {
      "image": base64Image,
      "name": fileName,
    }).then((res) {
      print("STATUS: " + res.statusCode.toString());
      print(base64Image);
    }).catchError((err) {
      print(err);
    });
    return fileImg;
//  }
  }

  static imageFromBase64(String _base64) {
    Uint8List bytes = base64.decode(_base64);
    Image img = Image.memory(bytes);
    return img;
  }

  static Future<File> uploadNewPost(File fileImg, String description,
      String handles, String hashtag, String challenges) async {
//    var postInfo = Provider.of<EcoPostInfo>(EcoPostInfo);

//    Future<String> networkImageToBase64(String imageUrl) async {
//      http.Response response = await http.get(imageUrl);
//      final bytes = response?.bodyBytes;
//      return (bytes != null ? base64Encode(bytes) : null);
//    }
//    final imgBase64Str = await networkImageToBase64('https://picsum.photos/250?image=9');
//    print(imgBase64Str);

    print("HERERE");
//    print("HERERE");

//    final pth = await _localPath;
//    File img = File.fromRawPath("assets/avatar2.jpg");
//    print("file: " + img.path);

//    final byteData = await rootBundle.load('assets/avatar2.jpg');
//
//    final file = File('${(await getTemporaryDirectory()).path}/$path');
//    File img = await file.writeAsBytes(byteData.buffer
//        .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
//    print()
//    String base64Image = base64Encode(fileImg.readAsBytesSync());

//    String base64Image = base64Encode(img.readAsBytesSync());
//    print("base");
    await uploadImageIMBB(fileImg, description, handles, hashtag, challenges);
    print("UPLOADING");

//    String fileName = fileImg.path.split("/").last;

    return fileImg;
//  }
  }

  static Future<List<Post>> getAllPosts() async {
    var path = "24";
    var result = await getResult(path);
    var postList = PostList.fromJson(result).posts;
    postList.forEach((element) {
      print(element.description);
    });
//    print(postList.for);
    return postList;
  }

  static Future<dynamic> postResult(String path) async {
    String requestUrl = 'https://earth-hacks-eco-post.herokuapp.com/';
    var request = await HttpClient().postUrl(Uri.parse(requestUrl + path));
    var response = await request.close();
    var contents =
        await response.transform(utf8.decoder).transform(json.decoder).single;
    return contents;
  }

  static Future<dynamic> getResult(String path) async {
    // String requestUrl = 'https://earth-hacks-eco-post.herokuapp.com/';
    String requestUrl = 'https://api.jsonbin.io/b/5f13342e9180616628442379/';
    var request = await HttpClient().getUrl(Uri.parse(requestUrl + path));
    var response = await request.close();
    var contents =
        await response.transform(utf8.decoder).transform(json.decoder).single;
    return contents;
  }

  static Future<String> uploadImageIMBB(File img, String description,
      String handles, String hashtag, String challenges) async {
    String imgBase64 = base64Encode(img.readAsBytesSync());
    String requestUrl = 'https://api.imgbb.com/1/upload';
    String imgLink = "";
    http.post(requestUrl, body: {
      "key": Keys.imgbbAPIKey,
      "image": imgBase64,
    }).then((res) async {
      print("STATUS: " + res.statusCode.toString());
      print(json.decode(res.body)["data"]["url"]);
      imgLink = json.decode(res.body)["data"]["url"];
      http.post("https://earth-hacks-eco-post.herokuapp.com" + "/send_post",
          body: {
            "image": imgLink == null ? "" : imgLink,
            "info": description == null ? "" : description,
            "name": "Dylan Theriot",
            "location": "Dallas, TX",
            "lat_lng": "33.071153, -96.704665",
            "timestamp": "1 minute ago",
            "challenge": challenges == null ? "" : challenges,
            "handle": handles == null ? "@dylantheriot" : handles,
            "hashtag": hashtag == null ? "" : hashtag,
            "profile_picture": imgLink == null ? "" : imgLink,
//      "name": fileName,
          }).then((res) {
        print("STATUS HEROKU: " + res.statusCode.toString());
//      print(base64Image);
      }).catchError((err) {
        print("Error: " + err.toString());
      });
    });
    return imgLink;
  }
}

import 'post.dart';
import 'requests.dart';
import 'post_card.dart';
import 'package:flutter/material.dart';

class ExplorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: Requests.getAllPosts(),
        // future: loadInfo(),
        builder: (BuildContext context, AsyncSnapshot<List<Post>> projectSnap) {
          switch (projectSnap.connectionState) {
            case ConnectionState.none:
              return new Text('No Data');
            case ConnectionState.waiting:
              return new CircularProgressIndicator();
            default:
              if (projectSnap.hasError)
                return new Text('Error: ${projectSnap.error}');
              else
                return ListView.builder(
                  reverse: true,
                  itemCount: projectSnap.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        new PostCard(
                          timestamp: projectSnap.data[index].timestamp,
                          hashtag: projectSnap.data[index].hashtag,
                          handle: projectSnap.data[index].handle,
                          description: projectSnap.data[index].description,
                          location: projectSnap.data[index].location,
                          likes: projectSnap.data[index].likes,
                          profPic: projectSnap.data[index].profPic,
                          lat: projectSnap.data[index].lat,
                          lon: projectSnap.data[index].lon,
                          name: projectSnap.data[index].name,
                          image: projectSnap.data[index].image,
                        ),
                        Divider(
                          thickness: 3,
                          indent: 12,
                          endIndent: 12,
                        )
                      ],
                    );
                  },
                );
          }
        },
      ),
    );
  }
}

import 'constants.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommentsPage extends StatefulWidget {
  @override
  _CommentsPageState createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  List<CommentRow> comments = new List<CommentRow>();
  String newComm = "";

  @override
  Widget build(BuildContext context) {
    setState(() {
      CommentRow cr1 = new CommentRow(
          image: 'pfp.jpg',
          comment: "Awesome work Warren!",
          name: "Matthew L.");
      comments.add(cr1);
      CommentRow cr2 = new CommentRow(
          image: 'girl1.png',
          comment: "Looks super cool! Will definitely try it myself :)",
          name: "Jeff B.");
      comments.add(cr2);
      CommentRow cr3 = new CommentRow(
          image: 'mel.png',
          comment:
              "Would love to try to buy a stock as well! You should send me a message and teach me about stocks!",
          name: "Mel G.");
      comments.add(cr3);
    });

    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText(
          "COMMENTS",
          style: GoogleFonts.teko(
              fontWeight: FontWeight.bold, letterSpacing: 6, fontSize: 30),
        ),
        backgroundColor: Constants.themeGreen,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 8,
              child: Container(
                child: SingleChildScrollView(
                  physics: ScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(child: TitleCommentRow()),
                      Divider(
                        color: Colors.grey,
                      ),
                      Container(
                        child: ListView(
                          shrinkWrap: true,
                          children: comments,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.only(left: 20),
                child: ListTile(
                  title: TextFormField(
                    // controller: _commentController,
//                    decoration:
//                        InputDecoration(labelText: 'Write a comment...'),
                    onFieldSubmitted: (comm) {
                      setState(() {
                        newComm = comm;
                      });
                    },
                  ),
                  trailing: OutlineButton(
                    onPressed: () {
                      print("PRESSED");
//                      print(newComm);
                      setState(() {
                        CommentRow cr1 = new CommentRow(
                            image: 'pfp.png',
                            comment: "hi",
                            name: "Matthew L.");
                        comments.add(cr1);
                      });
                    },
                    borderSide: BorderSide.none,
                    child: Text("Post"),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TitleCommentRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      child: ListTile(
        title: Row(
          children: [
            CircularProfileAvatar(
              '',
              child: Image(
                  image: AssetImage(
                    'assets/neil.jpg',
                  ),
                  fit: BoxFit.cover),
              radius: 25,
              borderColor: Constants.themeGreen,
              borderWidth: 4,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 2),
                      child: AutoSizeText("Warren Buffet"),
                    ),
                    Container(),
                    Text(
                      "So Cool! Had so much fun researching stocks and investing!",
                      style: GoogleFonts.monda(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CommentRow extends StatelessWidget {
  final String image;
  final String comment;
  final String name;

  CommentRow({this.image, this.comment, this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      child: ListTile(
        title: Row(
          children: [
            CircularProfileAvatar(
              '',
              child: Image.asset(
                "assets/$image",
                fit: BoxFit.cover,
              ),
              radius: 25,
              borderColor: Constants.themeGreen,
              borderWidth: 4,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 2),
                      child: AutoSizeText(name),
                    ),
                    Container(),
                    Text(
                      comment,
                      style: GoogleFonts.monda(),
                    ),
                    Row(
                      children: [
                        Text('Reply'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

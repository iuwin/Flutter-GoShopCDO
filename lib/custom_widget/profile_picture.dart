import 'package:flutter/material.dart';

class ProfilePicture extends StatelessWidget {
  Widget build(BuildContext context) {
    return Center(
      child: CircleAvatar(
        radius: 100.0,
        backgroundColor: Colors.black26,
        child: ClipOval(
          child: Stack(
            // overflow: Overflow.clip,
            children: [
              Positioned(
                // top: MediaQuery.of(context).size.height * .15,
                bottom: 0,
                right: 0,
                left: 0,
                child: GestureDetector(
                  onTap: () {
                    print('Clicked');
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * .10,
                    width: MediaQuery.of(context).size.width * 1,
                    color: Colors.blueGrey,
                    child: Icon(
                      Icons.add_a_photo,
                      size: 50.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

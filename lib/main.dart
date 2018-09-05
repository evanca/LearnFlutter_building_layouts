import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32.0),
      child: Row(
        children: [
          Expanded(
            child: Column( // Putting Column inside an Expanded widget stretches the column to use all remaining free space in the row
              crossAxisAlignment: CrossAxisAlignment.start, // Setting the crossAxisAlignment property to CrossAxisAlignment.start positions the column to the beginning of the row
              children: [
                Container( // Putting the first row of text inside a Container enables adding padding
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'Oeschinen Lake Campground',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text( // The second child in the Column, also text, displays as grey
                  'Kandersteg, Switzerland',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          Icon( // The last two items in the title row are a star icon, painted red, and the text “41”
            Icons.star,
            color: Colors.red[500],
          ),
          Text('41'),
        ],
      ),
    );
    //...
  }
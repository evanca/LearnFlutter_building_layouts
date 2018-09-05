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
            child: Column(
              // Putting Column inside an Expanded widget stretches the column to use all remaining free space in the row
              crossAxisAlignment: CrossAxisAlignment.start,
              // Setting the crossAxisAlignment property to CrossAxisAlignment.start positions the column to the beginning of the row
              children: [
                Container(
                  // Putting the first row of text inside a Container enables adding padding
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'Oeschinen Lake Campground',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  // The second child in the Column, also text, displays as grey
                  'Kandersteg, Switzerland',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          Icon(
            // The last two items in the title row are a star icon, painted red, and the text “41”
            Icons.star,
            color: Colors.red[500],
          ),
          Text('41'),
        ],
      ),
    );

    Column buildButtonColumn(IconData icon, String label) {
      // Since the code for building each row would be almost identical, it’s most efficient to create a nested function, such as buildButtonColumn(), which takes an Icon and Text, and returns a column with its widgets painted in the primary color
      Color color = Theme.of(context).primaryColor;

      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color),
          Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          ),
        ],
      );
    }

    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment
            .spaceEvenly, // Align the columns along the main axis using MainAxisAlignment.spaceEvenly to arrange the free space evenly before, between, and after each column
        children: [
          buildButtonColumn(Icons.call,
              'CALL'), // Build the row containing these columns by calling the function and passing the icon and text specific to that column
          buildButtonColumn(Icons.near_me, 'ROUTE'),
          buildButtonColumn(Icons.share, 'SHARE'),
        ],
      ),
    );

    Widget textSection = Container(
      // Define the text section, which is fairly long, as a variable
      padding: const EdgeInsets.all(
          32.0), // Put the text in a Container to enable adding 32 pixels of padding along each edge
      child: Text(
        '''
Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.
        ''',
        softWrap:
            true, // The softwrap property indicates whether the text should break on soft line breaks, such as periods or commas
      ),
    );

    return MaterialApp(
      // Create a Material app, an app can be run now on a real device or an emulator
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Top Lakes'),
        ),
        body: ListView(
          children: [
            Image.asset(
              'images/lake.jpg',
              width: 600.0,
              height: 240.0,
              fit: BoxFit
                  .cover, // BoxFit.cover tells the framework that the image should be as small as possible but cover its entire render box
            ),
            titleSection, // Assemble the pieces together. The widgets are arranged in a ListView, rather than a Column, because the ListView automatically scrolls when running the app on a small device
            buttonSection,
            textSection,
          ],
        ),
      ),
    );
  }
}

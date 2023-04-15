import 'package:flutter/material.dart';

class DescriptionScreen extends StatelessWidget {
  final String name, description, bannerurl, posterurl, vote, launch_on;

  const DescriptionScreen({
    required this.name,
    required this.description,
    required this.bannerurl,
    required this.posterurl,
    required this.vote,
    required this.launch_on,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: name != null ? Text(name) : const Text('Not Loaded'),
      ),
      body: ListView(children: [
        Container(
          height: 250,
          child: Stack(
            children: [
              Positioned(
                child: SizedBox(
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  child: Image.network(
                    bannerurl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                child: Text(
                  '⭐ Average Rating - $vote',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),
        Container(
            padding: const EdgeInsets.all(10),
            child: name != null
                ? Text(
                    name,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )
                : const Text('Not Loaded')),
        Container(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            'Releasing On - $launch_on',
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        Row(
          children: [
            SizedBox(
              height: 200,
              width: 100,
              child: Image.network(posterurl),
            ),
            Flexible(
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Text(
                  description,
                  style: const TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
            ),
          ],
        )
      ]),
    );
  }
}

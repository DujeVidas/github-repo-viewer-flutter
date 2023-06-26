import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class RepoCarousel extends StatelessWidget {
  final List<dynamic> repos;
  final Function(String) onRepoTap;

  const RepoCarousel({
    Key? key,
    required this.repos,
    required this.onRepoTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: repos.length,
      itemBuilder: (BuildContext context, int index, int realIndex) {
        final repo = repos[index];
        return Container(
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(0, 2),
                blurRadius: 6.0,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(repo['owner']['avatar_url']),
                radius: 20,
              ),
              title: Text(repo['name'], style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
              subtitle: Text(repo['description'] ?? 'No description'),
              onTap: () {
                onRepoTap(repo['html_url']);
              },
            ),
          ),
        );
      },
      options: CarouselOptions(
        height: 200,
        enableInfiniteScroll: false,
        enlargeCenterPage: true,
      ),
    );
  }
}



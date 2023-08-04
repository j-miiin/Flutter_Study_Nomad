import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon_episode_model.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Episode extends StatelessWidget {
  const Episode({
    super.key,
    required this.episode,
    required this.webtoon_id,
  });

  final String webtoon_id;
  final WebtoonEpisodeModel episode;

  onButtonTap() async {
    int episodeId = int.parse(episode.id);
    await launchUrlString(
        "https://comic.naver.com/webtoon/detail?titleId=$webtoon_id&no=${episodeId + 1}");
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onButtonTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: Colors.green.shade300,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                episode.title,
                style: TextStyle(color: Colors.white),
              ),
              Icon(
                Icons.chevron_right_rounded,
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}

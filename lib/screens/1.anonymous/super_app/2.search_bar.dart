import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../global.dart';

import '../../../components/users/users.dart';

class SearchAnonymousBar extends StatefulWidget {
  const SearchAnonymousBar({
    super.key,
  });

  @override
  State<SearchAnonymousBar> createState() => _SearchAnonymousBarState();
}

class _SearchAnonymousBarState extends State<SearchAnonymousBar> {
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisSize: MainAxisSize.max, children: [
      const SizedBox(width: 20.0, height: 70.0),
      Container(
          decoration: BoxDecoration(
            border: Border.all(width: .5, color: colorSecondary),
            shape: BoxShape.rectangle,
            color: Colors.transparent,
            borderRadius: const BorderRadius.all(Radius.circular(50)),
          ),
          width: MediaQuery.of(context).size.width - 90,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(width: 20.0, height: 30.0),
              const Icon(Icons.search_rounded),
              Padding(
                padding: const EdgeInsets.only(
                    right: 10, left: 10, top: 10, bottom: 10),
                child: DefaultTextStyle(
                  style: const TextStyle(fontSize: 15.0, color: colorSecondary),
                  child: AnimatedTextKit(
                    repeatForever: true,
                    pause: const Duration(milliseconds: 1000),
                    displayFullTextOnTap: true,
                    stopPauseOnTap: true,
                    animatedTexts: [
                      TyperAnimatedText('Search Oil indexes'),
                      TyperAnimatedText('Search Industrial fuels'),
                      TyperAnimatedText('Search High fuels'),
                    ],
                    onTap: () {
                      Navigator.of(context).pushNamed("/search");
                    },
                  ),
                ),
              ),
            ],
          )),
      const SizedBox(width: 10.0, height: 10.0),
      IconButton(

        onPressed: () => Navigator.of(context).pushNamed("/favorites"),
        icon: Icon(Icons.favorite_outline_rounded, ),
      ),
    ]);
  }
}

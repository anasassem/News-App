import 'package:firebase/module/webview/web_view_screen.dart';
import 'package:firebase/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

Widget buildArticleItem(article, context) => InkWell(
      onTap: () {
        navigateTo(context, WebViewScreen(url: article['url']));
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(children: [
          article['urlToImage'] != null
              ? Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image:
                            NetworkImage("${article['urlToImage']}", scale: 1),
                        fit: BoxFit.cover),
                  ),
                )
              : Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                  image: AssetImage("assets/news.jpg"),
                  fit: BoxFit.cover),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: SizedBox(
              height: 120,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      '"${article['title']}"',
                      style: Theme.of(context).textTheme.bodyText1,
                      maxLines: 3,
                      textAlign: TextAlign.right,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                  Text(
                    "${article['publishedAt']}",
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );

Widget myDivider() => const Padding(
      padding: EdgeInsets.all(8.0),
      child: Divider(
        thickness: 1,
        color: Colors.grey,
      ),
    );

Widget articlebuilder(list, {isSearch = false}) => list.isEmpty
    ? isSearch
        ? Container()
        : const Center(child: CircularProgressIndicator())
    : ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => buildArticleItem(list[index], context),
        separatorBuilder: (context, index) => myDivider(),
        itemCount: 10,
      );

void navigateTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (_) => widget));

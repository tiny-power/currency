// ignore_for_file: use_build_context_synchronously
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:currency/generated/l10n.dart';
import 'package:currency/providers/emoji_model.dart';
import 'package:currency/providers/recorder_model.dart';
import 'package:currency/routes/app_routes.dart';

class EditEventPage extends StatefulWidget {
  const EditEventPage({super.key});
  @override
  State<EditEventPage> createState() => _EditEventPageState();
}

class _EditEventPageState extends State<EditEventPage> with RouteAware {
  final TextEditingController _nameController = TextEditingController();
  int index = 0;
  String selected = S.current.custom_event;

  @override
  void initState() {
    final emojiModel = Provider.of<EmojiModel>(context, listen: false);
    emojiModel.queryData();
    super.initState();
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPopNext() {}

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  dynamic _onSelected(int i, String name) {
    setState(() {
      index = i;
      selected = name;
    });
    if (i == 0) {
      _nameController.text = '';
    } else {
      _nameController.text = name;
    }
  }

  void _onPressed() {
    FocusScope.of(context).requestFocus(FocusNode());
    if (_nameController.text == '') {
      EasyLoading.showToast('Event name is Required');
      return;
    }
    final recorderModel = Provider.of<RecorderModel>(context, listen: false);
    final emojiModel = Provider.of<EmojiModel>(context, listen: false);
    recorderModel.insert(
      _nameController.text,
      emojiModel.list[index]['icon'].toString(),
    );
    context.go('/');
  }

  void _onEditEmoji(int id) {
    context.push('/emoji', extra: {'id': id});
  }

  void _onDeleteEmoji(int id) {
    final emojiModel = Provider.of<EmojiModel>(context, listen: false);
    emojiModel.deleteById(id);
  }

  void _onAddEmoji() {
    context.push('/newEmoji');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      appBar: AppBar(
        title: Text(S.current.edit_event, style: TextStyle(fontSize: 18)),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(onPressed: _onAddEmoji, icon: Icon(Icons.add)),
          IconButton(onPressed: _onPressed, icon: Icon(Icons.done)),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: .all(12),
              child: TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  hintText: 'Event name',
                  filled: true,
                  fillColor: Theme.of(context).colorScheme.onPrimary,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: .circular(8),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: .circular(8),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                ),
              ),
            ),
            Consumer<EmojiModel>(
              builder: (context, emojiModel, child) {
                return Expanded(
                  child: Container(
                    padding: .only(right: 12, left: 12),
                    child: GridView(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisExtent: 110,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                      ),
                      children: List.generate(
                        emojiModel.list.length,
                        (i) => CupertinoContextMenu(
                          actions: [
                            CupertinoContextMenuAction(
                              trailingIcon: CupertinoIcons.doc_text_search,
                              child: Text('Edit'),
                              onPressed: () {
                                Navigator.pop(context);
                                _onEditEmoji(emojiModel.list[i]["id"]);
                              },
                            ),
                            if (emojiModel.list[i]["name"] != S.current.custom_event)
                              CupertinoContextMenuAction(
                                trailingIcon: CupertinoIcons.delete,
                                isDestructiveAction: true,
                                child: Text('Delete'),
                                onPressed: () {
                                  Navigator.pop(context);
                                  _onDeleteEmoji(emojiModel.list[i]["id"]);
                                },
                              ),
                          ],
                          child: GestureDetector(
                            onTap: () => _onSelected(
                              i,
                              emojiModel.list[i]["name"].toString(),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: .circular(12),
                                color:
                                    emojiModel.list[i]["name"].toString() ==
                                        selected
                                    ? Theme.of(
                                        context,
                                      ).colorScheme.errorContainer
                                    : Theme.of(context).colorScheme.onPrimary,
                                border: Border.all(
                                  color:
                                      emojiModel.list[i]["name"].toString() ==
                                          selected
                                      ? Theme.of(context).colorScheme.error
                                      : Theme.of(context).colorScheme.onPrimary,
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: .center,
                                crossAxisAlignment: .center,
                                children: [
                                  // Image.asset(
                                  //   'assets/emoji/${iconData[i]["icon"]}.png',
                                  //   width: 36,
                                  //   height: 36,
                                  // ),
                                  Text(
                                    emojiModel.list[i]["icon"].toString(),
                                    style: TextStyle(fontSize: 36),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    emojiModel.list[i]["name"].toString(),
                                    textAlign: .center,
                                    style: TextStyle(fontSize: 13),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

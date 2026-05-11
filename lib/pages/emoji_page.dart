// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:currency/generated/l10n.dart';
import 'package:currency/providers/emoji_model.dart';
import 'package:currency/routes/app_routes.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/foundation.dart' as foundation;

class EmojiPage extends StatefulWidget {
  final int id;
  const EmojiPage({super.key, required this.id});

  @override
  State<EmojiPage> createState() => _EmojiPageState();
}

class _EmojiPageState extends State<EmojiPage> with RouteAware {
  final TextEditingController _nameController = TextEditingController();
  String emojiName = '🍋';

  @override
  void initState() {
    selectById();
    super.initState();
  }

  Future<void> selectById() async {
    final emojiModel = Provider.of<EmojiModel>(context, listen: false);
    Map<dynamic, dynamic> result = await emojiModel.selectById(widget.id);
    _nameController.text = result['name'];
    setState(() {
      emojiName = result['icon'];
    });
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

  void _onPressed() {
     FocusScope.of(context).requestFocus(FocusNode());
    if (_nameController.text == '') {
      EasyLoading.showToast('Icon name is Required');
      return;
    }
    final emojiModel = Provider.of<EmojiModel>(context, listen: false);
    emojiModel.update(widget.id, _nameController.text, emojiName);
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      appBar: AppBar(
        title: Text(S.current.replace, style: TextStyle(fontSize: 18)),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(onPressed: _onPressed, icon: Icon(Icons.done)),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                padding: .all(12),
                child: TextField(
                  enabled: _nameController.text == S.current.custom_event
                      ? false
                      : true,
                  controller: _nameController,
                  decoration: InputDecoration(
                    hintText: 'Icon name',
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
                    disabledBorder: OutlineInputBorder(
                      borderRadius: .circular(8),
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                    prefixIconConstraints: BoxConstraints(minWidth: 48),
                    prefixIcon: Padding(
                      padding: .only(left: 10, top: 2),
                      child: Text(emojiName, style: TextStyle(fontSize: 28)),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: EmojiPicker(
                config: Config(
                  checkPlatformCompatibility: true,
                  viewOrderConfig: const ViewOrderConfig(),
                  emojiViewConfig: EmojiViewConfig(
                    backgroundColor: Theme.of(context).colorScheme.surface,
                    emojiSizeMax:
                        28 *
                        (foundation.defaultTargetPlatform == TargetPlatform.iOS
                            ? 1.2
                            : 1.0),
                  ),
                  skinToneConfig: const SkinToneConfig(),
                  categoryViewConfig: CategoryViewConfig(
                    backgroundColor: Theme.of(context).colorScheme.surface,
                  ),
                  bottomActionBarConfig: const BottomActionBarConfig(
                    enabled: false,
                  ),
                ),
                onEmojiSelected: (category, emoji) {
                  setState(() {
                    emojiName = emoji.emoji;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

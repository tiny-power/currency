// ignore_for_file: use_build_context_synchronously, deprecated_member_use

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:purchases_ui_flutter/purchases_ui_flutter.dart';
import 'package:currency/generated/l10n.dart';
import 'package:currency/providers/purchage_model.dart';
import 'package:currency/providers/seconder_model.dart';
import 'package:currency/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:currency/providers/recorder_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with RouteAware {
  final List<Map<String, Object>> colorList = [
    {"background": 0xFFC6F2D6, "border": 0xFF16A34A},
    {"background": 0xFFFFE6E6, "border": 0xFFEF4444},
    {"background": 0xFFD2DEF8, "border": 0xFFA2BBF0},
    {"background": 0xFFE3D9F6, "border": 0xFF7C3AED},
    {"background": 0xFFFBE1CF, "border": 0xFFF97316},
    {"background": 0xFFF6E394, "border": 0xFFFACC15},
    {"background": 0xFFBFCFE8, "border": 0xFF00296B},
  ];
  bool copied = false;
  int index = -1;

  @override
  void initState() {
    final recorderModel = Provider.of<RecorderModel>(context, listen: false);
    recorderModel.queryData();
    super.initState();
    purchasesListener();
  }

  void purchasesListener() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Purchases.addCustomerInfoUpdateListener((customerInfo) {
        bool isPro =
            customerInfo.entitlements.all["LastTime Pro"]?.isActive ?? false;
        if (isPro) {
          final purchageModel = Provider.of<PurchageModel>(
            context,
            listen: false,
          );
          purchageModel.evaluate(true);
        } else {
          final purchageModel = Provider.of<PurchageModel>(
            context,
            listen: false,
          );
          purchageModel.evaluate(false);
        }
      });
    });
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void didPopNext() {}

  void deleteById(int index, String id) {
    final recorderModel = Provider.of<RecorderModel>(context, listen: false);
    recorderModel.deleteById(index, id);
  }

  void _onPressed() async {
    final recorderModel = Provider.of<RecorderModel>(context, listen: false);
    if (recorderModel.list.isNotEmpty) {
      final purchageModel = Provider.of<PurchageModel>(context, listen: false);
      if (purchageModel.value) {
        context.push('/newEvent');
      } else {
        await RevenueCatUI.presentPaywall();
      }
    } else {
      context.push('/newEvent');
    }
  }

  void _onSelected(int i, int id) {
    setState(() {
      index = i;
      copied = true;
    });
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        copied = false;
      });
    });
    final recorderModel = Provider.of<RecorderModel>(context, listen: false);
    recorderModel.update(id, DateTime.now().millisecondsSinceEpoch);
  }

  Future<void> _onPruchage() async {
    await RevenueCatUI.presentPaywall();
  }

  Widget buildIcon(RecorderModel recorderModel, int i) {
    if (copied && i == index) {
      return Container(
        margin: .only(top: 10, bottom: 10),
        padding: .all(4),
        decoration: BoxDecoration(
          borderRadius: .circular(36),
          color: Color(0xFF22c55e),
        ),
        child: Icon(Icons.check, size: 32, color: Colors.white),
      );
    } else {
      return Text(
        recorderModel.list[i]["icon"],
        style: TextStyle(fontSize: 42),
      );
    }
  }

  Widget buildRecord(RecorderModel recorderModel) {
    if (recorderModel.list.isEmpty) {
      return Center(
        child: GestureDetector(
          onTap: _onPressed,
          child: Column(
            mainAxisAlignment: .center,
            crossAxisAlignment: .center,
            spacing: 18,
            children: [
              Image.asset('assets/icon.png', width: 120, height: 120),
              Text(S.current.slogan, style: TextStyle(fontSize: 18)),
              SizedBox(height: 36),
            ],
          ),
        ),
      );
    } else {
      final locale = WidgetsBinding.instance.platformDispatcher.locale;
      double screenWidth = MediaQuery.of(context).size.width;
      return Column(
        children: [
          Consumer<SeconderModel>(
            builder: (context, seconderModel, child) {
              return SizedBox(
                height: locale.languageCode != 'zh'
                    ? 12
                    : seconderModel.defaultSecond == 0
                    ? 12
                    : 72,
              );
            },
          ),
          Expanded(
            child: Container(
              padding: .only(right: 16, left: 16),
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 136,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                ),
                children: List.generate(
                  recorderModel.list.length,
                  (i) => CupertinoContextMenu(
                    actions: [
                      CupertinoContextMenuAction(
                        trailingIcon: CupertinoIcons.delete,
                        isDestructiveAction: true,
                        child: Text(S.current.delete),
                        onPressed: () {
                          Navigator.pop(context);
                          deleteById(i, recorderModel.list[i]['id'].toString());
                        },
                      ),
                    ],
                    child: GestureDetector(
                      onTap: () => _onSelected(i, recorderModel.list[i]['id']),
                      child: Container(
                        width: (screenWidth - 36) / 2,
                        height: 136,
                        decoration: BoxDecoration(
                          borderRadius: .circular(12),
                          color: Color(
                            colorList[i % 7]['background'] as int,
                          ).withOpacity(0.5),
                          border: Border.all(
                            color: Color(
                              colorList[i % 7]['border'] as int,
                            ).withOpacity(0.5),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: .center,
                          crossAxisAlignment: .center,
                          children: [
                            buildIcon(recorderModel, i),
                            Container(
                              padding: .only(left: 2, right: 2),
                              child: Text(
                                recorderModel.list[i]["name"].toString(),
                                textAlign: .center,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: .bold,
                                ),
                              ),
                            ),
                            Text(
                              recorderModel.list[i]["record_time"] != null
                                  ? timeago.format(
                                      DateTime.fromMillisecondsSinceEpoch(
                                        recorderModel.list[i]["record_time"],
                                      ),
                                    )
                                  : S.current.never_logged,
                              textAlign: .center,
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        title: Text(S.current.app_name, style: TextStyle(fontSize: 18)),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          onPressed: _onPruchage,
          icon: Icon(Icons.diamond_outlined, color: Color(0xFFFACC15)),
        ),
        actions: [IconButton(onPressed: _onPressed, icon: Icon(Icons.add))],
      ),
      body: Stack(
        children: [
          SafeArea(
            child: Consumer<RecorderModel>(
              builder: (context, recorderModel, child) {
                return buildRecord(recorderModel);
              },
            ),
          ),
        ],
      ),
    );
  }
}

// ignore_for_file: use_build_context_synchronously
import 'package:currency/providers/currency_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';
import 'package:currency/generated/l10n.dart';
import 'package:currency/routes/app_routes.dart';

class NewEventPage extends StatefulWidget {
  const NewEventPage({super.key});
  @override
  State<NewEventPage> createState() => _NewEventPageState();
}

class _NewEventPageState extends State<NewEventPage> with RouteAware {
  @override
  void initState() {
    final currencyModel = Provider.of<CurrencyModel>(context, listen: false);
    currencyModel.queryData();
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

  void onDetailTap() {
    context.go('/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.add_currency, style: TextStyle(fontSize: 18)),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Consumer<CurrencyModel>(
          builder: (context, currencyModel, child) {
            return Container(
              margin: .only(top: 12, bottom: 12),
              child: ListView.separated(
                itemCount: currencyModel.list.length,
                cacheExtent: 56,
                separatorBuilder: (context, index) {
                  return Divider(thickness: 0.25);
                },
                itemBuilder: (context, index) {
                  return GestureDetector(
                    behavior: .opaque,
                    onTap: () => onDetailTap(),
                    child: Container(
                      padding: .only(left: 12, right: 12, top: 2, bottom: 2),
                      child: Row(
                        spacing: 12,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.outlineVariant,
                                  blurRadius: 8,
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: .circular(6),
                              child: Image.asset(
                                'assets/finance/${currencyModel.list[index]['name']}.webp',
                                width: 60,
                                height: 40,
                                cacheWidth: 60,
                                cacheHeight: 40,
                                fit: .fill,
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: .start,
                            children: [
                              Text(
                                currencyModel.list[index]['name'],
                                style: TextStyle(fontWeight: .bold),
                              ),
                              Text(
                                currencyModel.list[index]['desc'],
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

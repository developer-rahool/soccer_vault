import 'package:flutter/material.dart';
import 'package:soccer_vault/const.dart';

class DetailPage extends StatefulWidget {
  Widget? child;
  Function()? copyWidget;
  DetailPage({super.key, this.child, this.copyWidget});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBlackColor,
      appBar: AppBarWidget(title: "Detail"),
      body: Padding(
        padding: mainPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Card(
              color: Colors.white,
              child: Padding(padding: mainPadding, child: widget.child),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: SizedBox(
                width: double.infinity,
                child: CustomButton(
                    text: "Copy",
                    onPressed: () {
                      toast(context);
                      widget.copyWidget;
                      Navigator.pop(context);
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}

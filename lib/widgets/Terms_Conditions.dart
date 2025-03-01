import 'package:flutter/material.dart';
import 'package:store_app/widgets/Check_icon.dart';

class TermsConditions extends StatefulWidget {
  const TermsConditions({super.key, required this.onChanged});
  final ValueChanged<bool> onChanged;

  @override
  State<TermsConditions> createState() => _TermsConditionsState();
}

class _TermsConditionsState extends State<TermsConditions> {
  bool isaccepted = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      trailing: CheckIcon(
        isclick: isaccepted,
        onChanged: (value) {
          isaccepted = value;
          widget.onChanged(value);
          setState(() {});
        },
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "الشروط",
            // style:
            //     TextStyles.semiBold13.copyWith(color: const Color(0xff2D9F5D)),
          ),
          Text(
            ' من خلال إنشاء حساب ، فإنك توافق على ',
            // style:
            //     TextStyles.semiBold13.copyWith(color: const Color(0xff949D9E)),
          ),
        ],
      ),
      subtitle: Text(
        "والأحكام الخاصة بنا",
        textDirection: TextDirection.rtl,
        // style: TextStyles.semiBold13.copyWith(color: const Color(0xff2D9F5D)),
      ),
    );
  }
}

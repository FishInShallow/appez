
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CircleCheckbox extends StatelessWidget {

  final RxBool checked;
  final Function()? onChanged;
  const CircleCheckbox(this.checked,{super.key, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Obx(()=>Material(
      color: Colors.transparent,
      clipBehavior: Clip.hardEdge,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: () {checked.toggle();onChanged;},
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Icon(
            checked.isTrue ? Icons.check_circle : Icons.circle_outlined,
            color: checked.isTrue ? Get.theme.primaryColor : Get.theme.hintColor,
            size: 20,
          ),
        ),
      ),
    ));
  }
}
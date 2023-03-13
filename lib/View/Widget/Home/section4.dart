import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profile/Core/Controllers/home_controller.dart';
import 'package:profile/Core/Static/static.dart';

class Section4 extends GetView<HomeController> {
  const Section4({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Static.mainPadding(context),
      child: Column(
        children: [
          Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: Text(
                controller.homeData.contactMe,
                style: const TextStyle(
                  fontFamily: "hanimation",
                  fontSize: 30,
                  color: Colors.white,
                ),
              )),
          Form(
            key: controller.formKey,
            child: Column(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(.5),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          style: BorderStyle.solid,
                          color: Colors.white,
                          width: 2)),
                  child: TextFormField(
                    onSaved: (value) {
                      controller.subjectInputValue = value!.trim();
                    },
                    validator: (value) {
                      String? validateMessage =
                          value!.isEmpty ? "emptySubject".tr : null;
                      return validateMessage;
                    },
                    textInputAction: TextInputAction.next,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: controller.homeData.subject,
                        hintStyle: const TextStyle(color: Colors.white)),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(.7),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          style: BorderStyle.solid,
                          color: Colors.white,
                          width: 2)),
                  child: TextFormField(
                    onFieldSubmitted: (value) => controller.sendEmail(),
                    textInputAction: TextInputAction.send,
                    validator: (value) {
                      String? validateMessage =
                          value!.isEmpty ? "emptyMessage".tr : null;
                      return validateMessage;
                    },
                    onSaved: (value) {
                      controller.messageInputValue = value!.trim();
                    },
                    style: const TextStyle(color: Colors.white),
                    maxLines: 7,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: controller.homeData.message,
                        hintStyle: const TextStyle(color: Colors.white)),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () async => await controller.sendEmail(),
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(.7),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  style: BorderStyle.solid,
                                  color: Colors.white,
                                  width: 2)),
                          child: Text(
                            controller.homeData.send,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: InkWell(
                        onTap: () => controller.formKey.currentState!.reset(),
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(.7),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  style: BorderStyle.solid,
                                  color: Colors.white,
                                  width: 2)),
                          child: Text(
                            controller.homeData.clear,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

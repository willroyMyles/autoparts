import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wrg3/frontend/pages/create%20post/state.createPost.dart';

class InputOptionFormField extends StatelessWidget {
  final String label;
  final List<dynamic> options;
  final TextEditingController crtl;
  final ValueSetter<int>? callback;
  InputOptionFormField(
      {Key? key,
      required this.label,
      required this.options,
      required this.crtl,
      this.callback})
      : super(key: key);

  // final controller = Get.find<CreatePostState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 9),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(3),
            child: Text(
              label.capitalize!,
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600),
            ),
          ),
          InkWell(
            onTap: () async {
              var ans = await Get.bottomSheet(DraggableScrollableSheet(
                maxChildSize: 1,
                minChildSize: .2,
                initialChildSize: 1,
                builder: (context, scrollController) {
                  return LayoutBuilder(builder: (context, constraints) {
                    return Container(
                      // height: constraints.maxHeight,
                      color: Colors.white,
                      child: Column(
                        children: [
                          Expanded(
                            child: ListView.builder(
                              itemCount: options.length,
                              itemBuilder: (context, index) {
                                String e = options.elementAt(index).toString();
                                return Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 3),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 3),
                                  color: Colors.white,
                                  child: ListTile(
                                    title: Text(e),
                                    onTap: () {
                                      if (callback != null) {
                                        callback!(index);
                                      }
                                      Get.back(result: index);
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.all(10),
                            color: Colors.transparent,
                            child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(100),
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 10,
                                          color: Colors.black.withOpacity(.2))
                                    ]),
                                padding: EdgeInsets.all(15),
                                child: Icon(Icons.close)),
                          )
                        ],
                      ),
                    );
                  });
                },
              ));
              print(ans);
            },
            child: Container(
              height: 55,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(5)),
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: LayoutBuilder(builder: (context, con) {
                return IgnorePointer(
                  child: TextFormField(
                    controller: crtl,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        suffixIcon:
                            Icon(CupertinoIcons.chevron_up_chevron_down),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 0,
                            )),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 0,
                            ))),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class InputController {
  Function showDelete = () {};
  Function disposeDelete = () {};
  Function clear = () {};
}

class SearchInput extends StatefulWidget {
  const SearchInput({
    super.key,
    required this.onChanged,
    required this.onSubmitted,
    required this.inputController,
    required this.onClickDelete,
  });

  final ValueChanged<String> onChanged;
  final ValueChanged<String> onSubmitted;
  final VoidCallback onClickDelete;
  final InputController inputController;

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {


  final TextEditingController _filter = TextEditingController();
  bool showDelete = false;

  @override
  Widget build(BuildContext context) {
    // print("앱바 빌드");
    widget.inputController.showDelete = () {
      setState(() {
        showDelete = true;
      });
    };
    widget.inputController.disposeDelete = () {
      setState(() {
        showDelete = false;
      });
    };


    widget.inputController.clear = () {
      setState(() {
        _filter.clear();
      });
    };
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Expanded(
            flex: 6,
            child: TextField(
              // // controller: controller.nicknameController,
              // inputFormatters: <TextInputFormatter>[
              //   FilteringTextInputFormatter.allow(RegExp(r'[ㄱ-ㅎ|ㅏ-ㅣ|가-힣|ᆞ|ᆢ]')), // 검색창에 한글만 입력되게 하기
              // ],
              textInputAction: TextInputAction.go,
              onSubmitted: widget.onSubmitted,
              onChanged: widget.onChanged,
              style: const TextStyle(fontSize: 15, color: Colors.black),
              autofocus: true,
              controller: _filter,
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                filled: true,
                fillColor: Colors.black12,
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.black54,
                  size: 20,
                ),
                suffixIcon: showDelete
                    ? IconButton(
                        icon: const Icon(
                          Icons.cancel,
                          size: 20,
                        ),
                        onPressed: widget.onClickDelete,
                      )
                    : null,

                hintText: '검색',
                hintStyle: const TextStyle(color: Colors.black),
                labelStyle: const TextStyle(color: Colors.black),
                // errorBorder: InputBorder.none,
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

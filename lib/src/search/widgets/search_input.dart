import 'package:flutter/material.dart';

class SearchInput extends StatefulWidget {
  const SearchInput({
    super.key,
    required this.onChanged,
    required this.onSubmitted,
  });

  final ValueChanged<String> onChanged;
  final ValueChanged<String> onSubmitted;

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  final TextEditingController _filter = TextEditingController();

  FocusNode focusNode = FocusNode();
  String _searchText = "";

  bool get onDelete {
    return _searchText != "" && focusNode.hasFocus;
  }

  @override
  Widget build(BuildContext context) {
    // print("앱바 빌드");
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
              onSubmitted: (text) {
                widget.onSubmitted(_searchText);
                setState(() {
                  focusNode.unfocus();
                  _filter.clear();
                  _searchText = '';
                });
              },
              onChanged: (text) {
                if ((_searchText == '' && text != '') ||
                    (_searchText != '' && text == '')) {
                  setState(() {
                    _searchText = text;
                  });
                } else {
                  _searchText = text;
                }
                widget.onChanged(_searchText);
              },

              focusNode: focusNode,
              style: const TextStyle(fontSize: 15, color: Colors.black),
              autofocus: true,
              controller: _filter,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(8),
                filled: true,
                fillColor: Colors.black12,
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.black54,
                  size: 20,
                ),
                suffixIcon: onDelete
                    ? IconButton(
                        icon: const Icon(
                          Icons.cancel,
                          size: 20,
                        ),
                        onPressed: () {
                          setState(() {
                            _filter.clear();
                            _searchText = '';
                          });
                          widget.onChanged('');
                        },
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

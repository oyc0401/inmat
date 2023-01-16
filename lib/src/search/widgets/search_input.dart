import 'package:flutter/material.dart';

class InputController {
  Function clear = () {};
}

class SearchInput extends StatefulWidget {
  const SearchInput({
    super.key,
    required this.onChanged,
    required this.onSubmitted,
    required this.inputController,
    required this.onClickDelete,
    required this.showDelete,
  });

  final ValueChanged<String> onChanged;
  final ValueChanged<String> onSubmitted;
  final VoidCallback onClickDelete;
  final InputController inputController;
  final bool showDelete;

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  final TextEditingController _filter = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.inputController.clear = () {
      setState(() {
        _filter.clear();
      });
    };
  }

  @override
  Widget build(BuildContext context) {
    // print("앱바 빌드");
    return TextField(
      // // controller: controller.nicknameController,
      // inputFormatters: <TextInputFormatter>[
      //   FilteringTextInputFormatter.allow(RegExp(r'[ㄱ-ㅎ|ㅏ-ㅣ|가-힣|ᆞ|ᆢ]')), // 검색창에 한글만 입력되게 하기
      // ],

      textInputAction: TextInputAction.go,

      onSubmitted: widget.onSubmitted,
      onChanged: widget.onChanged,
      style: const TextStyle(fontSize: 14, color: Colors.black),
      autofocus: true,
      controller: _filter,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
        // contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        filled: true,
        fillColor: Colors.black12,
        prefixIcon: const Icon(
          Icons.search,
          color: Colors.black54,
          size: 20,
        ),
        suffixIcon: widget.showDelete
            ? IconButton(
                icon: const Icon(
                  Icons.cancel,
                  size: 20,
                ),
                onPressed: widget.onClickDelete,
              )
            : null,

        hintText: '검색',
        hintStyle: const TextStyle(color: Colors.black54),
        labelStyle: const TextStyle(color: Colors.black54),

        errorBorder: border(),
        focusedBorder: border(),
        enabledBorder: border(),
        border: border(),
      ),
    );
  }

  InputBorder border() {
    return const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.all(Radius.circular(10)));
  }
}

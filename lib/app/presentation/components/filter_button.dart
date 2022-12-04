import 'package:flutter/material.dart';

class FilterButton extends StatelessWidget {
  final Function()? onTap;
  final bool isFiltered;
  const FilterButton({this.isFiltered = false, this.onTap, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
              width: 0.7,
              color: isFiltered ? Colors.blue : Colors.black,
              style: BorderStyle.solid),
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 12, bottom: 12, top: 12, right: 20),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Text(
                  'Filters',
                  style:
                      TextStyle(color: isFiltered ? Colors.blue : Colors.black),
                ),
              ),
              Icon(
                Icons.filter_list_outlined,
                color: isFiltered ? Colors.blue : Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

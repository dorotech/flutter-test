import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/core/core.dart';
import 'package:rick_and_morty_app/features/list_characters/data/filter_inputs.dart';

class FilterUi extends StatefulWidget {
  const FilterUi({super.key, this.filterInputs});
  final FilterInputs? filterInputs;
  @override
  State<FilterUi> createState() => _FilterUiState();
}

class _FilterUiState extends State<FilterUi> {
  TextEditingController nameTextController = TextEditingController();
  EdgeInsets marginELevatedButton = const EdgeInsets.fromLTRB(4, 2, 4, 2);
  Gender? gender;
  Species? species;
  Status? status;
  @override
  void initState() {
    if (widget.filterInputs != null) {
      nameTextController.text = widget.filterInputs?.name ?? "";
      gender = genderValues.map[widget.filterInputs?.gender ?? ""];
      species = speciesValues.map[widget.filterInputs?.species ?? ""];
      status = statusValues.map[widget.filterInputs?.status ?? ""];
    }

    if (mounted) {
      setState(() {});
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
              constraints: !kIsWeb ? null : const BoxConstraints(maxWidth: 720),
              padding: const EdgeInsets.all(8.0),
              child: _fields()),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(100, 40),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextTitle(DefalutStrings.filter),
        ),
        onPressed: () {
          Navigator.pop(
              context,
              FilterInputs(
                name: nameTextController.text,
                gender: genderValues.reverse?[gender],
                species: speciesValues.reverse?[species],
                status: statusValues.reverse?[status],
              ));
        },
      ),
    );
  }

  Widget _fields() {
    return Column(
      mainAxisAlignment: kIsWeb ? MainAxisAlignment.center : MainAxisAlignment.start,
      crossAxisAlignment: kIsWeb ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        _textFormField(),
        const SizedBox(height: 40),
        TextTitle(DefalutStrings.selectGender),
        _listGender(),
        TextTitle(DefalutStrings.selectSpecie),
        _listSpecies(),
        TextTitle(DefalutStrings.selectStatus),
        _listStatus(),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(onPressed: _clean, child: Text(DefalutStrings.cleanInputs)),
          ],
        )
      ],
    );
  }

  Widget _textFormField() {
    BorderRadius borderRadius = const BorderRadius.all(Radius.circular(20.0));
    return TextField(
      controller: nameTextController,
      decoration: InputDecoration(
        labelText: DefalutStrings.searchName,
        border: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(color: Colors.grey.shade700),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(color: Colors.blue.shade900),
        ),
      ),
    );
  }

  /// Limpar campos
  void _clean() {
    setState(() {
      nameTextController.text = "";
      gender = null;
      species = null;
      status = null;
    });
  }

  ///
  /// Generos
  ///
  Widget _listGender() {
    return Wrap(
      children: [
        _elevatedButtonGender(Gender.female),
        _elevatedButtonGender(Gender.genderless),
        _elevatedButtonGender(Gender.male),
        _elevatedButtonGender(Gender.unknow),
      ],
    );
  }

  Widget _elevatedButtonGender(Gender gender) {
    return Container(
      margin: marginELevatedButton,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: this.gender == gender ? Colors.blue : Colors.grey),
          onPressed: () {
            setState(() {
              if (this.gender == gender) {
                this.gender = null;
              } else {
                this.gender = gender;
              }
            });
          },
          child: Text(genderValues.reverse?[gender] ?? "")),
    );
  }

  ///
  /// Species
  ///
  Widget _listSpecies() {
    return Wrap(
      children: [
        _elevatedButtonSpecies(Species.human),
        _elevatedButtonSpecies(Species.alien),
      ],
    );
  }

  Widget _elevatedButtonSpecies(Species species) {
    return Container(
      margin: marginELevatedButton,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: this.species == species ? Colors.blue : Colors.grey),
          onPressed: () {
            setState(() {
              if (this.species == species) {
                this.species = null;
              } else {
                this.species = species;
              }
            });
          },
          child: Text(speciesValues.reverse?[species] ?? "")),
    );
  }

  ///
  /// Status
  ///
  Widget _listStatus() {
    return Wrap(
      children: [
        _elevatedButtonStatus(Status.alive),
        _elevatedButtonStatus(Status.dead),
        _elevatedButtonStatus(Status.unknow),
      ],
    );
  }

  Widget _elevatedButtonStatus(Status status) {
    return Container(
      margin: marginELevatedButton,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: this.status == status ? Colors.blue : Colors.grey),
          onPressed: () {
            setState(() {
              if (this.status == status) {
                this.status = null;
              } else {
                this.status = status;
              }
            });
          },
          child: Text(statusValues.reverse?[status] ?? "")),
    );
  }
}

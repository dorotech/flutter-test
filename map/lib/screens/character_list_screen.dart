import 'package:expansion_card/expansion_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/app_colors.dart';
import '../cubit/rickandmorty_cubit.dart';
import '../cubit/rickandmorty_state.dart';

class CharacterListScreen extends StatefulWidget {
  const CharacterListScreen({Key? key}) : super(key: key);

  @override
  State<CharacterListScreen> createState() => _CharacterListScreenState();
}

class _CharacterListScreenState extends State<CharacterListScreen> {
  late RickandMortyCubit _cubit;

  int? _selectedIndex;
  String? _nameCharacter;
  String? _img;
  String? _gender;
  String? _status;
  String? _species;
  String? _type;

  bool nameVisible = true;
  bool genderVisible = true;
  bool statusVisible = true;
  bool speciesVisible = true;

  @override
  void initState() {
    _cubit = BlocProvider.of<RickandMortyCubit>(context);
    callCubit();
    super.initState();
  }

  void callCubit() {
    _cubit.getRickandMorty();
  }

  bool valuefirst = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: filtersSideMenu(),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "PERSONAGENS",
          style: GoogleFonts.sourceSansPro(
              backgroundColor: AppColors.black,
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w600),
        ),
        backgroundColor: AppColors.black,
      ),
      backgroundColor: AppColors.black,
      body: BlocConsumer<RickandMortyCubit, RickandMortyState>(
        listener: (context, state) {
          if (state is RickandMortyLoaded) {
            _selectedIndex = state.rickandMortyModel!.results.length;
          }
          if (state is RickandMortyError) {
            Scaffold.of(context);
            SnackBar(
              content: Text(state.error),
            );
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: characterList(state),
          );
        },
      ),
    );
  }

  ListView characterList(RickandMortyState state) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: ((context, index) {
          if (state is RickandMortyLoaded) {
            _nameCharacter = state.rickandMortyModel!.results[index].name;
            _img = state.rickandMortyModel!.results[index].image;
            _gender = state.rickandMortyModel!.results[index].gender;
            _status = state.rickandMortyModel!.results[index].status;
            _species = state.rickandMortyModel!.results[index].species;
            _type = state.rickandMortyModel!.results[index].type;
          }

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ExpansionCard(
                  background: Image.network(
                    _img!,
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Visibility(
                        visible: nameVisible,
                        child: Text(
                          _nameCharacter!,
                          style: GoogleFonts.sourceSansPro(
                              backgroundColor: AppColors.mainColor,
                              color: AppColors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Visibility(
                        visible: statusVisible,
                        child: Text(
                          _status!,
                          style: GoogleFonts.sourceSansPro(
                              backgroundColor: AppColors.black,
                              color: AppColors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Visibility(
                        visible: genderVisible,
                        child: Text(
                          _gender!,
                          style: GoogleFonts.sourceSansPro(
                              backgroundColor: AppColors.black,
                              color: AppColors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Visibility(
                        visible: speciesVisible,
                        child: Text(
                          _species!,
                          style: GoogleFonts.sourceSansPro(
                              backgroundColor: AppColors.black,
                              color: AppColors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        _type!,
                        style: GoogleFonts.sourceSansPro(
                            backgroundColor: AppColors.black,
                            color: AppColors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          );
        }),
        itemCount: _selectedIndex ?? 0);
  }

  Drawer filtersSideMenu() {
    return Drawer(
      backgroundColor: AppColors.mainColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
        child: Column(
          children: [
            Text(
              'FILTROS',
              style: GoogleFonts.sourceSansPro(
                  color: AppColors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  nameVisible = !nameVisible;
                });
              },
              child: Text(
                'Name',
                style: GoogleFonts.sourceSansPro(
                    color: AppColors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  statusVisible = !statusVisible;
                });
              },
              child: Text(
                'Status',
                style: GoogleFonts.sourceSansPro(
                    color: AppColors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  genderVisible = !genderVisible;
                });
              },
              child: Text(
                'Gender',
                style: GoogleFonts.sourceSansPro(
                    color: AppColors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  speciesVisible = !speciesVisible;
                });
              },
              child: Text(
                'Species',
                style: GoogleFonts.sourceSansPro(
                    color: AppColors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

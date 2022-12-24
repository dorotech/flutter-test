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
  String? _type;
  String? _status;
  @override
  void initState() {
    _cubit = BlocProvider.of<RickandMortyCubit>(context);
    callCubit();
    super.initState();
  }

  void callCubit() {
    _cubit.getRickandMorty();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "PERSONAGENS",
          style: GoogleFonts.sourceSansPro(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.w600),
        ),
        backgroundColor: AppColors.mainColor,
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
            child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: ((context, index) {
                  if (state is RickandMortyLoaded) {
                    _nameCharacter =
                        state.rickandMortyModel!.results[index].name;
                    _img = state.rickandMortyModel!.results[index].image;
                    _gender = state.rickandMortyModel!.results[index].gender;
                    _type = state.rickandMortyModel!.results[index].type;
                    _status = state.rickandMortyModel!.results[index].status;
                  }

                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SizedBox(
                      height: 100,
                      width: 100,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.mainColor,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                _nameCharacter!,
                                style: GoogleFonts.sourceSansPro(
                                    color: Colors.white,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w700),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                _status!,
                                style: GoogleFonts.sourceSansPro(
                                    color: Colors.white,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w700),
                              ),
                              SizedBox(
                                height: 80,
                                width: 80,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: NetworkImage(_img!),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
                itemCount: _selectedIndex ?? 0),
          );
        },
      ),
    );
  }
}

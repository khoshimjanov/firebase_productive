import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:productive/assets/constants/colors.dart';
import 'package:productive/assets/constants/images.dart';
import 'package:productive/core/widgets/note_item.dart';
import 'package:productive/features/notes/notes/presentation/bloc/notes/notes_bloc.dart';
import 'package:productive/features/tasks/data/models/status.dart';


class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
 
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title:  Text(
            'Notes',
            style: Theme.of(context).textTheme.headlineMedium!
                .copyWith(fontWeight: FontWeight.w700)
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(20),
              Text(
                "Books",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: white.withOpacity(0.5)),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 122,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          AppImages.passwordBook,
                        ),
                        const Gap(8),
                         Text(
                          "Password",
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 16,fontWeight: FontWeight.w500, color: white),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Image.asset(
                          AppImages.memorisBook,
                        ),
                        const Gap(8),
                         Text(
                          "Memories",
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 16,fontWeight: FontWeight.w500, color: white),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Image.asset(
                          AppImages.createBox,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Gap(25),
              Row(
                children: [
                  Expanded(
                      child: Text(
                        "Quick Notes",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: white.withOpacity(0.5)),
                      )),
                  Image.asset(
                    AppImages.plus,
                  ),
                ],
              ),
              const SizedBox(height: 24),
              BlocBuilder<NoteBloc, NoteState>(
                  builder: (context, state){
                    switch (state.status) {
                      case LoadingStatus.pure:
                        context.read<NoteBloc>().add(LoadNotes());
                        return const SizedBox();
                      case LoadingStatus.loading:
                        return const Center(child: CupertinoActivityIndicator());
                      case LoadingStatus.loadedWithSuccess:
                        return ListView.builder(
    
                          padding: const EdgeInsets.only(bottom: 24),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: state.allNotes.length,
                          itemBuilder: (context, index) {
                            return NoteItem(
                                note: state.allNotes[index],);
                    });
                      case LoadingStatus.loadedWithFailure:
                        return
                          const SizedBox();
                      default:
                        return const SizedBox();
                    }
                  }
              ),
              // const Gap(100),
            ],
          ),
        ),
            );
      }
    );
  }
}
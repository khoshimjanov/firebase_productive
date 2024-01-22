import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:productive/assets/constants/colors.dart';
import 'package:productive/assets/constants/images.dart';
import 'package:productive/features/notes/notes/data/models/notes.dart';
import 'package:productive/features/notes/notes/presentation/bloc/notes/notes_bloc.dart';

class NoteItem extends StatelessWidget {
  final NoteModel note;
  const NoteItem({required this.note, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Slidable(
          key:  ValueKey(note.id),
          endActionPane: ActionPane(
            extentRatio: 0.2,
            dismissible: DismissiblePane(onDismissed: () {
              context.read<NoteBloc>().add(DeleteNote(id: note.id));
            }),
            motion: const ScrollMotion(),
            children: [
              SlidableAction(
                borderRadius: BorderRadius.circular(8),
                onPressed: (value) {
                  context.read<NoteBloc>().add(DeleteNote(id: note.id));
                },
                backgroundColor: Colors.transparent,
                foregroundColor: Colors.red,
                icon: Icons.delete ,
                label: 'Delete',
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Container(
              color: textFieldBackgroundColor,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        note.title,
                        style: Theme.of(context).textTheme.bodyLarge!
                            .copyWith(fontSize: 18,fontWeight: FontWeight.w700),
                      ),
                      const Gap(4),
                      Text(note.desc,
                          style: Theme.of(context).textTheme.bodySmall!
                              .copyWith(fontSize: 14,fontWeight: FontWeight.w500,color: white.withOpacity(0.6))),
                      const Gap(8),
                      Row(
                        children: [
                          Text(
                            getProperTime(note.createdDay),
                            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              color: white,fontSize: 12
                            ),
                          ),
                          const Gap(12),
                          if (note.voiceIcon) ...{Image.asset(AppImages.voice)}
                        ],
                      ),
                    ],
                  )),
                  if (note.image != null) ...{
                    SizedBox(
                      width: 40,
                      height: 40,
                      child: Image.asset(note.image!),
                    )
                  }
                ],
              ),
            ),
          ),
        ));
  }

  String getProperTime(DateTime date) {
    final day = date.day;
    String? month;
    switch (date.month) {
      case 1:
        month = 'January';
        break;
      case 2:
        month = 'February';
        break;
      case 3:
        month = 'March';
        break;
      case 4:
        month = 'April';
        break;
      case 5:
        month = 'May';
        break;
      case 6:
        month = 'June';
        break;
      case 7:
        month = 'July';
        break;
      case 8:
        month = 'August';
        break;
      case 9:
        month = 'September';
        break;
      case 10:
        month = 'October';
        break;
      case 11:
        month = 'November';
        break;
      case 12:
        month = 'December';
        break;
      default:
        month = 'Invalid month';
    }
    return '$day $month';
  }
}
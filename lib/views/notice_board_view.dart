import 'package:cse_connect/model/notice_board_model.dart';
import 'package:cse_connect/view_model/notice_board_view_model.dart';
import 'package:cse_connect/views/base_view.dart';
import 'package:cse_connect/widgets/loader.dart';
import 'package:flutter/material.dart';
class NoticeBoard extends StatefulWidget {
  const NoticeBoard({super.key});

  @override
  State<NoticeBoard> createState() => _NoticeBoardState();
}

class _NoticeBoardState extends State<NoticeBoard> {
  @override
  Widget build(BuildContext context) {
    return BaseView<NoticeBoardViewModel>(
      onModelReady: (model){
        model.onModelReady();
      },
        builder: (context,model,child)
            {
              return Scaffold(
                body: SafeArea(
                  child: model.isBusy
                      ? const Center(child: Loader())
                      : CustomScrollView(
                    slivers: [
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                              (context, index) {
                            final noticeBoard = model!.noticeBoard[index];
                            return NoticeCard(noticeBoard: noticeBoard);
                          },
                          childCount: model!.noticeBoard.length,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
    );
  }
}


class NoticeCard extends StatelessWidget {
  const NoticeCard({super.key,required this.noticeBoard});
  final NoticeBoardModel noticeBoard;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        color: Theme.of(context).colorScheme.tertiaryFixed.withOpacity(0.25),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          noticeBoard.name,
                          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            color: Theme.of(context).colorScheme.secondary,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        // const SizedBox(height: 2),
                        Text(
                          noticeBoard.designation,
                          style:  Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: Theme.of(context).colorScheme.secondary,
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Text(
                  //   timeago.format(noticeBoard.time),
                  //   style: TextStyle(
                  //     fontSize: 10,
                  //     color: ThemeService.secondaryBackgroundColor,
                  //   ),
                  // ),
                ],
              ),
              const SizedBox(height: 12),
              // Text(
              //   "hello",
              //   style:  Theme.of(context).textTheme.titleMedium?.copyWith(
              //     color: Theme.of(context).colorScheme.secondary,
              //     fontWeight: FontWeight.w400,
              //       fontSize: 18
              //
              //   ),
              // ),
              // const SizedBox(height: 8),
              Text(
                noticeBoard.message,
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.w200,
                  fontSize: 16
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
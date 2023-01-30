import 'package:appsize/appsize.dart';
import 'package:client/client.dart';
import 'package:data_persistence/data_persistence.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weappear/home/cubit/home_cubit.dart';
import 'package:weappear/home/widgets/create_modal.dart';
import 'package:weappear/home/widgets/home_option_modal.dart';
import 'package:weappear_localizations/weappear_localizations.dart';
import 'package:weappear_ui/weappear_ui.dart';

class PageHome extends StatelessWidget {
  const PageHome({super.key});
  static String get name => 'home';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(
        dataPersistenceRepository: context.read<DataPersistenceRepository>(),
        client: context.read<Client>(),
      ),
      child: const ViewHome(),
    );
  }
}

class ViewHome extends StatelessWidget {
  const ViewHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: WeappearAppbar(
        title: context.l10n.home,
      ),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20.sp, left: 20.sp),
                child: Text(
                  context.l10n.proyects,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(height: 10.sp),
              Divider(
                color: const Color(0xffDADADA),
                thickness: 1.sp,
              ),
            ],
          ),
          Align(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 86.sp,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 132.sp,
                    child: SvgPicture.asset(
                      'assets/images/Group 1029.svg',
                    ),
                  ),
                  SizedBox(
                    height: 20.sp,
                  ),
                  Text(
                    context.l10n.homeText,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xffC9C8C8),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(right: 15.sp, bottom: 20.sp),
        child: WeappearFloatingActionButton(
          onPressed: () async {
            final option = await HomeOptionsModal.show(context);
            if (option == null) return;
            switch (option) {
              case HomeOption.create:
                CreateModal.show(context);
                break;
              case HomeOption.join:
                // TODO: Handle this case.
                break;
              case HomeOption.find:
                // TODO: Handle this case.
                break;
            }
          },
        ),
      ),
    );
  }
}

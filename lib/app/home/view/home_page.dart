import 'package:appsize/appsize.dart';
import 'package:client/client.dart';
import 'package:data_persistence/data_persistence.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weappear_localizations/weappear_localizations.dart';
import 'package:weappear_ui/weappear_ui.dart';

import '../cubit/home_cubit.dart';

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
      child: ViewHome(),
    );
  }
}

class ViewHome extends StatelessWidget {
  const ViewHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      appBar: WeappearAppbar(
        title: context.l10n.home.toUpperCase(),
        onPressed: () {},
        sizedBoxWidth: 105.sp,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 45.sp, left: 33.sp),
            child: Text(
              'Proyectos',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: SvgPicture.asset(
              'assets/images/group_1029.svg',
            ),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(right: 15.sp, bottom: 20.sp),
        child: WeappearFloatingActionButton(
          onPressed: () {},
        ),
      ),
    );
  }
}

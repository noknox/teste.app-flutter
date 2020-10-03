import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:teste_app_flutter/app_localization.dart';
import 'package:teste_app_flutter/core/di/application_container.dart';
import 'package:teste_app_flutter/core/navigation/application_route.dart';
import 'package:teste_app_flutter/feature/pet/presentation/bloc/pet_list_bloc.dart';
import 'package:teste_app_flutter/feature/pet/presentation/bloc/pet_list_state.dart';
import 'package:teste_app_flutter/ui/theme/app_theme.dart';
import 'package:teste_app_flutter/ui/theme/dimens.dart';
import 'package:teste_app_flutter/ui/theme/widget/app_bar/primary_app_bar.dart';
import 'package:teste_app_flutter/ui/theme/widget/image/circle_image.dart';
import 'package:teste_app_flutter/ui/theme/widget/list/icon_list_item.dart';
import 'package:teste_app_flutter/ui/theme/widget/text/app_text_styles.dart';

class PetListPage extends StatefulWidget {
  final String _unitToken = 'fake_unit_token';

  @override
  _PetListPageState createState() => _PetListPageState();
}

class _PetListPageState extends State<PetListPage> {
  final refreshKey = GlobalKey<RefreshIndicatorState>();
  Completer<void> _refreshCompleter;
  ScrollController controller;

  @override
  void initState() {
    _refreshCompleter = new Completer();
    controller = new ScrollController()..addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.light;
    final bloc = ApplicationContainer.instance().resolve<PetListBloc>();

    return BlocProvider(
      create: (context) {
        bloc.beginRefresh(widget._unitToken);
        return bloc;
      },
      child: Theme(
        data: theme,
        child: Scaffold(
            appBar:
                PrimaryAppBar(title: getString(context, 'pet_list_page_title')),
            body: BlocBuilder<PetListBloc, PetListState>(
              builder: (context, state) {
                if (state is PetListLoadingState) {
                  // refreshKey.currentState.show();
                } else {
                  _refreshCompleter.complete();
                  _refreshCompleter = Completer<void>();
                }
                return _buildList(theme, bloc, state);
              },
            )),
      ),
    );
  }

  Widget _buildList(ThemeData theme, PetListBloc bloc, PetListState state) {
    final itemsCount =
        state.data.length + (state is PetListPagingState ? 1 : 0);
    return Column(
      children: [
        Expanded(
          child: RefreshIndicator(
            key: refreshKey,
            onRefresh: () async {
              bloc.beginRefresh(widget._unitToken);
              return _refreshCompleter.future;
            },
            child: ListView.separated(
                itemBuilder: (context, index) {
                  if (index == state.data.length) {
                    return Padding(
                      padding: EdgeInsets.all(Dimens.spacing),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                  final entity = state.data[index];
                  return IconListItem(
                    icon: CircleImage(
                        width: 36, height: 36, imageUrl: entity.photoUrl),
                    title: entity.name,
                    subtitle:
                        '${describeEnum(entity.breed.category)} - ${entity.breed.name}',
                    // onTap: () {
                    //   Navigator.of(context).pushNamed(ApplicationRoute.petList);
                    // }
                  );
                },
                controller: controller,
                separatorBuilder: (context, index) => Divider(),
                itemCount: itemsCount),
          ),
        )
      ],
    );
  }

  void _scrollListener() {
    // final delta = Dimens.spacingXLarge;
    // if (!(bloc.state is PetListPagingState) && (controller.offset + delta) >= controller.position.maxScrollExtent) {
    //   bloc.beginLoadNextPage();
    // }
  }
}

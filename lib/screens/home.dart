import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:webviewer/bloc/box/box_cubit.dart';
import 'package:webviewer/bloc/box/box_state.dart';
import 'package:webviewer/widgets/custom_sliver_appbar.dart';
import 'package:webviewer/widgets/web_page_tile.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  Widget _buildPagesList(BuildContext context, WebPagesBoxLoaded state) {
    return Column(
      children: state.webPages
          .map((webPage) => WebPageTile(webPage: webPage))
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: CustomSliverAppbar(),
            pinned: true,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: BlocBuilder<BoxCubit, BoxState>(
                builder: (context, state) {
                  if (state is WebPagesBoxLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is WebPagesBoxLoaded) {
                    return state.webPages.isEmpty
                        ? const Center(child: Text('No web pages saved'))
                        : _buildPagesList(context, state);
                  } else if (state is WebPagesBoxError) {
                    return Center(child: Text(state.message));
                  } else {
                    return const Center(child: Text('Unknown state'));
                  }
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/add'),
        child: const Icon(Icons.add),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_practice_bloc/features/homepage/presentation/bloc/homepage_bloc.dart';

class LazyLoading extends StatefulWidget {
  const LazyLoading({super.key});

  @override
  State<LazyLoading> createState() => _LazyLoadingState();
}

class _LazyLoadingState extends State<LazyLoading> {
  final ScrollController _scrollController= ScrollController();
  int _currentPage= 1;

  @override
  void initState() {
    super.initState();
    context.read<HomepageBloc>().add(FetchNameList(page: _currentPage));

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent- 200) {
        _loadMoreData();
      }
    });
  }

  void _loadMoreData() {
    final homepageBloc= context.read<HomepageBloc>();
    if (homepageBloc.state is NameListLoaded) {
      if (_currentPage ==2 ){
        setState(() {
          _currentPage= 1;
        });
      } else {
        setState(() {
          _currentPage++;
        });
      }
      homepageBloc.add(FetchNameList(page: _currentPage));
    }
    print('Load more data: $_currentPage');
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: _loadMoreData, 
                child: Text(
                  'PETEKKK'
                )
              ),
              Flexible(
                fit: FlexFit.loose,
                child: BlocBuilder<HomepageBloc, HomepageState>(
                  builder: (context, state) {
                    if (state is NameListLoaded) {
                      final name= state.nameList;
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        // controller: _scrollController,
                        itemCount: name.length + 1,
                        itemBuilder: (context, index) {
                          if (index < name.length) {
                            return ListTile(
                              title: Text(name[index].toString(),
                              style: TextStyle(
                                fontSize: 100,
                                fontWeight: FontWeight.bold,
                              ),),
                            );
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        }
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
} 
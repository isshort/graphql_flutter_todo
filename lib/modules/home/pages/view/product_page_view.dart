import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_graphql_todo/modules/home/data/data.dart';
import 'package:flutter_graphql_todo/modules/home/pages/logic/cubit/home_cubit.dart';
import 'package:flutter_graphql_todo/utils/pagination/pagination_mixin.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ProductPageView extends StatefulWidget {
  const ProductPageView({super.key});

  @override
  State<ProductPageView> createState() => _ProductPageViewState();
}

class _ProductPageViewState extends State<ProductPageView>
    with PaginationMixin<Product, ProductPageView> {
  @override
  Widget build(BuildContext context) {
    // print(fetchData(0));

    return Scaffold(
      appBar: AppBar(title: const Text('HomePage Title')),
      body: PagedListView<int, Product>(
        key: const Key('Product view'),
        pagingController: pagingContorler,
        builderDelegate: PagedChildBuilderDelegate<Product>(
          itemBuilder: (context, item, index) => const Card(
            child: ListTile(
              subtitle: Text('subtitle1'),
              title: Text('title1'),
            ),
          ),
        ),
      ),
      //  Column(
      //   children: [
      //     ElevatedButton(
      //       onPressed: () {
      //         return context.go('/sign/in');
      //       },
      //       child: const Text('Login page'),
      //     ),
      //     const SizedBox(
      //       height: 10,
      //     ),
      //     ElevatedButton(
      //       onPressed: () {
      //         return context.go('/sign/up');
      //       },
      //       child: const Text('Sign Up'),
      //     )
      //   ],
      // ),
    );
  }

  @override
  Future<List<Product>> fetchData(int page) async {
    final data = context.read<HomeCubit>().getProducts();
    // print(data);
    return data;
  }
}

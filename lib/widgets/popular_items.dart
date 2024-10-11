import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../Provider/popular_items_provider.dart';
import 'package:lesson_delivery_app_ui/screens/media_screen.dart';
import '/model/order.dart';
import '/data/data.dart';

class PopularItems extends StatelessWidget {
  const PopularItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PopularItemsProvider>(
      create: (_) => PopularItemsProvider(),
      child: Consumer<PopularItemsProvider>(
        builder: (_, popularitems, __){
          return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22.0),
              child: Text(
                'Tutorial Modules',
                style: GoogleFonts.cabin(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 18.0,
            ),
            SizedBox(
              height: 225.0,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                scrollDirection: Axis.horizontal,
                itemCount: currentUser.orders!.length,
                itemBuilder: (context, index) {
                  Order order = currentUser.orders![index];
                  return Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Container(
                      width: 165.0,
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                  child: SingleChildScrollView(
                  child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      new GestureDetector(
                      onTap: (){
                  print("Container clicked");
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) =>
                            MediaScreen(courseModule: order.courseModule)),
                  );
                  },
                       child:   ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0),
                            ),
                            child: Image.asset(
                              order.courseModule!.imageUrl!,
                              height: 95.0,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                      ),
                          const SizedBox(height: 10.0),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  order.courseModule!.name!,
                                  style: const TextStyle(
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4.0),
                                Text(
                                  order.tutor!.name!,
                                  style: TextStyle(
                                    fontSize: 11.0,
                                    color: Colors.grey[600],
                                  ),
                                ),
                                const SizedBox(height: 4.0),
                                Text(
                                  order.date!,
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'R${order.courseModule!.price!.toStringAsFixed(2)}',
                                  style: const TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Container(
                                  width: 32.0,
                                  height: 32.0,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    shape: BoxShape.circle,
                                  ),
                                  child: IconButton(
                                    onPressed: () {
                                      popularitems.addToCart(order);
                                      popularitems.loadHomePage();
                                    },
                                    icon: const Icon(
                                      Icons.add,
                                      size: 16.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                  ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    ));
  }
}

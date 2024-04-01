import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../main.dart';
import 'data.dart';

class SupabaseData {
  Future<List> getPopular() async {
    final res = await supabase.from('cars').select(
          '*,user_profile:added_by(*)',
        );
    print(res);
    return res;
  }

  getOneCar(id) async {
    final res = await supabase
        .from('cars')
        .select(
          '*,user_profile:added_by(*)',
        )
        .eq('id', id);
    print(res);
    return res;
  }

  Future<int> getLikes(carId) async {
    final res = await supabase
        .from('favorites')
        .select(
          '*',
          const FetchOptions(
            count: CountOption.exact,
          ),
        )
        .eq('car_id', carId);
    print(res.count);
    return res.count;
  }

  Future<List> getRecommended() async {
    List res = await supabase
        .from('cars')
        .select('*,user_profile:added_by(*)')
        .limit(10);
    return res;
  }

  Future<List> getFavorites() async {
    List res = await supabase
        .from('favorites')
        .select('*,furniture(*)')
        .eq('user_id', id)
        .limit(10);
    print(res);
    return res;
  }

  Future<List> getSearch(searchQuery) async {
    if (searchQuery == '' || searchQuery == null) {
      isloading = false;
      return [];
    }

    List res = await supabase
        .from('cars')
        .select('*,user_profile:added_by(*)')
        .ilike('manufacturer', '%$searchQuery%')
        .limit(10);
    isloading = false;
    return res;
  }

  Future<List> getSelectedCarPhotos(id) async {
    List selectedItem = await supabase
        .from('furniture_photos')
        .select('*')
        .eq('furniture_id', id);
    print(selectedItem);
    return selectedItem;
  }
}

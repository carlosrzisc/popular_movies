import 'package:hive_ce/hive.dart';
import 'package:popular_movies/hive/table/hive_movie.dart';

part 'hive_adapters.g.dart';

@GenerateAdapters([AdapterSpec<HiveMovie>()])
class HiveAdapters {}

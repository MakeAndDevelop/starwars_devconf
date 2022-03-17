abstract class Mapper<TSource, TDestination> {
  TDestination mapToDestination(TSource source);
  TSource mapToSource(TDestination destination);
}

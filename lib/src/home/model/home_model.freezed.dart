// // coverage:ignore-file
// // GENERATED CODE - DO NOT MODIFY BY HAND
// // ignore_for_file: type=lint
// // ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark
//
// part of 'home_model.dart';
//
// // **************************************************************************
// // FreezedGenerator
// // **************************************************************************
//
// T _$identity<T>(T value) => value;
//
// final _privateConstructorUsedError = UnsupportedError(
//     'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');
//
// /// @nodoc
// mixin _$HomeModel {
//   List<BannerModel> get banners => throw _privateConstructorUsedError;
//   List<TodayModel> get todays => throw _privateConstructorUsedError;
//   List<ReviewModel> get reviews => throw _privateConstructorUsedError;
//   List<RestaurantModel> get restaurants => throw _privateConstructorUsedError;
//
//   @JsonKey(ignore: true)
//   $HomeModelCopyWith<HomeModel> get copyWith =>
//       throw _privateConstructorUsedError;
// }
//
// /// @nodoc
// abstract class $HomeModelCopyWith<$Res> {
//   factory $HomeModelCopyWith(HomeModel value, $Res Function(HomeModel) then) =
//       _$HomeModelCopyWithImpl<$Res, HomeModel>;
//   @useResult
//   $Res call(
//       {List<BannerModel> banners,
//       List<TodayModel> todays,
//       List<ReviewModel> reviews,
//       List<RestaurantModel> restaurants});
// }
//
// /// @nodoc
// class _$HomeModelCopyWithImpl<$Res, $Val extends HomeModel>
//     implements $HomeModelCopyWith<$Res> {
//   _$HomeModelCopyWithImpl(this._value, this._then);
//
//   // ignore: unused_field
//   final $Val _value;
//   // ignore: unused_field
//   final $Res Function($Val) _then;
//
//   @pragma('vm:prefer-inline')
//   @override
//   $Res call({
//     Object? banners = null,
//     Object? todays = null,
//     Object? reviews = null,
//     Object? restaurants = null,
//   }) {
//     return _then(_value.copyWith(
//       banners: null == banners
//           ? _value.banners
//           : banners // ignore: cast_nullable_to_non_nullable
//               as List<BannerModel>,
//       todays: null == todays
//           ? _value.todays
//           : todays // ignore: cast_nullable_to_non_nullable
//               as List<TodayModel>,
//       reviews: null == reviews
//           ? _value.reviews
//           : reviews // ignore: cast_nullable_to_non_nullable
//               as List<ReviewModel>,
//       restaurants: null == restaurants
//           ? _value.restaurants
//           : restaurants // ignore: cast_nullable_to_non_nullable
//               as List<RestaurantModel>,
//     ) as $Val);
//   }
// }
//
// /// @nodoc
// abstract class _$$_HomeModelCopyWith<$Res> implements $HomeModelCopyWith<$Res> {
//   factory _$$_HomeModelCopyWith(
//           _$_HomeModel value, $Res Function(_$_HomeModel) then) =
//       __$$_HomeModelCopyWithImpl<$Res>;
//   @override
//   @useResult
//   $Res call(
//       {List<BannerModel> banners,
//       List<TodayModel> todays,
//       List<ReviewModel> reviews,
//       List<RestaurantModel> restaurants});
// }
//
// /// @nodoc
// class __$$_HomeModelCopyWithImpl<$Res>
//     extends _$HomeModelCopyWithImpl<$Res, _$_HomeModel>
//     implements _$$_HomeModelCopyWith<$Res> {
//   __$$_HomeModelCopyWithImpl(
//       _$_HomeModel _value, $Res Function(_$_HomeModel) _then)
//       : super(_value, _then);
//
//   @pragma('vm:prefer-inline')
//   @override
//   $Res call({
//     Object? banners = null,
//     Object? todays = null,
//     Object? reviews = null,
//     Object? restaurants = null,
//   }) {
//     return _then(_$_HomeModel(
//       banners: null == banners
//           ? _value._banners
//           : banners // ignore: cast_nullable_to_non_nullable
//               as List<BannerModel>,
//       todays: null == todays
//           ? _value._todays
//           : todays // ignore: cast_nullable_to_non_nullable
//               as List<TodayModel>,
//       reviews: null == reviews
//           ? _value._reviews
//           : reviews // ignore: cast_nullable_to_non_nullable
//               as List<ReviewModel>,
//       restaurants: null == restaurants
//           ? _value._restaurants
//           : restaurants // ignore: cast_nullable_to_non_nullable
//               as List<RestaurantModel>,
//     ));
//   }
// }
//
// /// @nodoc
//
// class _$_HomeModel implements _HomeModel {
//   _$_HomeModel(
//       {required final List<BannerModel> banners,
//       required final List<TodayModel> todays,
//       required final List<ReviewModel> reviews,
//       required final List<RestaurantModel> restaurants})
//       : _banners = banners,
//         _todays = todays,
//         _reviews = reviews,
//         _restaurants = restaurants;
//
//   final List<BannerModel> _banners;
//   @override
//   List<BannerModel> get banners {
//     if (_banners is EqualUnmodifiableListView) return _banners;
//     // ignore: implicit_dynamic_type
//     return EqualUnmodifiableListView(_banners);
//   }
//
//   final List<TodayModel> _todays;
//   @override
//   List<TodayModel> get todays {
//     if (_todays is EqualUnmodifiableListView) return _todays;
//     // ignore: implicit_dynamic_type
//     return EqualUnmodifiableListView(_todays);
//   }
//
//   final List<ReviewModel> _reviews;
//   @override
//   List<ReviewModel> get reviews {
//     if (_reviews is EqualUnmodifiableListView) return _reviews;
//     // ignore: implicit_dynamic_type
//     return EqualUnmodifiableListView(_reviews);
//   }
//
//   final List<RestaurantModel> _restaurants;
//   @override
//   List<RestaurantModel> get restaurants {
//     if (_restaurants is EqualUnmodifiableListView) return _restaurants;
//     // ignore: implicit_dynamic_type
//     return EqualUnmodifiableListView(_restaurants);
//   }
//
//   @override
//   String toString() {
//     return 'HomeModel(banners: $banners, todays: $todays, reviews: $reviews, restaurants: $restaurants)';
//   }
//
//   @override
//   bool operator ==(dynamic other) {
//     return identical(this, other) ||
//         (other.runtimeType == runtimeType &&
//             other is _$_HomeModel &&
//             const DeepCollectionEquality().equals(other._banners, _banners) &&
//             const DeepCollectionEquality().equals(other._todays, _todays) &&
//             const DeepCollectionEquality().equals(other._reviews, _reviews) &&
//             const DeepCollectionEquality()
//                 .equals(other._restaurants, _restaurants));
//   }
//
//   @override
//   int get hashCode => Object.hash(
//       runtimeType,
//       const DeepCollectionEquality().hash(_banners),
//       const DeepCollectionEquality().hash(_todays),
//       const DeepCollectionEquality().hash(_reviews),
//       const DeepCollectionEquality().hash(_restaurants));
//
//   @JsonKey(ignore: true)
//   @override
//   @pragma('vm:prefer-inline')
//   _$$_HomeModelCopyWith<_$_HomeModel> get copyWith =>
//       __$$_HomeModelCopyWithImpl<_$_HomeModel>(this, _$identity);
// }
//
// abstract class _HomeModel implements HomeModel {
//   factory _HomeModel(
//       {required final List<BannerModel> banners,
//       required final List<TodayModel> todays,
//       required final List<ReviewModel> reviews,
//       required final List<RestaurantModel> restaurants}) = _$_HomeModel;
//
//   @override
//   List<BannerModel> get banners;
//   @override
//   List<TodayModel> get todays;
//   @override
//   List<ReviewModel> get reviews;
//   @override
//   List<RestaurantModel> get restaurants;
//   @override
//   @JsonKey(ignore: true)
//   _$$_HomeModelCopyWith<_$_HomeModel> get copyWith =>
//       throw _privateConstructorUsedError;
// }

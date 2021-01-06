import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:keretaapp/data/remote/app_dio.dart';

final dioProvider = Provider<Dio>((_) => AppDio.getInstance());

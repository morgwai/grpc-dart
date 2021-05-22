// Copyright (c) 2021, the gRPC project authors. Please see the AUTHORS file
// for details. All rights reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

/// Exports [GrpcOrWebClientChannel] that underneath uses gRPC [ClientChannel]
/// on all platfroms except web, on which it uses [GrpcWebClientChannel].
///
/// Note that gRPC and gRPC-web are 2 different protocols and server must be
/// able to speak both of them (on different ports) for this to work.
/// Applications using this class must change port accordingly to the platform,
/// for example:
/// ```dart
/// int port = 6666;
/// if (kIsWeb) port = 8080;
/// var channel = GrpcOrWebClientChannel('grpc.example.com', port, false);
/// ```

export 'src/client/grpc_or_web_channel_grpc.dart'
    if (dart.library.html) 'src/client/grpc_or_web_channel_web.dart';

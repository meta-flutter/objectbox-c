ObjectBox C and C++ APIs
========================
[ObjectBox](https://objectbox.io) is a superfast database for objects.
This is the **ObjectBox runtime library** to run ObjectBox as an embedded database in your C or C++ application.

**Latest version: 0.11.0** (2020-11-12).
See [changelog](CHANGELOG.md) for more details. 

In most cases you want to use the C and C++ APIs in combination with the **[ObjectBox Generator](https://github.com/objectbox/objectbox-generator) tool**.
This way, you get a convenient C or C++ API which requires minimal code on your side to work with the database.

Here's a C++ code example that inserts a `Task` data object into the database: 
```c++
obx::Box<Task> box(store);
box.put({.text = "Buy milk"}); 
```

Note: `Task` is a `struct` representing a user defined data model - see [ObjectBox C and C++ docs](https://cpp.objectbox.io/) for details.  

Some features
-------------
* ACID compliant object storage ("object" as in class/struct instances)
* Direct support for [FlatBuffers](https://google.github.io/flatbuffers/) data objects (aka "flatbuffers table") 
* Lightweight for smart devices; its binary size is only around 1 MB 
  (special feature reduced versions with 1/3 - 1/2 size are available on request)
* Zero-copy reads for highest possible performance; access tens of millions of objects on commodity hardware
* Secondary indexes based on object properties
* Async API for asynchronous puts, inserts, updates, removes
* Automatic model migration (no schema upgrade scripts etc.) 
* Powerful queries
* Relations to other objects (1:N and M:N)
* Optimized Time series types (TS edition only)
* Data synchronization across the network (sync edition only)

Usage and Installation
----------------------
The APIs come as single header file for C and C++:
 
  * C: [include/objectbox.h](include/objectbox.h)
  * C++: [include/objectbox.hpp](include/objectbox.hpp) (depends on objectbox.h)
  
Compile your code against it and use the binary library (.so, .dylib, .dll depending on the platform) to link against.
Head over to [ObjectBox C and C++ installation docs](https://cpp.objectbox.io/installation) for step-by-step instructions.

C++ API
-------
The C++ API is built on top of the C API exposed by the library (e.g. you still need objectbox.h).
You can also use both APIs from your code if necessary.
For example, you use the C++ `obx::Box` class for most database operations, but "break out" into the C API for a special function you need.  
Note that to use the `obx::Box` class, you also need the [ObjectBox Generator](https://github.com/objectbox/objectbox-generator) to generate binding code.
Find more details how to use it the [Getting started](https://cpp.objectbox.io/getting-started) section of the docs.

Examples
--------
Have a look at the following TaskList example apps, depending on your programming language and preference:

* [C, cursor, no generated code](examples/c-cursor-no-gen) - plain C; using flatcc directly; without any generated code
* [C, with generated code](examples/c-gen) - plain C, using code generated by `objectbox-generator` 
* [C++, with generated code](examples/cpp-gen) - C++, using code generated by `objectbox-generator` 

Documentation
-------------
* [C and C++ docs](https://cpp.objectbox.io/) - official ObjectBox C and C++ documentation 
* [include/objectbox.h](include/objectbox.h) - C API header file contains docs as code comments 
* [include/objectbox.hpp](include/objectbox.hpp) - C++ API header file contains docs as code comments 
* [C and C++ API reference docs](https://objectbox.io/docfiles/c/current/) - online HTML docs (Doxygen) 

Current state / Changelog
-------------------------
The C API is a thin wrapper around a robust DB core, which is version 2.x and already used on millions of devices.

**Beta notice:** the C API will become stable starting from version 1.0.
Until then, API improvements may result in breaking changes. For example, functions may still be renamed.

**[Changelog](CHANGELOG.md):** If you update from a previous version, please check the [changelog](CHANGELOG.md).
Besides new features, there may be breaking changes requiring modifications to your code. 

### Supported platforms:
* Linux 64-bit
* Linux ARMv6hf (e.g. Raspberry PI Zero)
* Linux ARMv7hf (e.g. Raspberry PI 3 and higher)
* MacOS 64-bit
* Windows 32-bit
* Windows 64-bit

C API as the Foundation for Higher Languages
--------------------------------------------
The plain C API (without the Generator) also serves as a basis for ObjectBox bindings in higher languages.
For example, the official APIs for [Go](https://github.com/objectbox/objectbox-go), [Swift](https://github.com/objectbox/objectbox-swift), [Dart/Flutter](https://github.com/objectbox/objectbox-dart) and [Python](https://github.com/objectbox/objectbox-python) rely on the C API.
In the same way, you could create an ObjectBox API for another programming language, e.g. for JavaScript.
For the C API, data consists of bytes representing FlatBuffers tables, which you can build and read in your language of choice.

License
-------
    Copyright 2018-2020 ObjectBox Ltd. All rights reserved.
    
    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at
    
        http://www.apache.org/licenses/LICENSE-2.0
    
    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.


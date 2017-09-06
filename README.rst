AAR Example
-----------

**!!! NOT WORKING !!!**

Instructions for creating AAR:

* https://developer.android.com/studio/projects/android-library.html

Create AAR
----------

Open project ``android-aar-simple/FooLibrary`` and click ``Build -> Build APK``.
This will create AAR, path ``android-aar-simple/FooLibrary/foo/build/outputs/aar/foo-debug.aar``.

Use AAR
-------

Open project ``android-aar-simple/UseFoo`` and follow instructions for adding AAR:

* ``File -> New -> New Module ... -> Import .JAR/.AAR Package`` find ``foo-debug.aar`` and load it
* In file ``android-aar-simple/UseFoo/app/build.gradle`` add line:

.. code-block:: none

  dependencies {
    compile project(":foo-debug")
  }

* Sync project
* Build -> Make Project

Error in line ``import com.example.foo``:

.. code-block:: none

  /.../android-aar-simple/UseFoo/app/src/main/java/com/example/usefoo/MainActivity.java
    Error:(6, 19) error: cannot find symbol class foo

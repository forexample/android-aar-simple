package com.example.foo;

/**
 * Created by ruslo on 06/09/17.
 */

public class Foo {
    public Foo() {
    }

    static {
        System.loadLibrary("foo");
    }

    public native int getResult();
}

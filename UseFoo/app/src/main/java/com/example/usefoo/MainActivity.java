package com.example.usefoo;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.TextView;

import com.example.foo.Foo;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        TextView view = (TextView)findViewById(R.id.textview);

        Foo foo = new Foo();

        view.setText(Integer.toString(foo.getResult()));
    }
}

package com.github.catvod.demo;

import android.app.Activity;
import android.os.Bundle;

// import com.github.catvod.spider.xyz;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

public class MainActivity extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        new Thread(new Runnable() {
            @Override
            public void run() {            
                System.out.println("no test");
            }
        }).start();
    }
}
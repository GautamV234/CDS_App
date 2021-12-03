package com.example.cds_app_part1;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import java.util.ArrayList;

public class Recruiter_Login extends AppCompatActivity {


    EditText txt_firstTimeEmail;
    EditText txt_loginEmail;
    EditText txt_loginPassword;
    Button btn_getVerified;
    Button btn_logIn;
//    test1
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_recruiter_login);
        txt_firstTimeEmail = (EditText) findViewById(R.id.txt_firstTimeEmail);
        txt_loginEmail  =(EditText) findViewById(R.id.txt_loginEmail);
        txt_loginPassword  =(EditText) findViewById(R.id.txt_loginPassword);
    }

    public void new_recruiter_mail(View v){
            // THIS MAIL GOES TO THE CDS EMPLOYEE
//        ADD CODE TO INSERT THE NEW RECRUITER'S EMAIL ID TO THE DB
        ArrayList<String> sendTo = new ArrayList<>();
        Toast.makeText(this.getApplicationContext(),txt_firstTimeEmail.getText().toString(), Toast.LENGTH_LONG).show();
        sendTo.add("gautam.pv@iitgn.ac.in");
        sendTo.add("gautamdsrv@gmail.com");
        String recruiter_emailId = txt_firstTimeEmail.getText().toString();
        Log.d("Recruiter email ",recruiter_emailId);
        EmailSender emailSender = new EmailSender(sendTo,Recruiter_Login.this,
                false,true,recruiter_emailId);
        new Thread(emailSender).start();
        String sqlQuery = "Insert into dbo.reqList (Email) values ("+recruiter_emailId+")";
    }

//    ADD THIS FUNCTION TO THAT ACTIVITY WHERE CDS EMPLOYEE VERIFIES THE INCOMING EMAIL ID

//    public void recruiter_verified_mail(View v){
////        THIS MAIL GOES TO THE RECRUITER
//        ArrayList<String> sendTo = new ArrayList<>();
//        sendTo.add("gautam.pv@iitgn.ac.in");
//        sendTo.add("gautamdsrv@gmail.com");
//        String sqlQuery = "SELECT Password FROM CompanyInfo WHERE UserMail =";
//        String password = "pass";
//
////        Add code to get password from the database;
//        String recruiter_emailId = "abc"; // get from the input;
//        EmailSender emailSender = new EmailSender(sendTo,Recruiter_Login.this,
//                true,true,password);
//    }

    public void login(View v){
        String email = txt_loginEmail.getText().toString();
        String password = txt_loginPassword.getText().toString();
        String sqlQuery = "SELECT * FROM CompanyInfo WHERE UserMail ="+email+" AND Password = "+password+"";
//      Check if not null or if the count of elements is not 0 then let the user login else show login failed
    }

}
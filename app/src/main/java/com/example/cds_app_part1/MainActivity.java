package com.example.cds_app_part1;

import androidx.appcompat.app.AppCompatActivity;


import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.os.StrictMode;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

//import javax.mail.Address;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;


public class MainActivity extends AppCompatActivity {

    EditText txt_recruiterId;
    Button   btn_send;
    private Handler mainHandler = new Handler();
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        txt_recruiterId = findViewById(R.id.mailerId);
        btn_send = findViewById(R.id.sendMailId);
//        StrictMode.ThreadPolicy policy = new StrictMode.ThreadPolicy.Builder().permitAll().build();
//        StrictMode.setThreadPolicy(policy);
    }
    static int flag = 0;
    public void startThread(View view){
        Log.i("Flag var initial", " flag "+ flag+"");
        if(flag==0){
            flag = 1;
            Log.i("Flag var changed", " flag "+ flag+"");

            ExampleThread e = new ExampleThread(20);
            e.start();
        }
        else{
        }

    }
    public void goToCDSApp(View view){
        Log.i("Function called","This function was called");
        Intent cdsActivity = new Intent(getApplicationContext(),Recruiter_Login.class);
        startActivity(cdsActivity);
    }

    public void sendEmail(View view){
        MailThreadRunnable mailRunnable = new MailThreadRunnable();
        runOnUiThread(mailRunnable);
//        new Thread(mailRunnable).start();
    }


    class ExampleThread extends  Thread {
        int num_seconds;
        ExampleThread(int num_seconds){
            this.num_seconds = num_seconds;
        }
        @Override
        public void run() {
            for(int i=0;i<num_seconds;i++) {
                Log.d("Num seconds " ,i+"");
                try {
                    Thread.sleep(1000);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
                Log.i("THREAD COMPLETED", " flag "+ flag+"");
                flag = 0;

        }
    }

    class MailThreadRunnable implements Runnable {
        @Override
        public void run() {
            // the email id from which the mail will go the
            // recruiter which will include the password
            Log.i("mail","mail sending starting");
            final String sender_email_adress = "freek.stufff@gmail.com";
            final String sender_password = "weirdstuffonly23$";
            String messageToSend = "Congratulations, your account has been verified by a CDS Employee. " +
                    "The following is your password to login to the portal to continue "+"<PASSWORD FROM DB>";
            Properties props = new Properties();
            props.put("mail.smtp.auth","true");
            props.put("mail.smtp.starttls.enable","true");
            props.put("mail.smtp.host","smtp.gmail.com");
            props.put("mail.smtp.port","587");
            Log.i("mail","mail properties for smtp set");
            Session session = Session.getInstance(props,new javax.mail.Authenticator(){
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(sender_email_adress,sender_password);
                }
            });
            try{

//                    TO-DO WRAP ALL OF THIS IN A DIFFERENT THREAD WITHOUT FAIL
//                    MASSIVE PERFORMANCE ISSUES OTHERWISE
                Message message = new MimeMessage(session);
                message.setFrom(new InternetAddress(sender_email_adress));
//                String recruiter_id =txt_recruiterId.getText().toString();
                String recruiter_id = "gautam.pv@iitgn.ac.in";
                message.setRecipients(Message.RecipientType.TO,
                        InternetAddress.parse(recruiter_id));


//                    message.setRecipients(Message.RecipientType.CC,
//                            InternetAddress.parse("rishabh.g@iitgn.ac.in"));
//                    message.addRecipients(Message.RecipientType.CC,
//                            InternetAddress.parse("aditya.ss@iitgn.ac.in"));
//                    message.addRecipients(Message.RecipientType.CC,
//                            InternetAddress.parse("reuben.sd@iitgn.ac.in"));
//                    message.addRecipients(Message.RecipientType.CC,
//                            InternetAddress.parse("gupta.paras@iitgn.ac.in"));
                Log.i("mail","mail recipients set ");
                message.setSubject("Confirmation at IITGN Recruitment 2021");
                message.setText(messageToSend);
                Transport.send(message);
                Log.i("mail","mail transported");
                runOnUiThread(new Runnable() {
                    @Override
                    public void run() {
                        Toast.makeText(getApplicationContext(),"email sent successfully", Toast.LENGTH_LONG).show();
                    }
                });

            }catch (MessagingException e){
                runOnUiThread(new Runnable() {
                    @Override
                    public void run() {
                        Toast.makeText(getApplicationContext(),"email failed", Toast.LENGTH_LONG).show();
                    }
                });

                throw new RuntimeException();
            }

        }
    }

}
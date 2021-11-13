package com.example.cds_app_part1;

import android.app.Activity;
import android.util.Log;
import android.widget.Toast;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class EmailSender implements Runnable {
    private WeakReference<Activity> activityWeakReference;
    ArrayList<String> sendTo;
    Boolean mailToRecruiter;
    Boolean isStepOne;
    String param; // can be either recruiter email id or the password or empty depending on the function used
    EmailSender(ArrayList<String> sendTo,
    Activity activity,Boolean mailToRecruiter,Boolean isStepOne,String param){
        this.activityWeakReference = new WeakReference<Activity>(activity);
        this.sendTo = sendTo;
        this.mailToRecruiter = mailToRecruiter;
        this.isStepOne = isStepOne;
        this.param = param;
    }
    @Override
    public void run(){
        if(mailToRecruiter==true && isStepOne == true){
            sendEmailToRecruiter(param);
        }
        else if (mailToRecruiter==false && isStepOne == true){
            sendEmailToCDSEmployee(param);
        }
        else if (mailToRecruiter==true && isStepOne == false){
            mailToRecruiterStep2();
        }
        else if(mailToRecruiter==false && isStepOne == false){
            mailToCDSEmployee2(param);
        }
    }

    public void sendEmailToCDSEmployee(String recruiter_emailId){
        Activity activity =  activityWeakReference.get();
        // the email id from which the mail will go the
        // recruiter which will include the password
        Log.i("mail","mail sending starting");
//        ****** Add the email id of a generic account used to inform the CDS Employee *****
        final String sender_email_adress = "freek.stufff@gmail.com";
        final String sender_password = "weirdstuffonly23$";
        String messageToSend = "A new recruiter  "+ recruiter_emailId + " wants to get verified. " +
                "Kindly verify them from your CDS Portal";
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
            for( String receiver : sendTo){
                message.setRecipients(Message.RecipientType.TO,
                        InternetAddress.parse(receiver));
            }
//            String recruiter_id = "gautam.pv@iitgn.ac.in";
//            message.setRecipients(Message.RecipientType.TO,
//                    InternetAddress.parse(recruiter_id));


//                    message.setRecipients(Message.RecipientType.CC,
//                            InternetAddress.parse("rishabh.g@iitgn.ac.in"));
//                    message.addRecipients(Message.RecipientType.CC,
//                            InternetAddress.parse("aditya.ss@iitgn.ac.in"));
//                    message.addRecipients(Message.RecipientType.CC,
//                            InternetAddress.parse("reuben.sd@iitgn.ac.in"));
//                    message.addRecipients(Message.RecipientType.CC,
//                            InternetAddress.parse("gupta.paras@iitgn.ac.in"));
            Log.i("mail","mail recipients set ");
            String subject = "New Recruiter added to CDS Portal";
            message.setSubject(subject);
            message.setText(messageToSend);
            Transport.send(message);
            Log.i("mail","mail transported");
            activity.runOnUiThread(new Runnable() {
                @Override
                public void run() {
                    Toast.makeText(activity.getApplicationContext(),"email sent successfully", Toast.LENGTH_LONG).show();
                }
            });

        }catch (MessagingException e){
            activity.runOnUiThread(new Runnable() {
                @Override
                public void run() {
                    Toast.makeText(activity.getApplicationContext(),"email failed", Toast.LENGTH_LONG).show();
                }
            });

            throw new RuntimeException();
        }
    }
    public void sendEmailToRecruiter(String password){
        Activity activity =  activityWeakReference.get();
        // the email id from which the mail will go the
        // recruiter which will include the password
        Log.i("mail","mail sending starting");
//     ******   Enter Email of CDS employee / generic cds email *****
        final String sender_email_adress = "freek.stufff@gmail.com";
        final String sender_password = "weirdstuffonly23$";
        String messageToSend = "Congratulations, your account has been verified by a CDS Employee. " +
                "The following is your password to login to the portal to continue "+ password;
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
            for( String receiver : sendTo){
                message.setRecipients(Message.RecipientType.TO,
                        InternetAddress.parse(receiver));
            }


//                    message.setRecipients(Message.RecipientType.CC,
//                            InternetAddress.parse("rishabh.g@iitgn.ac.in"));
//                    message.addRecipients(Message.RecipientType.CC,
//                            InternetAddress.parse("aditya.ss@iitgn.ac.in"));
//                    message.addRecipients(Message.RecipientType.CC,
//                            InternetAddress.parse("reuben.sd@iitgn.ac.in"));
//                    message.addRecipients(Message.RecipientType.CC,
//                            InternetAddress.parse("gupta.paras@iitgn.ac.in"));
            Log.i("mail","mail recipients set ");
            String subject = "Profile verified at IITGN Recruitment 2021";
            message.setSubject(subject);
            message.setText(messageToSend);
            Transport.send(message);
            Log.i("mail","mail transported");
            activity.runOnUiThread(new Runnable() {
                @Override
                public void run() {
                    Toast.makeText(activity.getApplicationContext(),"email sent successfully", Toast.LENGTH_LONG).show();
                }
            });

        }catch (MessagingException e){
            activity.runOnUiThread(new Runnable() {
                @Override
                public void run() {
                    Toast.makeText(activity.getApplicationContext(),"email failed", Toast.LENGTH_LONG).show();
                }
            });

            throw new RuntimeException();
        }
    }

    public void mailToRecruiterStep2(){
//        THIS IS THE MAIL THAT IS SENT TO THE RECRUITER WHEN THEY ARE FINALLY VERIFIED AND CAN NOW POST JOB OFFER
        Activity activity =  activityWeakReference.get();
        // the email id from which the mail will go the
        // recruiter which will include the password
        Log.i("mail","mail sending starting");
//     ******   Enter Email of CDS employee / generic cds email *****
        final String sender_email_adress = "freek.stufff@gmail.com";
        final String sender_password = "weirdstuffonly23$";
        String messageToSend = "Congratulations,you are now eligible to float job offers at IIT Gandhinagar. Please use the portal to do so.";
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
            for( String receiver : sendTo){
                message.setRecipients(Message.RecipientType.TO,
                        InternetAddress.parse(receiver));
            }


//                    message.setRecipients(Message.RecipientType.CC,
//                            InternetAddress.parse("rishabh.g@iitgn.ac.in"));
//                    message.addRecipients(Message.RecipientType.CC,
//                            InternetAddress.parse("aditya.ss@iitgn.ac.in"));
//                    message.addRecipients(Message.RecipientType.CC,
//                            InternetAddress.parse("reuben.sd@iitgn.ac.in"));
//                    message.addRecipients(Message.RecipientType.CC,
//                            InternetAddress.parse("gupta.paras@iitgn.ac.in"));
            Log.i("mail","mail recipients set ");
            String subject = "Job details approved and verified at IITGN Recruitment 2021";
            message.setSubject(subject);
            message.setText(messageToSend);
            Transport.send(message);
            Log.i("mail","mail transported");
            activity.runOnUiThread(new Runnable() {
                @Override
                public void run() {
                    Toast.makeText(activity.getApplicationContext(),"email sent successfully", Toast.LENGTH_LONG).show();
                }
            });

        }catch (MessagingException e){
            activity.runOnUiThread(new Runnable() {
                @Override
                public void run() {
                    Toast.makeText(activity.getApplicationContext(),"email failed", Toast.LENGTH_LONG).show();
                }
            });

            throw new RuntimeException();
        }
    }

    public void mailToCDSEmployee2(String recruiter_emailId){
//        THIS MAIL WILL BE SENT TO THE EMPLOYEE WHEN THE RECRUITER HAS POSTED THEIR JOB DETAILS FOR VERIFICATION
        Activity activity =  activityWeakReference.get();
        // the email id from which the mail will go the
        // recruiter which will include the password
        Log.i("mail","mail sending starting");
//        ****** Add the email id of a generic account used to inform the CDS Employee *****
        final String sender_email_adress = "freek.stufff@gmail.com";
        final String sender_password = "weirdstuffonly23$";
        String messageToSend = "Recruiter  "+ recruiter_emailId + " has posted their job description for verification. " +
                "Kindly verify them from your CDS Portal";
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
            for( String receiver : sendTo){
                message.setRecipients(Message.RecipientType.TO,
                        InternetAddress.parse(receiver));
            }
//            String recruiter_id = "gautam.pv@iitgn.ac.in";
//            message.setRecipients(Message.RecipientType.TO,
//                    InternetAddress.parse(recruiter_id));


//                    message.setRecipients(Message.RecipientType.CC,
//                            InternetAddress.parse("rishabh.g@iitgn.ac.in"));
//                    message.addRecipients(Message.RecipientType.CC,
//                            InternetAddress.parse("aditya.ss@iitgn.ac.in"));
//                    message.addRecipients(Message.RecipientType.CC,
//                            InternetAddress.parse("reuben.sd@iitgn.ac.in"));
//                    message.addRecipients(Message.RecipientType.CC,
//                            InternetAddress.parse("gupta.paras@iitgn.ac.in"));
            Log.i("mail","mail recipients set ");
            String subject = "Verification of Job Details of Recruiter";
            message.setSubject(subject);
            message.setText(messageToSend);
            Transport.send(message);
            Log.i("mail","mail transported");
            activity.runOnUiThread(new Runnable() {
                @Override
                public void run() {
                    Toast.makeText(activity.getApplicationContext(),"email sent successfully", Toast.LENGTH_LONG).show();
                }
            });

        }catch (MessagingException e){
            activity.runOnUiThread(new Runnable() {
                @Override
                public void run() {
                    Toast.makeText(activity.getApplicationContext(),"email failed", Toast.LENGTH_LONG).show();
                }
            });

            throw new RuntimeException();
        }
    }


}

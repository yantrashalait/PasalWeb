package com.vortexnepal.pasal.controller;

import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Message;
import com.twilio.type.PhoneNumber;


public class SmsSender {
    // Find your Account Sid and Auth Token at twilio.com/console
    public static final String ACCOUNT_SID =
            "ACc724b1e721dd0a0e6c8fb1f7805d9ef2";
    public static final String AUTH_TOKEN =
            "1b3887747e284edefdda1ae26812c593";

    public static void main(String[] args) {
        Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

        Message message = Message
                .creator(new PhoneNumber("+9779813344166"), // to
                        new PhoneNumber("+12065352138"), // from
                        "Testing Twilio SMS Send Creteria !!! Success")
                .create();

        System.out.println(message.getSid());
    }
}

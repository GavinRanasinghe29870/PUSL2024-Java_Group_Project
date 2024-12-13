package net.abccinema.service;

import com.google.api.client.auth.oauth2.Credential;
//import com.google.api.client.extensions.java6.auth.oauth2.AuthorizationCodeInstalledApp;
import com.google.api.client.extensions.jetty.auth.oauth2.LocalServerReceiver;
import com.google.api.client.googleapis.auth.oauth2.GoogleAuthorizationCodeFlow;
import com.google.api.client.googleapis.auth.oauth2.GoogleClientSecrets;
import com.google.api.client.googleapis.javanet.GoogleNetHttpTransport;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.gson.GsonFactory;
import com.google.api.client.util.store.FileDataStoreFactory;
import com.google.api.services.gmail.Gmail;
import com.google.api.services.gmail.GmailScopes;
import com.google.api.services.gmail.model.Label;
import com.google.api.services.gmail.model.ListLabelsResponse;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.security.GeneralSecurityException;
import java.util.Collections;
import java.util.List;

public class GmailService {

//    private static final String APPLICATION_NAME = "CinemaBookingApp";
//    private static final JsonFactory JSON_FACTORY = GsonFactory.getDefaultInstance();
//
//    public static Gmail getService() throws IOException, GeneralSecurityException {
//    InputStream in = GmailService.class.getResourceAsStream("/credentials.json");
//    if (in == null) {
//        throw new FileNotFoundException("Resource not found: credentials.json");
//    }
//    GoogleClientSecrets clientSecrets = GoogleClientSecrets.load(JSON_FACTORY, new InputStreamReader(in));
//    NetHttpTransport HTTP_TRANSPORT = GoogleNetHttpTransport.newTrustedTransport();
//
//    GoogleAuthorizationCodeFlow flow = new GoogleAuthorizationCodeFlow.Builder(
//            HTTP_TRANSPORT, JSON_FACTORY, clientSecrets, Collections.singletonList(GmailScopes.GMAIL_SEND))
//            .setDataStoreFactory(new FileDataStoreFactory(new java.io.File("tokens")))
//            .setAccessType("offline")
//            .build();
//
//    Credential credential = new AuthorizationCodeInstalledApp(flow, new LocalServerReceiver()).authorize("user");
//    return new Gmail.Builder(HTTP_TRANSPORT, JSON_FACTORY, credential)
//            .setApplicationName(APPLICATION_NAME)
//            .build();
//}
}

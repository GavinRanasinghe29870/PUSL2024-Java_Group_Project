package net.abccinema.service;

import com.google.api.client.auth.oauth2.Credential;
import com.google.api.client.extensions.java6.auth.oauth2.AuthorizationCodeInstalledApp;
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
import java.io.ByteArrayOutputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.security.GeneralSecurityException;
import java.util.Collections;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
//import javax.mail.Message;
import javax.mail.MessagingException;
import com.google.api.services.gmail.model.Message;
import java.util.Base64;
import javax.mail.Session;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author gavin
 */
public class GmailService {
    private static final String APPLICATION_NAME = "ABC Cinema";
    private static final JsonFactory JSON_FACTORY = GsonFactory.getDefaultInstance();

  public static Gmail getService() throws IOException, GeneralSecurityException {
    InputStream in = GmailService.class.getResourceAsStream("/credentials.json");
    System.out.println(System.getProperty("java.class.path"));
   if (in == null) {
        throw new FileNotFoundException("Resource not found: credentials.json");
    }
    GoogleClientSecrets clientSecrets = GoogleClientSecrets.load(JSON_FACTORY, new InputStreamReader(in));
    NetHttpTransport HTTP_TRANSPORT = GoogleNetHttpTransport.newTrustedTransport();

    GoogleAuthorizationCodeFlow flow = new GoogleAuthorizationCodeFlow.Builder(
            HTTP_TRANSPORT, JSON_FACTORY, clientSecrets, Collections.singletonList(GmailScopes.GMAIL_SEND))
            .setDataStoreFactory(new FileDataStoreFactory(new java.io.File("tokens")))
            .setAccessType("offline")
            .build();

    Credential credential = new AuthorizationCodeInstalledApp(flow, new LocalServerReceiver()).authorize("user");
    return new Gmail.Builder(HTTP_TRANSPORT, JSON_FACTORY, credential)
            .setApplicationName(APPLICATION_NAME)
            .build();
}

    public static Message createMessage(String to, String subject, String bodyText) throws MessagingException {
        Session session = Session.getDefaultInstance(System.getProperties(), null);
        MimeMessage email = new MimeMessage(session);
        email.setFrom(new InternetAddress("your_email@gmail.com"));
        email.addRecipient(javax.mail.Message.RecipientType.TO, new InternetAddress(to));
        email.setSubject(subject);
        email.setText(bodyText);

        ByteArrayOutputStream buffer = new ByteArrayOutputStream();
        try {
            email.writeTo(buffer);
        } catch (IOException ex) {
            Logger.getLogger(GmailService.class.getName()).log(Level.SEVERE, null, ex);
        }
        byte[] rawBytes = buffer.toByteArray();
        return new Message().setRaw(Base64.getUrlEncoder().encodeToString(rawBytes));
    }

    public static void sendEmail(String to, String subject, String bodyText) throws Exception {
        Gmail service = getService();
        Message message = createMessage(to, subject, bodyText);
        service.users().messages().send("me", message).execute();
    }
}

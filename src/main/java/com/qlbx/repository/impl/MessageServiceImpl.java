/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qlbx.repository.impl;

import com.google.api.core.ApiFuture;
import com.google.cloud.firestore.DocumentReference;
import com.google.cloud.firestore.DocumentSnapshot;
import com.google.cloud.firestore.Firestore;
import com.google.cloud.firestore.WriteResult;
import com.google.firebase.cloud.FirestoreClient;
import com.qlbx.pojo.Message;
import com.qlbx.repository.MessageService;
import java.util.concurrent.ExecutionException;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.springframework.stereotype.Service;

/**
 *
 * @author ASUS
 */
@Service
public class MessageServiceImpl implements MessageService{

    @Override
    public Message getMessage(String messageId) {
        try {
            Firestore dbFirestore = FirestoreClient.getFirestore();
            DocumentReference documentReference = dbFirestore.collection("message").document(messageId);
            ApiFuture<DocumentSnapshot> future = documentReference.get();
            DocumentSnapshot document = future.get();
            Message msg;
            if (document.exists()){
                msg = document.toObject(Message.class);
                return msg;
            }
        } catch (InterruptedException ex) {
            Logger.getLogger(MessageServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ExecutionException ex) {
            Logger.getLogger(MessageServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public String createMessage(Message message) {
//        Firestore dbFirestore = FirestoreClient.getFirestore();
//        ApiFuture<WriteResult> collectionsApiFuture = dbFirestore.collection("message").document(message.getMessageId()).set(message);
        return null;
    }
    
}

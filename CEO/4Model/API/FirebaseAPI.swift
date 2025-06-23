//
//  FirebaseAPI.swift
//  HadirCashier
//
//  Created by macbook on 13/01/2022.
//

import Foundation
import Firebase
import CodableFirebase
import FirebaseFirestore

public func myFirebaseDecoder() -> FirebaseDecoder {
    let decoder = FirebaseDecoder()
    decoder.dateDecodingStrategy = .millisecondsSince1970
    return decoder
}

public func myFirebaseEncoder() -> FirebaseEncoder {
    let encoder = FirebaseEncoder()
    encoder.dateEncodingStrategy = .millisecondsSince1970
    return encoder
}

public func myFirebaseDecoderSec() -> FirebaseDecoder {
    let decoder = FirebaseDecoder()
    decoder.dateDecodingStrategy = .secondsSince1970
    return decoder
}

public func myFirebaseEncoderSec() -> FirebaseEncoder {
    let encoder = FirebaseEncoder()
    encoder.dateEncodingStrategy = .secondsSince1970
    return encoder
}

class FirebaseAPI {
    
    static var listener: ListenerRegistration!
    struct Constants {
        static let apiKey = Firestore.firestore().collection("apiKey")
        static let forceUpdate = Firestore.firestore().collection("forceUpdate")
        static let settings = Firestore.firestore().collection("settings")
        static let articles = Firestore.firestore().collection("articles")
        static let videos = Firestore.firestore().collection("videos")
    }
    
    static func getFirebaseData<T: Codable>(url: CollectionReference, source: FirestoreSource = .default, added: ((T)->Void)?, changed: ((T)->Void)?, noData: @escaping ()->()) {
        listener = url.addSnapshotListener { querySnapshot, error in
            guard let snapshot = querySnapshot else {
                print("Error fetching snapshots: \(error!)")
                return
            }
            
            url.getDocuments(source: source) { (document, error) in
                guard !(document?.isEmpty ?? false) else {
                    noData()
                    return
                }
            }
            
            snapshot.documentChanges.forEach { documentChange in
                if documentChange.type == .added {
                    do {
                        let object = try myFirebaseDecoder().decode(T.self, from: documentChange.document.data())
                        added?(object)
                    } catch let error {
                        debugPrint(error)
                    }
                } else {
                    do {
                        let object = try myFirebaseDecoder().decode(T.self, from: documentChange.document.data())
                        changed?(object)
                    } catch let error {
                        debugPrint(error)
                    }
                }
            }
        }
    }
}

// --- Notifications ---
extension Notification.Name {
    static let article = Notification.Name("article")
    static let video = Notification.Name("video")
}

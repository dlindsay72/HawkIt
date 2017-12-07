//
//  FIRMessagingService.swift
//  HawkIt
//
//  Created by Dan Lindsay on 2017-12-06.
//  Copyright © 2017 Dan Lindsay. All rights reserved.
//

import Foundation
import FirebaseMessaging

enum SubscriptionTopic: String {
    case newProducts = "newProducts"
}

class FIRMessagingService {
    
    private init() {}
    
    static let shared = FIRMessagingService()
    let messaging = Messaging.messaging()
    
    func subscribe(to topic: SubscriptionTopic) {
       messaging.subscribe(toTopic: topic.rawValue)
    }
    
    func unsubcribe(from topic: SubscriptionTopic) {
        messaging.unsubscribe(fromTopic: topic.rawValue)
    }
    
}

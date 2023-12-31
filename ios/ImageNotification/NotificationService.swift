import FirebaseMessaging
import UserNotifications

class NotificationService: UNNotificationServiceExtension {

    var contentHandler: ((UNNotificationContent) -> Void)?
    var bestAttemptContent: UNMutableNotificationContent?

    override func didReceive(_ request: UNNotificationRequest, withContentHandler contentHandler: @escaping (UNNotificationContent) -> Void) {
        self.contentHandler = contentHandler
        bestAttemptContent = request.content
          .mutableCopy() as? UNMutableNotificationContent
        guard let bestAttemptContent = bestAttemptContent else { return }
        FIRMessagingExtensionHelper().populateNotificationContent(
          bestAttemptContent,
          withContentHandler: contentHandler)
    }
    
    override func serviceExtensionTimeWillExpire() {
        if let contentHandler = contentHandler, let bestAttemptContent =  bestAttemptContent {
            contentHandler(bestAttemptContent)
        }
    }

}

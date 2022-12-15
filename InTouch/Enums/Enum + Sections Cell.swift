import UIKit

enum Section: Int, CaseIterable {
    case waitingChat
    case activeChats
    
    func description() -> String {
        switch self {
        case .waitingChat:
            return "Ожидают подтверждения"
        case .activeChats:
            return "Ваши контакты"
        }
    }
}

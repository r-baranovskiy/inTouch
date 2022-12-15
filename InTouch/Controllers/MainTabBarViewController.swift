import UIKit

class MainTabBarViewController: UITabBarController {
    
    //MARK: - Controllers
    
    private let peopleVC = ConversationsViewController()
    private let conversationVC = PeopleViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.tintColor = UIColor(named: KeysColor.tabBarColor.rawValue)
        tabBar.backgroundColor = .white
                
        viewControllers = [
            createNavigationVC(rootVC: peopleVC, title: "Контакты", imageSystemName: "person.2.fill"),
            createNavigationVC(rootVC: conversationVC, title: "Диалоги", imageSystemName: "message.badge.circle.fill")
        ]
    }
    
    
    private func createNavigationVC(rootVC: UIViewController,
                                    title: String,
                                    imageSystemName: String) -> UIViewController {
        let navVC = UINavigationController(rootViewController: rootVC)
        navVC.tabBarItem.title = title
        navVC.tabBarItem.image = UIImage(systemName: imageSystemName, withConfiguration: UIImage.SymbolConfiguration(weight: .heavy))
        return navVC
    }
}



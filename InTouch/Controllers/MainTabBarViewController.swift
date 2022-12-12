import UIKit

class MainTabBarViewController: UITabBarController {
    
    //MARK: - Controllers
    
    private let peopleVC = PeopleViewController()
    private let conversationVC = ConversationsViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.tintColor = .green
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
        navVC.tabBarItem.image = UIImage(systemName: imageSystemName)
        return navVC
    }
    
}

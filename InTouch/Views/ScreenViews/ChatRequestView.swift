import UIKit

class ChatRequestView: UIView {
    
    //MARK: - UI Constants
    
    private var userContainerView = UIView()
    
    private let userImage = UIImageView(imageName: "ava1",
                                           contentMode: .scaleAspectFill,
                                           addBorder: false)
    
    private let userNameLabel = UILabel(text: "Ruslan Kashchenko",
                                           font: .avenir40(),
                                           textColor: .label,
                                           adjustsFontSizeToFitWidth: true,
                                           alignment: .center)
    private (set) var userAboutLabel = UILabel(text: "I work at the factory as a worker",
                                                  font: .avenir20(),
                                                  textColor: .label,
                                                  adjustsFontSizeToFitWidth: true)
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubiewWithoutAutoresizing(userImage)
        addSubiewWithoutAutoresizing(userContainerView)
        
        customizeElements()
        setupUserContainer()
        
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - UI Config
    
    private func customizeElements() {
        userAboutLabel.numberOfLines = 0
    }
    
    private func setupUserContainer() {
        userContainerView.layer.cornerRadius = 30
        userContainerView.backgroundColor = UIColor(named: KeysColor.lightGrayBackground.rawValue)
        
        userContainerView.addSubiewWithoutAutoresizing(userNameLabel)
        userContainerView.addSubiewWithoutAutoresizing(userAboutLabel)
    }
    
    //MARK: - Constraints
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            userContainerView.heightAnchor.constraint(equalToConstant: 206),
            userContainerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            userContainerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            userContainerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            userImage.topAnchor.constraint(equalTo: topAnchor),
            userImage.bottomAnchor.constraint(equalTo: userContainerView.bottomAnchor, constant: 30),
            userImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            userImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            userNameLabel.topAnchor.constraint(equalTo: userContainerView.topAnchor, constant: 10),
            userNameLabel.leadingAnchor.constraint(equalTo: userContainerView.leadingAnchor, constant: 50),
            userNameLabel.trailingAnchor.constraint(equalTo: userContainerView.trailingAnchor, constant: -50),
            
            userAboutLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 10),
            userAboutLabel.leadingAnchor.constraint(equalTo: userContainerView.leadingAnchor, constant: 10),
            
        ])
    }
    
}

import SwiftUI
struct ListProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let listVC = ChatRequestViewController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<ListProvider.ContainerView>) -> ChatRequestViewController {
            return listVC
        }
        
        func updateUIViewController(_ uiViewController: ListProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<ListProvider.ContainerView>) {
        }
    }
}



import UIKit

class ProfileView: UIView {
    
    //MARK: - UI Constants
    
    private var profileContainerView = UIView()
    
    private let profileImage = UIImageView(imageName: "ava1",
                                           contentMode: .scaleAspectFill,
                                           addBorder: false)
    
    private let profileNameLabel = UILabel(text: "Ruslan Kashchenko",
                                           font: .avenir40(),
                                           textColor: .label,
                                           adjustsFontSizeToFitWidth: true,
                                           alignment: .center)
    private let profileAboutLabel = UILabel(text: "I work at the factory as a worker",
                                       font: .avenir20(),
                                       textColor: .label,
                                       adjustsFontSizeToFitWidth: true)
    
    private let profileInfoTextField = UITextField()
    
    //MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubiewWithoutAutoresizing(profileImage)
        addSubiewWithoutAutoresizing(profileContainerView)

        customizeElements()
        setupProfileContainer()

        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - UI Config
    
    private func customizeElements() {
        profileAboutLabel.numberOfLines = 0
    }
    
    private func setupProfileContainer() {
        profileContainerView.layer.cornerRadius = 30
        profileContainerView.backgroundColor = UIColor(named: KeysColor.lightGrayBackground.rawValue)
        
        profileContainerView.addSubiewWithoutAutoresizing(profileNameLabel)
        profileContainerView.addSubiewWithoutAutoresizing(profileAboutLabel)
        profileContainerView.addSubiewWithoutAutoresizing(profileInfoTextField)
    }
    
    //MARK: - Constraints
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            profileContainerView.heightAnchor.constraint(equalToConstant: 206),
            profileContainerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            profileContainerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            profileContainerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            profileImage.topAnchor.constraint(equalTo: topAnchor),
            profileImage.bottomAnchor.constraint(equalTo: profileContainerView.bottomAnchor, constant: 30),
            profileImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            profileImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            profileNameLabel.topAnchor.constraint(equalTo: profileContainerView.topAnchor, constant: 10),
            profileNameLabel.leadingAnchor.constraint(equalTo: profileContainerView.leadingAnchor, constant: 50),
            profileNameLabel.trailingAnchor.constraint(equalTo: profileContainerView.trailingAnchor, constant: -50),
            
            profileAboutLabel.topAnchor.constraint(equalTo: profileNameLabel.bottomAnchor, constant: 10),
            profileAboutLabel.leadingAnchor.constraint(equalTo: profileContainerView.leadingAnchor, constant: 10),
            profileContainerView.trailingAnchor.constraint(equalTo: profileContainerView.trailingAnchor, constant: -10),
            profileContainerView.bottomAnchor.constraint(equalTo: profileContainerView.bottomAnchor, constant: -20),
            
            profileInfoTextField.topAnchor.constraint(equalTo: profileAboutLabel.bottomAnchor, constant: 10),
            profileInfoTextField.leadingAnchor.constraint(equalTo: profileContainerView.leadingAnchor, constant: 20),
            profileInfoTextField.trailingAnchor.constraint(equalTo: profileContainerView.trailingAnchor, constant: -20),
            profileInfoTextField.heightAnchor.constraint(equalToConstant: 38)
            
        ])
        
    }

}

import SwiftUI
struct ListProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let listVC = ProfileViewController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<ListProvider.ContainerView>) -> ProfileViewController {
            return listVC
        }
        
        func updateUIViewController(_ uiViewController: ListProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<ListProvider.ContainerView>) {
        }
    }
}



import UIKit

class SettingsProfileView: UIView {
    
    //MARK: - UI Constants

    private let welcomeLabel = UILabel(text: "Ваш профиль",
                                       font: .avenir40(),
                                       textColor: .label,
                                       adjustsFontSizeToFitWidth: true,
                                       alignment: .center)
    
    let userPhotoView = UIImageView(imageName: KeysImages.emptyPhoto.rawValue,
                                    contentMode: .scaleAspectFit,
                                    addBorder: true)
    
    //Buttons
    let backButton = CustomButton.backButton()
    //TextFields
    let nicknameTextField = CustomTextField.oneLineTextField()
    let aboutInfoTextField = CustomTextField.oneLineTextField()
    //Containers
    
    //MARK: - Init
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        backgroundColor = .backgoundImage()
        addSubviews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        userPhotoView.layer.cornerRadius = userPhotoView.frame.height / 2
    }
    
    //MARK: - Confige
    
    private func addSubviews() {
        addSubiewWithoutAutoresizing(welcomeLabel)
        addSubiewWithoutAutoresizing(backButton)
        addSubiewWithoutAutoresizing(userPhotoView)
    }
    
    //MARK: - Constraints
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            backButton.heightAnchor.constraint(equalToConstant: 30),
            
            welcomeLabel.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 80),
            welcomeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            welcomeLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            userPhotoView.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 20),
            userPhotoView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            userPhotoView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.35),
            userPhotoView.heightAnchor.constraint(equalTo: userPhotoView.widthAnchor)

        ])
    }
}

import SwiftUI
struct ListProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let listVC = SettingsProfileViewController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<ListProvider.ContainerView>) -> SettingsProfileViewController {
            return listVC
        }
        
        func updateUIViewController(_ uiViewController: ListProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<ListProvider.ContainerView>) {
        }
    }
}



//
//  LoginController.swift
//  ChatApp
//
//  Created by Erica on 5/15/20.
//  Copyright © 2020 Perseidas LLC. All rights reserved.
//

import UIKit

class LoginController: UIViewController {
    
    // MARK: - Properties
    
    private let iconImage: UIImageView = {
        
        let iconView = UIImageView()
        iconView.image = UIImage(systemName: "bubble.right")
        iconView.tintColor = .white
        return iconView
    }()
    
    private lazy var emailContainerView: InputContainerView = {
  return InputContainerView(image: UIImage(systemName: "envelope"), textField: emailTextField)
    }()
    
    private lazy var passwordContainerView: InputContainerView = {
return InputContainerView(image: UIImage(systemName: "lock"), textField: passwordTextField)
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Log In", for: .normal)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        button.setTitleColor(.white, for: .normal)
        button.setHeight(height: 50)
        return button
    }()
    
    private let emailTextField = CustomTextField(placeholder: "Email")
    
    private let passwordTextField: CustomTextField = {
        let tf = CustomTextField(placeholder: "Password")
        tf.isSecureTextEntry = true
        return tf
    }()
    
    private let dontHaveAccountButton: UIButton = {
        let button = UIButton(type: .system)
        let attributeTitle = NSMutableAttributedString(string:"Don't have an account? ", attributes: [.font:UIFont.systemFont(ofSize: 16), .foregroundColor: UIColor.white])
        attributeTitle.append(NSMutableAttributedString(string:"Sign Up", attributes: [.font:UIFont.boldSystemFont(ofSize: 16), .foregroundColor: UIColor.white]))
        button.setAttributedTitle(attributeTitle, for:.normal)
        button.addTarget(self, action: #selector(handleShowSignUp), for:.touchUpInside)
        return button
    }()
    
    // MARK: - Lifecycle
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
    }
    
    // MARK: - Selectors
    
    @objc func handleShowSignUp() {
       let controller = RegistrationController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black
        view.backgroundColor = .systemPurple
        configureGradientLayer()
        
        view.addSubview(iconImage)
        iconImage.centerX(inView: view)
        iconImage.anchor(top:view.safeAreaLayoutGuide.topAnchor , paddingTop: 32)
        iconImage.setDimensions(height: 120, width: 120)
        
        let stack = UIStackView(arrangedSubviews: [emailContainerView, passwordContainerView, loginButton])
        stack.axis = .vertical
        stack.spacing = 16
        
        view.addSubview(stack)
        stack.anchor(top:iconImage.bottomAnchor, left:view.leftAnchor, right: view.rightAnchor, paddingTop:32, paddingLeft:32, paddingRight: 32)
        
        view.addSubview(dontHaveAccountButton)
        dontHaveAccountButton.anchor(left:view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingLeft: 32, paddingBottom: 16,  paddingRight: 32)
    }
    
    func configureGradientLayer() {
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.systemPurple.cgColor, UIColor.systemPink.cgColor]
        gradient.locations = [0, 1]
        view.layer.addSublayer(gradient)
        gradient.frame = view.frame
    }
    
}

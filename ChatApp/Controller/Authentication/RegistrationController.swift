//
//  RegistrationController.swift
//  ChatApp
//
//  Created by Erica on 5/15/20.
//  Copyright © 2020 Perseidas LLC. All rights reserved.
//

import UIKit


class RegistrationController: UIViewController {
    
 // MARK: - Properties
    
    private let plusPhotoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "plus_photo"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(handleSelectPhoto), for: .touchUpInside)
        return button
    }()
    
        private lazy var emailContainerView: InputContainerView = {
      return InputContainerView(image: UIImage(systemName: "envelope"), textField: emailTextField)
        }()
    
    private lazy var fullNameContainerView: InputContainerView = {
        return InputContainerView(image: UIImage(systemName: "person"), textField: fullNameTextField)
          }()
          
    private lazy var userNameContainerView: InputContainerView = {
        return InputContainerView(image: UIImage(systemName: "person"), textField: userNameTextField)
          }()
          
        
        private lazy var passwordContainerView: InputContainerView = {
    return InputContainerView(image: UIImage(systemName: "lock"), textField: passwordTextField)
        }()
        
    
    private let emailTextField = CustomTextField(placeholder: "Email")
    
     private let fullNameTextField = CustomTextField(placeholder: "FullName")
    
     private let userNameTextField = CustomTextField(placeholder: "UserName")
    
    private let passwordTextField: CustomTextField = {
        let tf = CustomTextField(placeholder: "Password")
        tf.isSecureTextEntry = true
        return tf
    }()
    
    private let signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign Up", for: .normal)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        button.setTitleColor(.white, for: .normal)
        button.setHeight(height: 50)
        return button
    }()
    
    private let alreadyAccountButton: UIButton = {
        let button = UIButton(type: .system)
        let attributeTitle = NSMutableAttributedString(string:"Already have an account? ", attributes: [.font:UIFont.systemFont(ofSize: 16), .foregroundColor: UIColor.white])
        attributeTitle.append(NSMutableAttributedString(string:"Log In", attributes: [.font:UIFont.boldSystemFont(ofSize: 16), .foregroundColor: UIColor.white]))
        button.setAttributedTitle(attributeTitle, for:.normal)
        button.addTarget(self, action: #selector(handleShowLogin), for:.touchUpInside)
        return button
    }()
    
 // MARK: - Lifecycle
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        configureUI()
    }
    
    
    // MARK: - Selectors
    
    @objc func handleSelectPhoto() {
        
    }
    
    @objc func handleShowLogin() {
        navigationController?.popViewController(animated: true)
           
       }
    
    func configureUI() {
        configureGradientLayer()
        
        view.addSubview(plusPhotoButton)
             plusPhotoButton.centerX(inView: view)
             plusPhotoButton.anchor(top:view.safeAreaLayoutGuide.topAnchor , paddingTop: 32)
             plusPhotoButton.setDimensions(height: 200, width: 200)
        
        
        let stack = UIStackView(arrangedSubviews: [emailContainerView, fullNameContainerView,userNameContainerView, passwordContainerView, signUpButton])
               stack.axis = .vertical
               stack.spacing = 16
               
               view.addSubview(stack)
               stack.anchor(top:plusPhotoButton.bottomAnchor, left:view.leftAnchor, right: view.rightAnchor, paddingTop:32, paddingLeft:32, paddingRight: 32)
        
        view.addSubview(alreadyAccountButton)
                 alreadyAccountButton.anchor(left:view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingLeft: 32, paddingBottom: 16,  paddingRight: 32)
    }
    
  
    
}


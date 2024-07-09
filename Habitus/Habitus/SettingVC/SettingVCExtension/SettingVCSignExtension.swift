//  SettingVCSignExtension.swift

//  Habitus

//  Created by Bobbi R. on 7.07.24.

import UIKit
import AuthenticationServices

extension SettingVC: ASAuthorizationControllerDelegate {
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print("Authorization failed: \(error.localizedDescription)")
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
            // Handle successful authorization
            isUserLoggedIn = true
            userName = appleIDCredential.fullName?.givenName ?? "User"
            userImage = UIImage(systemName: "person.fill") // Replace with actual image if available
            settingView.settingTableView.reloadSections(IndexSet(integer: 2), with: .automatic)
        }
    }
    
}

extension SettingVC: ASAuthorizationControllerPresentationContextProviding {
    
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!
    }
}

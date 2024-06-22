//  extension+SettingView.swift

//  List of habits - The Right Way.

//  Created by Bobbi R. on 23.06.24.

import UIKit
import AuthenticationServices

extension SettingViewController: ASAuthorizationControllerDelegate {

}

extension SettingViewController: ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!
    }
}

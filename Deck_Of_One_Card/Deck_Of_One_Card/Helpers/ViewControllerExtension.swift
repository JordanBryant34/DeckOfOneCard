//
//  ViewControllerExtension.swift
//  Deck_Of_One_Card
//
//  Created by Jordan Bryant on 9/22/20.
//  Copyright © 2020 Jordan Bryant. All rights reserved.
//

import UIKit.UIViewController

extension UIViewController {
    
    func presentErrorToUser(localizedError: LocalizedError) {
        let alertController = UIAlertController(title: "Error", message: localizedError.errorDescription, preferredStyle: .actionSheet)
        let dismissAction = UIAlertAction(title: "Ok", style: .cancel)
        alertController.addAction(dismissAction)
        present(alertController, animated: true)
    }
}



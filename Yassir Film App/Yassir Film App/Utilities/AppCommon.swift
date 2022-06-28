//
//  AppCommon.swift
//  Yassir Case Study
//
//  Created by Abdelrahman Elnagdy on 23/06/2022.
//

import Foundation
import UIKit
import SwiftMessages


/// List of states for fetching data
public enum ContentState {
    /// Loading
    case loading
    /// Error
    case error
    /// Empty
    case empty
    /// Populated
    case populated
    /// Filtered
    case filtered
}

/// This class contains the functions that are used across the application
class AppCommon: NSObject {

    static let shared = AppCommon()
    let imagetoAnimate = UIImageView(image: #imageLiteral(resourceName: "YassirLogo"))

    /// A function that shows the tile in the top of screen in case of an event -Mostly used in case of error-
    ///   - Parameters:
    ///     - title: A string that represents the title of the tile
    ///     - message: A string that represents the message that will be shown to the user.
    ///     - theme: an instance of *Theme* that represents the theme of the tile
    func showSwiftMessage(title: String = "", message: String = "", theme: Theme = .error) {
        let view = MessageView.viewFromNib(layout: .cardView)
        view.configureTheme(theme)
        view.configureDropShadow()
        view.button?.isHidden = true
        view.configureContent(title: title, body: message)
        view.layoutMarginAdditions = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        (view.backgroundView as? CornerRoundingView)?.cornerRadius = 10
        SwiftMessages.show(view: view)
        
    }

    /// A function that shows loading logo in an animated way -Rotational animation-
    ///   - Parameters:
    ///     - viewController: an instance of *UIViewController* that represents the controller in which the animated logo will be displayed
    func showLoadingLogo(_ viewController: UIViewController) {
        viewController.view.addSubview(imagetoAnimate)
            imagetoAnimate.translatesAutoresizingMaskIntoConstraints = false
            let horizontalConstraint = NSLayoutConstraint(item: imagetoAnimate, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: viewController.view, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0)
            let verticalConstraint = NSLayoutConstraint(item: imagetoAnimate, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: viewController.view, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: 0)
            let widthConstraint = NSLayoutConstraint(item: imagetoAnimate, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 50)
            let heightConstraint = NSLayoutConstraint(item: imagetoAnimate, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 50)
            NSLayoutConstraint.activate([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])
            let rotationAction = CABasicAnimation(keyPath: "transform.rotation")
            rotationAction.fromValue = 0
            rotationAction.toValue = Double.pi*2
            rotationAction.duration = 1
            rotationAction.repeatCount = Float.infinity
            imagetoAnimate.layer.add(rotationAction, forKey: "rotate")
    }

    /// A function that is in charge of hiding loading logo in case of data retrieval or an error
    func hideLoadingLogo() {
        imagetoAnimate.removeFromSuperview()
    }

}

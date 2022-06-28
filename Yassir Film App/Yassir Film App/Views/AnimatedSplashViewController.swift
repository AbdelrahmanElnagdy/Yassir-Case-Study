//
//  AnimatedSplashViewController.swift
//  Yassir Film App
//
//  Created by Abdelrahman Elnagdy on 28/06/2022.
//

import UIKit
import SwiftMessages

class AnimatedSplashViewController: UIViewController {
    private let animatedImageView: UIImageView = {
        let imageView = UIImageView(
            frame: CGRect(
                x: 0,
                y: 0,
                width: 150,
                height: 150)
        )
        imageView.image = UIImage(named: "YassirLogo")
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(animatedImageView)
        animatedImageView.center = view.center
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            guard let self = self else { return }
            AppCommon.shared.animatedSplash(
                self,
                animatedImage: self.animatedImageView
            )
        }
    }
}

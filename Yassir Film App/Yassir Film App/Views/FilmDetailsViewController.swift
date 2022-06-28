//
//  FilmDeetailsViewController.swift
//  Yassir Film App
//
//  Created by Abdelrahman Elnagdy on 26/06/2022.
//

import UIKit
import Kingfisher

class FilmDetailsViewController: UIViewController {
    @IBOutlet weak var filmNameLabel: UILabel!
    @IBOutlet weak var filmPosterImageView: UIImageView!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet var descriptionTextView: UITextView!

    var film: FilmsUIModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
        filmNameLabel.text = film?.name
        releaseDateLabel.text = film?.releaseDate
        descriptionTextView.text = film?.overview
        filmPosterImageView.kf.setImage(with: URL(string:film?.image ?? ""))
    }
}

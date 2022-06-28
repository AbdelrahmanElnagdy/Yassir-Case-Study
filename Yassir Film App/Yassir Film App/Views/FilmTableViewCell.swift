//
//  FilmTableViewCell.swift
//  Yassir Case Study
//
//  Created by Abdelrahman Elnagdy on 23/06/2022.
//

import UIKit
import Kingfisher

/// A class that represents the TableView cell used in films list viewController.
class FilmTableViewCell: UITableViewCell {
    @IBOutlet weak var filmImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    /// A function that is in charge of data aquisition.
    ///   - Parameters:
    ///     - filmModel: An instance of *FilmsUIModel* that will be displayed along the cell.
    func configureCell(filmModel: FilmsUIModel? ) {
        self.nameLabel.text = filmModel?.name
        self.releaseDateLabel.text = filmModel?.releaseDate
        self.filmImageView.kf.setImage(with: URL(string:filmModel?.image ?? ""))
    }

    /// A function that is in chage of setting up the UI changes in the cell.
    func setupUI() {
        self.clipsToBounds = false
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.3
        self.layer.shadowOffset = CGSize(width: 0, height: 3)
        self.layer.shadowRadius = 2
    }
}

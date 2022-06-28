//
//  ViewController.swift
//  Yassir Film App
//
//  Created by Abdelrahman Elnagdy on 23/06/2022.
//

import UIKit

class FilmsListViewController: UIViewController {
    @IBOutlet weak var filmsTableView: UITableView!
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    var viewModel: FilmsViewModel?
    var model: [FilmsUIModel]?
    let filmCellIdentifier = "FilmTableViewCell"
    let queueLabel = "com.FilmsApp.Developer"
    let filmDetailsVCIdentifier = "FilmDetailsViewController"
    var pageNumber = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = FilmsViewModel()
        setupTableView()
        initViewModel()
    }

    func setupTableView() {
        filmsTableView.delegate = self
        filmsTableView.dataSource = self
        filmsTableView.register(
            UINib(
                nibName: String(describing: FilmTableViewCell.self),
                bundle: nil),
            forCellReuseIdentifier: filmCellIdentifier
        )
    }

    func initViewModel() {
        let queue = DispatchQueue(
            label: queueLabel,
            qos: .userInitiated,
            attributes: .concurrent
        )
        queue.async { [weak self] in
            guard let self = self else { return }
            self.viewModel?.fetchAllFilms(pageNumber: self.pageNumber)
            self.viewModel?.updateLoadingStatus = {
                switch self.viewModel?.contentState {
                case .loading:
                    DispatchQueue.main.async {
                        AppCommon.shared.showLoadingLogo(self)
                    }
                case .populated:
                    self.model = self.viewModel?.films
                    DispatchQueue.main.async {
                        self.filmsTableView.reloadData()
                        AppCommon.shared.hideLoadingLogo()
                    }
                default:
                    DispatchQueue.main.async {
                        AppCommon.shared.hideLoadingLogo()
                    }
                }
            }
        }
    }
    
    @IBAction func prviousButtonDidPress(_ sender: Any) {
        nextButton.isEnabled = true
        if pageNumber > 1 {
            pageNumber -= 1
            initViewModel()
        } else {
            previousButton.isEnabled = false
        }
    }
    @IBAction func nextButtonDidPress(_ sender: Any) {
        previousButton.isEnabled = true
        if pageNumber < 500 {
            pageNumber += 1
            initViewModel()
        } else {
            nextButton.isEnabled = false
        }
    }
}

extension FilmsListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.getFilmsCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: filmCellIdentifier) as? FilmTableViewCell else { return UITableViewCell() }
        cell.configureCell(filmModel: model?[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 162
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let filmDetailsVC = storyboard.instantiateViewController(withIdentifier: filmDetailsVCIdentifier) as? FilmDetailsViewController
        filmDetailsVC?.film = model?[indexPath.row]
        self.navigationController?.pushViewController(filmDetailsVC ?? UIViewController(), animated: true)
    }
}

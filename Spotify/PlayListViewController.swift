//
//  PlayListViewController.swift
//  Spotify
//
//  Created by Mohsen Moghimi on 10/16/19.
//  Copyright © 2019 Mohsen Moghimi. All rights reserved.
//

import UIKit
import RxSwift
import Kingfisher

protocol SearcherDelegate {
    func performSearch()
}

class PlayListViewController: UIViewController {
    
    fileprivate let bag = DisposeBag()
    fileprivate var tracks : Tracks? = nil
    fileprivate var networkErrorAware: NetworkErrorAwareProtocol? = nil
    fileprivate var currenWaintingtMode: WaitingMode = .wait
    fileprivate var searchWasFailed = false
    fileprivate var items = [Items]()
    
    @IBOutlet weak var searchBar: UISearchBar! {
        didSet {
            searchBar.returnKeyType = .done
            searchBar.showsScopeBar = false
            searchBar.delegate = self
        }
    }
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.tableFooterView = UIView()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        KingfisherManager.shared.cache.memoryStorage.config.totalCostLimit = 10000
    }
    
    fileprivate func searchFor(text: String, currentTrack: Tracks?) {
        let viewModel = PlayListViewModel(title: text, offset: currentTrack?.offset ?? 0)
        viewModel.searchResult.subscribe({ [weak self] event in
            if event.error != nil {
                guard let error = event.error else { return }
                self?.showAlert(with: "Error", message: "\(error.localizedDescription)")
                self?.networkErrorAware?.configure(mode: .retry)
                self?.searchWasFailed = true
                return
            }
            guard let dataSource = event.element else { return }
            self?.networkErrorAware?.configure(mode: .wait)
            self?.items.append(contentsOf: (dataSource.tracks?.items)!)
            self?.tracks = dataSource.tracks
            self?.tableView.reloadData()
        }).disposed(by: bag)
    }
    
    
}

extension PlayListViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        tracks = nil
        items = [Items]()
        networkErrorAware = nil
        performSearch()
        tableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.view.endEditing(true)
    }
    
}

extension PlayListViewController : UITableViewDelegate {
    
}

extension PlayListViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let tracks = self.tracks {
            let hasMore = tracks.next != nil
            return self.items.count + (hasMore ? 1 : 0)
        }
        return (currenWaintingtMode == .retry ? 1 : 0)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == items.count{
            let loadingCell : RetryTableViewCell = tableView.dequeueReusableCell(withIdentifier: "RetryTableViewCell", for: indexPath) as! RetryTableViewCell
            performSearch()
            loadingCell.configure(mode: currenWaintingtMode)
            loadingCell.searcher = self
            networkErrorAware = loadingCell 
            return loadingCell
        }
        let cell : PlayListTableViewCell = tableView.dequeueReusableCell(withIdentifier: "PlayListTableViewCell", for: indexPath) as! PlayListTableViewCell
        cell.config(model: items[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == items.count {
            return 50
        } else {
            return 120
        }
    }
}

extension PlayListViewController : SearcherDelegate {
    func performSearch() {
        if let searchText = searchBar.text, searchText != "" {
            searchFor(text: searchText, currentTrack: tracks)
        } else {
            self.searchWasFailed = false
            self.tracks = nil
            self.items = [Items]()
            self.networkErrorAware = nil
            
            self.tableView.reloadData()
        }
    }
}

//
//  HomeVC + Table View Delegates.swift
//  IllhaTask
//
//  Created by A1502 on 26/04/22.
//

import Foundation
import UIKit

// MARK: Tableview  Method
extension ListViewController:  UITableViewDataSource, UITableViewDelegate {
    // MARK: TableView Method
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearching{
            return pListSearch?.countryList?.count ?? 0
            
        } else {
            return pList?.countryList?.count ?? 0
            
        }
    }
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:ListTitleTableViewCell = (tableView.dequeueReusableCell(withIdentifier: "ListTitleTableViewCell") as! ListTitleTableViewCell?)!
        
        let product = self.listViewModelObj?.productAtIndexPath(indexPath:indexPath)
        cell.prepareLayout(objDashboard: product)
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
        
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let searchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 45))
        searchBar.searchBarStyle = .minimal
        searchBar.placeholder = "Search"
        searchBar.backgroundColor = UIColor.lightGray
        searchBar.tintColor = UIColor.white
        searchBar.barTintColor = UIColor.green
        searchBar.delegate = self
        return searchBar
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
}

// MARK: CollectionView Method
extension ListViewController:UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UIScrollViewDelegate{
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pList?.imageHeader?.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: ImageCollectionCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionCollectionViewCell", for: indexPath) as! ImageCollectionCollectionViewCell
        let product = self.listViewModelObj?.productAtIndexPathImage(indexPath:indexPath)
        cell.prepareLayout(objDashboard: product)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: collectionView.frame.size.width, height: 200)
        return size
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.isPagingEnabled{
            var visibleRect = CGRect()
            visibleRect.origin = imageCollection.contentOffset
            visibleRect.size = imageCollection.bounds.size
            let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
            guard let indexPath1 = imageCollection.indexPathForItem(at: visiblePoint) else { return }
            pageControlNew.currentPage = indexPath1.row
            DispatchQueue.main.async {
                self.listViewModelObj?.shuffleArrayCallBack(completion:{ response in
                    self.tblData.reloadData()
                })
            }
        }
    }
}
// MARK: Search Bar Delegate
extension ListViewController :UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            searchBar.resignFirstResponder()
            isSearching = false
            pListSearch = pList
            
        } else {
            isSearching = true
            self.listViewModelObj?.loadSearchResult(updatedSerachText: searchText, completion:{ response in
            })
            
        }
        self.tblData.reloadData()
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}

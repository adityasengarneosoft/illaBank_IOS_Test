//
//  PostingViewController.swift
//  IllhaTask
//
//  Created by A1502 on 23/08/21.
//

import UIKit

class  ListViewController: UIViewController {
    
    @IBOutlet weak var pageControlNew: UIPageControl!
    @IBOutlet weak var imageCollection: UICollectionView!
    @IBOutlet weak var tblData: UITableView!
    var listViewModelObj:ListViewModel?
    
    // MARK: Life Cycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
        self.listViewModelObj = ListViewModel()
        getDataFromFile()
        
    }
    func setupPageControl(){
        tblData.separatorColor = UIColor.clear
        pageControlNew.currentPage = 0
        pageControlNew.tintColor = UIColor.red
        pageControlNew.pageIndicatorTintColor = UIColor.black
        pageControlNew.currentPageIndicatorTintColor = UIColor.green
        pageControlNew.numberOfPages = pList?.imageHeader?.count ?? 0
        self.imageCollection.isPagingEnabled = true;
        
    }
    
    func getDataFromFile() {
        listViewModelObj?.loadProductsList(filename: "ListData", completion: { response in
            if  self.listViewModelObj?.numberOfRows() == 0  {
                
            } else {
                DispatchQueue.main.async {
                    if response.countryList?.count ?? 0>0{
                        self.setupPageControl()
                        self.tblData.reloadData()
                        self.imageCollection.reloadData()
                    }
                }
            }
            
        })
        
    }
}



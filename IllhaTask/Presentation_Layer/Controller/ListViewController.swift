//
//  PostingViewController.swift
//  IllhaTask
//
//  Created by A1502 on 26/04/22.
//

import UIKit

class  ListViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var pageControlNew: UIPageControl!
    @IBOutlet weak var imageCollection: UICollectionView!
    @IBOutlet weak var tblData: UITableView!
    var listViewModelObj:ListViewModel?
    
    // MARK: Life Cycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        self.listViewModelObj = ListViewModel()
        getDataFromFile()
    }
    // MARK: Custom Method Defination
    func setupPageControl(){
        tblData.separatorColor = UIColor.clear
        pageControlNew.currentPage = 0
        pageControlNew.tintColor = UIColor.red
        pageControlNew.pageIndicatorTintColor = UIColor.black
        pageControlNew.currentPageIndicatorTintColor = UIColor.green
        pageControlNew.numberOfPages = pList?.imageHeader?.count ?? 0
        self.imageCollection.isPagingEnabled = true;
    }
    //Calls this function when the tap is recognized.
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    func getDataFromFile() {
        listViewModelObj?.loadProductsList(completion: { response in
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



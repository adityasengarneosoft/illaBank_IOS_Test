//
//  ListViewModel.swift
//  Ilabank_App
//
//  Created by A1502 on 26/04/22.
//

import Foundation
import UIKit
import CoreData

protocol ListViewModeleDelegate {
    
    func numberOfRows()->Int
    func productAtIndexPathImage(indexPath:IndexPath)->ImageHeader
    func productAtIndexPath(indexPath:IndexPath)->countryList
    func loadProductsList(filename:String,completion:@escaping UserListReturnemptyCompletionHandler)
    func loadSearchResult(updatedSerachText:String,completion:@escaping UserCoutrySearchReturnemptyCompletionHandler)
    func shuffleArrayCallBack(completion:@escaping shuffleArrayHandler)

    
}
class ListViewModel : ListViewModeleDelegate {

    func readLocalFile(forName name: String,completion: @escaping UserListReturnemptyCompletionHandler)  {
        do {
            if let bundlePath = Bundle.main.path(forResource: name,
                                                 ofType: "json"),
               let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                pList =   self.parse(jsonData: jsonData)!
                pListSearch = pList
                completion(pList!)
                
            }
        } catch {
            print(error)
        }
        
    }
    func parse(jsonData: Data) -> List?
    {
        do {
            let decodedData = try JSONDecoder().decode(List.self,
                                                       from: jsonData)
            pList = decodedData
        } catch {
            print("decode error")
        }
        return pList
        
    }
}
extension ListViewModel {

    func shuffleArrayCallBack(completion: @escaping shuffleArrayHandler) {
        if isSearching{
            pListSearch?.countryList?.shuffle()
        } else {
            pList?.countryList?.shuffle()
        }
        completion(true)
    }
}

extension ListViewModel {
    
    /*
     * Method name: numberOfRows
     * Description: use to get products count
     * Parameters: section
     * Return:  Int
     */
    func numberOfRows()->Int {
        if isSearching{
            return pListSearch?.countryList?.count ?? 0
            
        } else{
            return pList?.countryList?.count ?? 0
        }
    }
    /*
     * Method name: productAtIndexPath
     * Description: use to get product from particular index
     * Parameters: indexPath
     * Return:  Product
     */
    func productAtIndexPath(indexPath:IndexPath)->countryList {
        if isSearching{
            return (pListSearch?.countryList?[indexPath.row])!
            
        }else{
            return (pList?.countryList?[indexPath.row])!
        }
    }
    func productAtIndexPathImage(indexPath:IndexPath)->ImageHeader {
        return (pList?.imageHeader?[indexPath.row])!
    }
}
extension ListViewModel {
    /*
     * Method name: loadProductsList
     * Description: use to get product from api
     * Parameters: completion handler
     * Return:  -
     */
    func loadProductsList(filename: String, completion: @escaping UserListReturnemptyCompletionHandler) {
        readLocalFile(forName: filename, completion: { response in
            completion(response)
            
        })
    }
    func loadSearchResult(updatedSerachText: String, completion: @escaping UserCoutrySearchReturnemptyCompletionHandler) {
        pListSearchCountry?.removeAll()
        pListSearchCountry = pListSearch?.countryList?.filter{ $0.title!.range(of: updatedSerachText, options: .caseInsensitive) != nil }
        pListSearch?.countryList? = pListSearchCountry!
        completion((pListSearch?.countryList)!)
    }
    
    
}


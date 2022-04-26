//
//  CustomAlias.swift
//  Ilabank_App
//
//  Created by A1502 on 26/04/22.
//

import Foundation

var pList: List?
var pListSearch: List?
var pListSearchCountry: [countryList]?
var isSearching:Bool = false
typealias UserListReturnemptyCompletionHandler = (List)->()
typealias UserCoutrySearchReturnemptyCompletionHandler = ([countryList])->()
typealias shuffleArrayHandler = (Bool)->()

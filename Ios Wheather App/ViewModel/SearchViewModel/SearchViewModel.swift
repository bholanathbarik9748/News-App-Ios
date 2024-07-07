//
//  SearchViewModel.swift
//  Ios Wheather App
//
//  Created by Bholanath Barik on 07/07/24.
//

import Foundation

class SearchViewModel : ObservableObject {
    @Published var searchText = "";
    
    func clearSearchBarText() {
        self.searchText = "";
    }
}

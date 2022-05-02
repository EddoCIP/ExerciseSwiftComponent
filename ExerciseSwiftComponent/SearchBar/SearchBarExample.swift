//
//  SearchBarExample.swift
//  ExerciseSwiftComponent
//
//  Created by Eddo Careera Iriyanto Putra on 29/04/22.
//

import SwiftUI

struct SearchBarExample: View {
    let names = ["Holly", "Josh", "Rhonda", "Ted"]
    @State var keywordSearch: String = ""
    
    
    var body: some View {
        NavigationView {
            List {
                ForEach(searchResults, id: \.self) { name in
                    NavigationLink(destination: Text(name)) {
                        Text(name)
                    }
                }
            }
            .searchable(text: $keywordSearch) {
//                ForEach(searchResults, id: \.self) { result in
//                    Text("Are you looking for \(result)?").searchCompletion(result)
//                }
            }
        }
    }
    
    var searchResults: [String] {
        if keywordSearch.isEmpty {
            return names
        } else {
            return names.filter { $0.contains(keywordSearch) }
        }
    }
}

struct SearchBarExample_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarExample()
    }
}

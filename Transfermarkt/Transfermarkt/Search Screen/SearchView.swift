//
//  SearchView.swift
//  Transfermarkt
//
//  Created by Zhiyun Lin on 1/16/24.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    private let searchSuggestions = ["Competition", "Club", "Player"]

    var body: some View {
        NavigationStack {
            List {
                ForEach(searchSuggestions, id: \.self) { name in
                    NavigationLink {
                        Text(name)
                    } label: {
                        Text(name)
                    }
                }
            }
        }
        .searchable(text: $searchText) {
            ForEach(searchSuggestions, id: \.self) { name in
                HStack {
                    Text(name + ": " + searchText).searchCompletion(name)
                }
                
            }
        }
    }
}

#Preview {
    SearchView()
}

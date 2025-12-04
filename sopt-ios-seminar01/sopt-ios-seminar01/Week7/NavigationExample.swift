//
//  NavigationExample.swift
//  sopt-ios-seminar01
//
//  Created by mandoo on 11/29/25.
//

import SwiftUI

struct NavigationExample: View {
    var body: some View {
        NavigationStack {
            NavigationLink {
                DetailView()
            } label: {
                Label("Work Folder", systemImage: "folder")
            }
            
            NavigationLink("Teal"){
                DetailView()
            }
        }
    }
}

struct DetailView: View {
    var body: some View {
    }
}

#Preview {
    NavigationExample()
}

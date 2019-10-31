//
//  ContentView.swift
//  H4Q0R
//
//  Created by Sanasar Janjughazyan on 10/30/19.
//  Copyright © 2019 Sanasar Janjughazyan. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            List(networkManager.posts) { post in
                HStack {
                    NavigationLink(destination: DetailView(url: post.url)) {
                        Text("\(post.points)")
                        Text(post.title)
                    }
                }
            }
            .navigationBarTitle("H4Q0R NEWS")
        }
        .onAppear {
            self.networkManager.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

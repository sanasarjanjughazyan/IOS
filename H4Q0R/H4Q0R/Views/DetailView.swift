//
//  DetailView.swift
//  H4Q0R
//
//  Created by Sanasar Janjughazyan on 10/31/19.
//  Copyright © 2019 Sanasar Janjughazyan. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    let url: String?
    
    var body: some View {
        WebView(urlString: url)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "https//www.google.com")
    }
}

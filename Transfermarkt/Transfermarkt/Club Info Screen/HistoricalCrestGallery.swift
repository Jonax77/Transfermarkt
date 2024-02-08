//
//  HistoricalCrestGallery.swift
//  Transfermarkt
//
//  Created by Zhiyun Lin on 1/27/24.
//

import SwiftUI

struct HistoricalCrestGallery: View {
    
    let historicalCrests = ["https://tmssl.akamaized.net/images/wappen/medium/46_1401907374.png", "https://tmssl.akamaized.net/images/wappen/medium/46_1401907435.png", "https://tmssl.akamaized.net/images/wappen/medium/46_1401907409.png", "https://tmssl.akamaized.net/images/wappen/medium/46_1401907763.png", "https://tmssl.akamaized.net/images/wappen/medium/46_1401907797.png", "https://tmssl.akamaized.net/images/wappen/medium/46_1401907807.png", "https://tmssl.akamaized.net/images/wappen/medium/46_1404733860.png", "https://tmssl.akamaized.net/images/wappen/medium/46_1406107110.png", "https://tmssl.akamaized.net/images/wappen/medium/46_1617091918.png", "https://tmssl.akamaized.net/images/wappen/medium/46_1618901155.png"]
    
    private var threeColumnGrid = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        
       
            
            
            
            GroupBox {
            
            DisclosureGroup(
                content: {
                    ScrollView {
                        LazyVGrid(columns: threeColumnGrid) {
                                ForEach(historicalCrests, id: \.self) { crest in
                                    AsyncImage(url: URL(string: crest) ) {
                                        image in
                                        image.resizable().frame(width: 100, height: 100)
                                            
                                            .aspectRatio(contentMode: .fit)
                                        
                                    } placeholder: {
                                        ProgressView()
                                    }
                                }
                            
                        }
                    }
                    
            }, label: {
                HStack {
                    Text("Historical Crests").font(.custom(SpaceGrotesk.Bold, size: 18)).foregroundColor(.primary)
                    Spacer()
                }
            })
            
            
            
        }
        
        
    }
}

#Preview {
    HistoricalCrestGallery()
}

//
//  MarketValueLineChart.swift
//  Transfermarkt
//
//  Created by Zhiyun Lin on 1/26/24.
//

import SwiftUI
import Charts

struct MarketValueLineChart: View {
    
    let marketValueHistory: [MarketValue] = [
        MarketValue(age: "16", date: "Dec 2, 2015", clubName: "AS Monaco U19", value: "€50k", clubID: "9669"),
        MarketValue(age: "17", date: "Feb 4, 2016", clubName: "AS Monaco", value: "€250k", clubID: "162"),
        MarketValue(age: "17", date: "Apr 9, 2016", clubName: "AS Monaco", value: "€1.00m", clubID: "162"),
        MarketValue(age: "17", date: "Jul 13, 2016", clubName: "AS Monaco", value: "€1.50m", clubID: "162"),
        MarketValue(age: "17", date: "Nov 1, 2016", clubName: "AS Monaco", value: "€4.00m", clubID: "162"),
        MarketValue(age: "18", date: "Jan 16, 2017", clubName: "AS Monaco", value: "€10.00m", clubID: "162"),
        MarketValue(age: "18", date: "Jun 1, 2017", clubName: "AS Monaco", value: "€35.00m", clubID: "162"),
        MarketValue(age: "18", date: "Oct 12, 2017", clubName: "Paris Saint-Germain", value: "€90.00m", clubID: "583"),
        MarketValue(age: "19", date: "Jan 24, 2018", clubName: "Paris Saint-Germain", value: "€120.00m", clubID: "583"),
        MarketValue(age: "19", date: "Jun 4, 2018", clubName: "Paris Saint-Germain", value: "€120.00m", clubID: "583"),
        MarketValue(age: "19", date: "Jul 16, 2018", clubName: "Paris Saint-Germain", value: "€150.00m", clubID: "583"),
        MarketValue(age: "19", date: "Oct 24, 2018", clubName: "Paris Saint-Germain", value: "€180.00m", clubID: "583"),
        MarketValue(age: "19", date: "Dec 17, 2018", clubName: "Paris Saint-Germain", value: "€200.00m", clubID: "583"),
        MarketValue(age: "20", date: "Jun 3, 2019", clubName: "Paris Saint-Germain", value: "€200.00m", clubID: "583"),
        MarketValue(age: "20", date: "Dec 19, 2019", clubName: "Paris Saint-Germain", value: "€200.00m", clubID: "583"),
        MarketValue(age: "21", date: "Apr 8, 2020", clubName: "Paris Saint-Germain", value: "€180.00m", clubID: "583"),
        MarketValue(age: "21", date: "Oct 15, 2020", clubName: "Paris Saint-Germain", value: "€180.00m", clubID: "583"),
        MarketValue(age: "22", date: "Apr 9, 2021", clubName: "Paris Saint-Germain", value: "€160.00m", clubID: "583"),
        MarketValue(age: "22", date: "Jun 1, 2021", clubName: "Paris Saint-Germain", value: "€160.00m", clubID: "583"),
        MarketValue(age: "22", date: "Dec 16, 2021", clubName: "Paris Saint-Germain", value: "€160.00m", clubID: "583"),
        MarketValue(age: "23", date: "May 30, 2022", clubName: "Paris Saint-Germain", value: "€160.00m", clubID: "583"),
        MarketValue(age: "23", date: "Nov 2, 2022", clubName: "Paris Saint-Germain", value: "€160.00m", clubID: "583"),
        MarketValue(age: "24", date: "Dec 23, 2022", clubName: "Paris Saint-Germain", value: "€180.00m", clubID: "583"),
        MarketValue(age: "24", date: "Jun 27, 2023", clubName: "Paris Saint-Germain", value: "€180.00m", clubID: "583"),
        MarketValue(age: "24", date: "Dec 18, 2023", clubName: "Paris Saint-Germain", value: "€180.00m", clubID: "583")
    ]
    
    var body: some View {
        VStack {
            HStack {
                Text("Market Value").font(.custom(SpaceGrotesk.Bold, size: 18))
                Spacer()
            }
            
            Chart(marketValueHistory, id: \.date) { marketValue in
                LineMark(x: .value("Time", marketValue.date ?? ""), y: .value("Market Value", marketValue.value?.transformMarketValue() ?? 0))
                    .interpolationMethod(.catmullRom)
                    .symbol(by: .value("Club", marketValue.clubName ?? ""))
            }
        }.frame(height: 400)
    }
}

#Preview {
    MarketValueLineChart()
}

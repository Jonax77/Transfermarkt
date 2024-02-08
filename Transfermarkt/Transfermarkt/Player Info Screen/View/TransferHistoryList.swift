//
//  TransferHistoryList.swift
//  Transfermarkt
//
//  Created by Zhiyun Lin on 1/26/24.
//

import SwiftUI

struct TransferHistoryList: View {
    let transfer = Transfer(
        id: "2101599",
        from: ClubInTransfer(clubID: "162", clubName: "Monaco"),
        to: ClubInTransfer(clubID: "583", clubName: "Paris SG"),
        date: "Jul 1, 2018",
        upcoming: false,
        season: "18/19",
        marketValue: "€120.00m",
        fee: "€180.00m"
    )
    
    let transferHistory = TransferHistory(
        id: "342229",
        transfers: [Transfer(
            id: "2101599",
            from: ClubInTransfer(clubID: "162", clubName: "Monaco"),
            to: ClubInTransfer(clubID: "583", clubName: "Paris SG"),
            date: "Jul 1, 2018",
            upcoming: false,
            season: "18/19",
            marketValue: "€120.00m",
            fee: "€180.00m"
        ), Transfer(
            id: "1900075",
            from: ClubInTransfer(clubID: "583", clubName: "Paris SG"),
            to: ClubInTransfer(clubID: "162", clubName: "Monaco"),
            date: "Jun 30, 2018",
            upcoming: false,
            season: "17/18",
            marketValue: "€120.00m",
            fee: "End of loan"
        ), Transfer(
            id: "1900074",
            from: ClubInTransfer(clubID: "162", clubName: "Monaco"),
            to: ClubInTransfer(clubID: "583", clubName: "Paris SG"),
            date: "Aug 31, 2017",
            upcoming: false,
            season: "17/18",
            marketValue: "€35.00m",
            fee: "loan transfer"
        ), Transfer(
            id: "1450409",
            from: ClubInTransfer(clubID: "9669", clubName: "Monaco U19"),
            to: ClubInTransfer(clubID: "162", clubName: "Monaco"),
            date: "Jan 1, 2016",
            upcoming: false,
            season: "15/16",
            marketValue: "€50k"
        ), Transfer(
            id: "1418599",
            from: ClubInTransfer(clubID: "45617", clubName: "Monaco Youth"),
            to: ClubInTransfer(clubID: "9669", clubName: "Monaco U19"),
            date: "Jul 1, 2015",
            upcoming: false,
            season: "15/16"
        ), Transfer(
            id: "2630196",
            from: ClubInTransfer(clubID: "43658", clubName: "Clairef. Yth."),
            to: ClubInTransfer(clubID: "45617", clubName: "Monaco Youth"),
            date: "Jul 1, 2013",
            upcoming: false,
            season: "13/14",
            fee: "free transfer"
        ), Transfer(
            id: "3879058",
            from: ClubInTransfer(clubID: "83011", clubName: "AS Bondy Youth"),
            to: nil,  // Fill in the destination club information if available
            date: "Jul 1, 2013",
            upcoming: false,
            season: "13/14",
            fee: "free transfer"
        )],
        youthClubs: nil,  // Fill in the youth club information if available
        updatedAt: "2024-01-17T18:33:49.880853"
    )
    
    var body: some View {
        GroupBox {
            VStack {
                HStack {
                    Text("Transfer").font(.custom(SpaceGrotesk.Bold, size: 18))
                    Spacer()
                }
                
                GroupBox {
                    ForEach(transferHistory.transfers ?? [], id: \.id) { transfer in
                        VStack {
                            HStack(alignment: .center) {
                                VStack {
                                    Text(transfer.date ?? "").font(.custom(SpaceGrotesk.Light, size: 16))
                                    Text(transfer.marketValue ?? "???").font(.custom(SpaceGrotesk.Regular, size: 16))
                                }.frame(width: 100)
                                
                                HStack {
                                    Spacer()
                                    Text(transfer.from?.clubName ?? "???").font(.custom(SpaceGrotesk.Medium, size: 16))
                                    Image(systemName: "arrow.right")
                                    Text(transfer.to?.clubName ?? "???").font(.custom(SpaceGrotesk.Medium, size: 16))
                                    Spacer()
                                }
                                
                            }
                            Divider()
                        }
                    }
                }
                
                
                
               
            }
        }
    }
}

#Preview {
    TransferHistoryList()
}

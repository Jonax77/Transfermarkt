//
//  ClubBasicInfo.swift
//  Transfermarkt
//
//  Created by Zhiyun Lin on 1/27/24.
//

import SwiftUI

struct ClubBasicInfo: View {
    
    let club = ClubProfile(id: "46", url: "/inter-mailand/startseite/verein/46", name: "Inter Milan", officialName: "Football Club Internazionale Milano S.p.A.", image: "https://tmssl.akamaized.net/images/wappen/big/46.png", legalForm: "AG", addressLine1: "Viale della Liberazione 16/18", addressLine2: "20124 Milano", addressLine3: "Italy", tel: "+39 (2) 82719080", fax: "+39 (031) 890204", website: "www.inter.it", foundedOn: "Mar 9, 1908", members: "110.280", membersDate: "Nov 12, 2014", colors: ["#000000", "#0055A0", "#cfb013"], stadiumName: "Giuseppe Meazza", stadiumSeats: "75923", currentTransferRecord: "+€58.20m", currentMarketValue: "€588.85m", squad: SquadInClub(size: "25", averageAge: "28.7", foreigners: "16", nationalTeamPlayers: "20"), league: LeagueInClub(id: "IT1", name: "Serie A", countryID: "7", countryName: "Italy", tier: "First Tier"), historicalCrests: ["https://tmssl.akamaized.net/images/wappen/medium/46_1401907374.png", "https://tmssl.akamaized.net/images/wappen/medium/46_1401907435.png", "https://tmssl.akamaized.net/images/wappen/medium/46_1401907409.png", "https://tmssl.akamaized.net/images/wappen/medium/46_1401907763.png", "https://tmssl.akamaized.net/images/wappen/medium/46_1401907797.png", "https://tmssl.akamaized.net/images/wappen/medium/46_1401907807.png", "https://tmssl.akamaized.net/images/wappen/medium/46_1404733860.png", "https://tmssl.akamaized.net/images/wappen/medium/46_1406107110.png", "https://tmssl.akamaized.net/images/wappen/medium/46_1617091918.png", "https://tmssl.akamaized.net/images/wappen/medium/46_1618901155.png"], updatedAt: "2024-01-27T23:42:46.066602")
    
    var body: some View {
        GroupBox {
            VStack(spacing: 5) {
                HStack {
                    Text("Basic Info").font(.custom(SpaceGrotesk.Bold, size: 18))
                    Spacer()
                }
                
                HStack(alignment: .top) {
                    Text("Full Name: ").font(.custom(SpaceGrotesk.Medium, size: 16))
                    Text(club.officialName ?? "").font(.custom(SpaceGrotesk.Regular, size: 16))
                    Spacer()
                }
                
                HStack(alignment: .top) {
                    Text("Founded: ").font(.custom(SpaceGrotesk.Medium, size: 16))
                    Text(club.foundedOn ?? "").font(.custom(SpaceGrotesk.Regular, size: 16))
                    Spacer()
                }
                
                HStack(alignment: .top) {
                    Text("Ground: ").font(.custom(SpaceGrotesk.Medium, size: 16))
                    Text(club.stadiumName ?? "").font(.custom(SpaceGrotesk.Regular, size: 16))
                    Spacer()
                }
                
                HStack(alignment: .top) {
                    Text("Capacity: ").font(.custom(SpaceGrotesk.Medium, size: 16))
                    Text(club.stadiumSeats ?? "").font(.custom(SpaceGrotesk.Regular, size: 16))
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    ClubBasicInfo()
}

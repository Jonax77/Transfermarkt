//
//  ClubProfileHeader.swift
//  Transfermarkt
//
//  Created by Zhiyun Lin on 1/27/24.
//

import SwiftUI

struct ClubProfileHeader: View {
    let club = ClubProfile(id: "46", url: "/inter-mailand/startseite/verein/46", name: "Inter Milan", officialName: "Football Club Internazionale Milano S.p.A.", image: "https://tmssl.akamaized.net/images/wappen/big/46.png", legalForm: "AG", addressLine1: "Viale della Liberazione 16/18", addressLine2: "20124 Milano", addressLine3: "Italy", tel: "+39 (2) 82719080", fax: "+39 (031) 890204", website: "www.inter.it", foundedOn: "Mar 9, 1908", members: "110.280", membersDate: "Nov 12, 2014", colors: ["#000000", "#0055A0", "#cfb013"], stadiumName: "Giuseppe Meazza", stadiumSeats: "75923", currentTransferRecord: "+€58.20m", currentMarketValue: "€588.85m", squad: SquadInClub(size: "25", averageAge: "28.7", foreigners: "16", nationalTeamPlayers: "20"), league: LeagueInClub(id: "IT1", name: "Serie A", countryID: "7", countryName: "Italy", tier: "First Tier"), historicalCrests: ["https://tmssl.akamaized.net/images/wappen/medium/46_1401907374.png", "https://tmssl.akamaized.net/images/wappen/medium/46_1401907435.png", "https://tmssl.akamaized.net/images/wappen/medium/46_1401907409.png", "https://tmssl.akamaized.net/images/wappen/medium/46_1401907763.png", "https://tmssl.akamaized.net/images/wappen/medium/46_1401907797.png", "https://tmssl.akamaized.net/images/wappen/medium/46_1401907807.png", "https://tmssl.akamaized.net/images/wappen/medium/46_1404733860.png", "https://tmssl.akamaized.net/images/wappen/medium/46_1406107110.png", "https://tmssl.akamaized.net/images/wappen/medium/46_1617091918.png", "https://tmssl.akamaized.net/images/wappen/medium/46_1618901155.png"], updatedAt: "2024-01-27T23:42:46.066602")
    
    var body: some View {
        
        GroupBox {
            VStack {
                HStack {
                    Spacer()
                    AsyncImage(url: URL(string: club.image ?? "")) { image in
                        image.resizable().aspectRatio(contentMode: .fill)
                    } placeholder: {
                        ProgressView()
                    }.frame(width: 150, height: 150)
                        .clipShape(Circle())
                        
                    Spacer()
                }
                
                HStack {
                    Spacer()
                    Text(club.name ?? "").font(.custom(SpaceGrotesk.Bold, size: 24))
                    Spacer()
                }.padding(.bottom, 5)
                
                HStack {
                    Spacer()
                    Text(club.league?.name ?? "").font(.custom(SpaceGrotesk.Regular, size: 16))
                    Text("/").font(.custom(SpaceGrotesk.Regular, size: 16))
                    Text(club.currentMarketValue ?? "").font(.custom(SpaceGrotesk.Regular, size: 16))
                    Spacer()
                }
            }
        }
        
        
    }
}

#Preview {
    ClubProfileHeader()
}

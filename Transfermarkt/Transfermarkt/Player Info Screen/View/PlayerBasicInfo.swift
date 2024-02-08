//
//  PlayerBasicInfo.swift
//  Transfermarkt
//
//  Created by Zhiyun Lin on 1/26/24.
//

import SwiftUI

struct PlayerBasicInfo: View {
    
    let profile = PlayerProfile(
        id: "406625",
        url: "/lautaro-martinez/profil/spieler/406625",
        name: "Martínez",
        description: "Lautaro Martínez, 26, from Argentina ➤ Inter Milan, since 2018 ➤ Attack ➤ Market value: €110.00m ➤ * Aug 22, 1997 in Bahía Blanca, Argentina",
        nameInHomeCountry: "Lautaro Javier Martínez",
        imageURL: "https://img.a.transfermarkt.technology/portrait/header/406625-1695024988.jpg?lm=1",
        dateOfBirth: "Aug 22, 1997",
        placeOfBirth: PlaceOfBirth(city: "Bahía Blanca", country: "Argentina"),
        age: "26",
        height: "1,74m",
        citizenship: ["Argentina"],
        isRetired: false,
        position: Position(main: "Centre-Forward", other: ["Second Striker"]),
        foot: "right",
        shirtNumber: "#10",
        club: ClubInPlayerProfile(id: "46", name: "Inter", joined: "Jul 4, 2018", contractExpires: "Jun 30, 2026"),
        marketValue: "€110.00m",
        agent: Agent(name: "Footfeel ISM", url: "/footfeel-ism/beraterfirma/berater/4477"),
        outfitter: "Nike",
        socialMedia: ["http://www.instagram.com/lautaromartinez/"],
        updatedAt: "2024-01-17T18:33:49.880853"
    )
    
    var body: some View {
        GroupBox {
            VStack(spacing: 5) {
                HStack {
                    Text("Basic Info").font(.custom(SpaceGrotesk.Bold, size: 18))
                    Spacer()
                }
                
                HStack {
                    Text("Full Name: ").font(.custom(SpaceGrotesk.Medium, size: 16))
                    Text(profile.nameInHomeCountry ?? "").font(.custom(SpaceGrotesk.Regular, size: 16))
                    Spacer()
                }
                
                HStack {
                    Text("Citizenship: ").font(.custom(SpaceGrotesk.Medium, size: 16))
                    Text(profile.citizenship?.joined(separator: "/") ?? "").font(.custom(SpaceGrotesk.Regular, size: 16))
                    Spacer()
                }
                
                HStack {
                    Text("Birth Date: ").font(.custom(SpaceGrotesk.Medium, size: 16))
                    Text(profile.dateOfBirth ?? "").font(.custom(SpaceGrotesk.Regular, size: 16))
                    Spacer()
                }
                
                HStack {
                    Text("Market Value: ").font(.custom(SpaceGrotesk.Medium, size: 16))
                    Text(profile.marketValue ?? "").font(.custom(SpaceGrotesk.Regular, size: 16))
                    Spacer()
                }
                
                HStack {
                    Text("Contract Expire Date: ").font(.custom(SpaceGrotesk.Medium, size: 16))
                    Text(profile.club?.contractExpires ?? "").font(.custom(SpaceGrotesk.Regular, size: 16))
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    PlayerBasicInfo()
}

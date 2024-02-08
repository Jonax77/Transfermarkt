//
//  PlayerProfileHeader.swift
//  Transfermarkt
//
//  Created by Zhiyun Lin on 1/26/24.
//

import SwiftUI

struct PlayerProfileHeader: View {
    
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
            VStack {
                HStack {
                    Spacer()
                    AsyncImage(url: URL(string: profile.imageURL ?? "")) { image in
                        image.resizable().aspectRatio(contentMode: .fill)
                    } placeholder: {
                        ProgressView()
                    }.frame(width: 150, height: 150)
                        .clipShape(Circle())
                    Spacer()
                }
                
                HStack {
                    Spacer()
                    Text(profile.name ?? "").font(.custom(SpaceGrotesk.Bold, size: 24))
                    Spacer()
                }.padding(.bottom, 5)
                
                VStack(spacing: 5) {
                    HStack {
                        Spacer()
                        Text(profile.nameInHomeCountry ?? "").font(.custom(SpaceGrotesk.Regular, size: 14))
                        Text("/").font(.custom(SpaceGrotesk.Regular, size: 14))
                        
                        Text(profile.citizenship?.joined(separator: ",") ?? "").font(.custom(SpaceGrotesk.Regular, size: 14))
                        
                        
                        Spacer()
                    }
                    
                    HStack {
                        Spacer()
                        Text(profile.age ?? "").font(.custom(SpaceGrotesk.SemiBold, size: 14))
                        Text("yrs").font(.custom(SpaceGrotesk.Regular, size: 14))
                        Text("/").font(.custom(SpaceGrotesk.Regular, size: 14))
                        Text(profile.height ?? "").font(.custom(SpaceGrotesk.SemiBold, size: 14))
                        Text("/").font(.custom(SpaceGrotesk.Regular, size: 14))
                        Text(profile.marketValue ?? "").font(.custom(SpaceGrotesk.SemiBold, size: 14))
                        Spacer()
                    }
                    
                    HStack {
                        Spacer()
                        
                        Text(profile.club?.name ?? "").font(.custom(SpaceGrotesk.SemiBold, size: 14))
                        
                        Text(profile.shirtNumber ?? "").font(.custom(SpaceGrotesk.Regular, size: 14))
                        Text("/").font(.custom(SpaceGrotesk.Regular, size: 14))
                        Text(profile.position?.main ?? "").font(.custom(SpaceGrotesk.Regular, size: 14))
                        
                        Text("/").font(.custom(SpaceGrotesk.Regular, size: 14))
                        
                        Text(profile.foot ?? "").font(.custom(SpaceGrotesk.Regular, size: 14))
                        
                        Spacer()
                    }
                }
                
                
                
                
            }
        }
    }
}

#Preview {
    PlayerProfileHeader()
}

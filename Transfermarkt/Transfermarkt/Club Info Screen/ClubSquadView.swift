//
//  ClubSquadView.swift
//  Transfermarkt
//
//  Created by Zhiyun Lin on 1/27/24.
//

import SwiftUI

struct ClubSquadView: View {
    
    let player = PlayerInSquad(id: "42205",
                        name: "Yann Sommer",
                        position: "Goalkeeper",
                        dateOfBirth: "Dec 17, 1988",
                        age: "35",
                        nationality: ["Switzerland"],
                        height: "1,83m",
                        foot: "right",
                        joinedOn: "Aug 7, 2023",
                        joined: "Joined from Bayern Munich; date: Aug 7, 2023; fee: €6.75m",
                        signedFrom: "Bayern Munich",
                        contract: "€5.00m",
                        marketValue: "€5.00m")
    
    let squad = [PlayerInSquad(id: "42205",
                               name: "Yann Sommer",
                               position: "Goalkeeper",
                               dateOfBirth: "Dec 17, 1988",
                               age: "35",
                               nationality: ["Switzerland"],
                               height: "1,83m",
                               foot: "right",
                               joinedOn: "Aug 7, 2023",
                               joined: "Joined from Bayern Munich; date: Aug 7, 2023; fee: €6.75m",
                               signedFrom: "Bayern Munich",
                               contract: "€5.00m",
                               marketValue: "€5.00m"), PlayerInSquad(id: "42205",
                                                                     name: "Yann Sommer",
                                                                     position: "Goalkeeper",
                                                                     dateOfBirth: "Dec 17, 1988",
                                                                     age: "35",
                                                                     nationality: ["Switzerland"],
                                                                     height: "1,83m",
                                                                     foot: "right",
                                                                     joinedOn: "Aug 7, 2023",
                                                                     joined: "Joined from Bayern Munich; date: Aug 7, 2023; fee: €6.75m",
                                                                     signedFrom: "Bayern Munich",
                                                                     contract: "€5.00m",
                                                                     marketValue: "€5.00m")]
    
    var body: some View {
        
        GroupBox {
            VStack {
                HStack {
                    HStack {
                        Text("Players").font(.custom(SpaceGrotesk.Bold, size: 18))
                        Spacer()
                    }
                }
                
                VStack(spacing: 10) {
                    
                    ForEach(squad, id: \.id) { player in
                        HStack(spacing: 10) {
                            VStack(alignment: .leading) {
                                Text(player.name ?? "").font(.custom(SpaceGrotesk.Regular, size: 18)).lineLimit(1)
                                HStack {
                                    Text((player.age ?? "??") + "yrs").font(.custom(SpaceGrotesk.Light, size: 14))
                                    Text(player.nationality?.joined(separator: "/") ?? "").font(.custom(SpaceGrotesk.Light, size: 14)).lineLimit(1)
                                }
                            }
                            
                            Text(player.position ?? "???").font(.custom(SpaceGrotesk.Regular, size: 16)).lineLimit(1)
                            Text(player.foot ?? "???").font(.custom(SpaceGrotesk.Regular, size: 16)).lineLimit(1)
                            Text(player.marketValue ?? "???").font(.custom(SpaceGrotesk.Regular, size: 16)).lineLimit(1)
                        }
                    }
                    
                    
                }
                
                
            }
        }
        
        
    }
}

#Preview {
    ClubSquadView()
}

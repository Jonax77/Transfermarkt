//
//  PlayerStatsTable.swift
//  Transfermarkt
//
//  Created by Zhiyun Lin on 1/26/24.
//

import SwiftUI

struct PlayerStatsTable: View {
    
    let stats: [Stat] = [
        Stat(competitionID: "CDR", clubID: "368", seasonID: "23/24", competitionName: "Copa del Rey", appearances: "3", goals: "2", minutesPlayed: "244'"),
        Stat(competitionID: "ES1", clubID: "368", seasonID: "23/24", competitionName: "LaLiga", appearances: "11", goals: "1", yellowCards: "3", redCards: "1", minutesPlayed: "987'"),
        Stat(competitionID: "CL", clubID: "368", seasonID: "23/24", competitionName: "Champions League", appearances: "5", goals: "2", assists: "1", yellowCards: "2", minutesPlayed: "450'"),
        Stat(competitionID: "FR1", clubID: "583", seasonID: "22/23", competitionName: "Ligue 1", appearances: "33", goals: "2", assists: "1", yellowCards: "3", redCards: "1", minutesPlayed: "2.707'"),
        Stat(competitionID: "CL", clubID: "583", seasonID: "22/23", competitionName: "Champions League", appearances: "8", yellowCards: "2", minutesPlayed: "720'"),
        Stat(competitionID: "FRC", clubID: "583", seasonID: "22/23", competitionName: "Coupe de France", appearances: "3", goals: "1", minutesPlayed: "181'"),
        Stat(competitionID: "FRCH", clubID: "583", seasonID: "22/23", competitionName: "Trophée des Champions", appearances: "1", goals: "1", minutesPlayed: "90'"),
        Stat(competitionID: "FR1", clubID: "583", seasonID: "21/22", competitionName: "Ligue 1", appearances: "12", goals: "2", yellowCards: "1",  minutesPlayed: "798'"),
        Stat(competitionID: "FRC", clubID: "583", seasonID: "21/22", competitionName: "Coupe de France", appearances: "1", minutesPlayed: "45'"),
        Stat(competitionID: "CL", clubID: "583", seasonID: "21/22", competitionName: "Champions League"),
        Stat(competitionID: "ES1", clubID: "418", seasonID: "20/21", competitionName: "LaLiga", appearances: "15", goals: "2", yellowCards: "3", minutesPlayed: "1.276'"),
        Stat(competitionID: "CL", clubID: "418", seasonID: "20/21", competitionName: "Champions League", appearances: "5", goals: "2", assists: "1", yellowCards: "1", minutesPlayed: "424'"),
        Stat(competitionID: "SUC", clubID: "418", seasonID: "20/21", competitionName: "Supercopa", appearances: "1", minutesPlayed: "90'"),
        Stat(competitionID: "ES1", clubID: "418", seasonID: "19/20", competitionName: "LaLiga", appearances: "35", goals: "11", assists: "1", yellowCards: "10", minutesPlayed: "3.015'"),
        Stat(competitionID: "CL", clubID: "418", seasonID: "19/20", competitionName: "Champions League", appearances: "5", goals: "2", redCards: "1", minutesPlayed: "446'"),
        Stat(competitionID: "CDR", clubID: "418", seasonID: "19/20", competitionName: "Copa del Rey", appearances: "2", minutesPlayed: "157'"),
        Stat(competitionID: "SUC", clubID: "418", seasonID: "19/20", competitionName: "Supercopa", appearances: "2", minutesPlayed: "210'"),
        Stat(competitionID: "ES1", clubID: "418", seasonID: "18/19", competitionName: "LaLiga", appearances: "28", goals: "6", assists: "2", yellowCards: "5", minutesPlayed: "2.475'"),
        Stat(competitionID: "CDR", clubID: "418", seasonID: "18/19", competitionName: "Copa del Rey", appearances: "6", goals: "3", yellowCards: "2", minutesPlayed: "468'"),
        Stat(competitionID: "CL", clubID: "418", seasonID: "18/19", competitionName: "Champions League", appearances: "5", yellowCards: "3", minutesPlayed: "419'"),
        Stat(competitionID: "KLUB", clubID: "418", seasonID: "18/19", competitionName: "Club World Cup", appearances: "2", goals: "1", yellowCards: "1", minutesPlayed: "180'"),
        Stat(competitionID: "USC", clubID: "418", seasonID: "18/19", competitionName: "UEFA Super Cup", appearances: "1", goals: "1", minutesPlayed: "120'"),
        // Continue adding more Stat objects with the remaining data...
    ]
    
    var body: some View {
        
        ScrollView {
            GroupBox {
            
            DisclosureGroup(
                content: {
                    VStack(spacing: 16) {
                        
                        
        //                HStack {
        //                    Picker("Seasons", selection: $selectedSeason) {
        //                        ForEach(seasons, id: \.self) {
        //                            season in
        //                            Text(season).tag(season)
        //                        }
        //                    }.font(.custom(SpaceGrotesk.Light, size: 14))
        //                    Spacer()
        //                }
                        
                        
                            ForEach(stats, id: \.seasonID) { stat in
                                GroupBox {
                                    VStack {
                                        HStack {
                                            Text(stat.seasonID ?? "").font(.custom(SpaceGrotesk.Medium, size: 14))
                                            Spacer()
                                            Text(stat.competitionName ?? "" ).font(.custom(SpaceGrotesk.Medium, size: 14))
                                            
                                        }.padding()
                                        
                                    
                                        
                                            HStack {
                                                GroupBox {
                                                    VStack(spacing: 10) {
                                                        Text("Appearances").font(.custom(SpaceGrotesk.Regular, size: 16)).lineLimit(1)
                                                        Text(stat.appearances ?? "0").font(.custom(SpaceGrotesk.SemiBold, size: 16))
                                                    }
                                                }
                                                
                                                GroupBox {
                                                    VStack(spacing: 10) {
                                                        Text("Goals").font(.custom(SpaceGrotesk.Regular, size: 16))
                                                        Text(stat.goals ?? "0").font(.custom(SpaceGrotesk.SemiBold, size: 16))
                                                    }
                                                }
                                                
                                                GroupBox {
                                                    VStack(spacing: 10) {
                                                        Text("Assists").font(.custom(SpaceGrotesk.Regular, size: 16))
                                                        Text(stat.assists ?? "0").font(.custom(SpaceGrotesk.SemiBold, size: 16))
                                                    }
                                                }
                                                
                                                
                                            }
                                        HStack {
                                                
                                                
                                                GroupBox {
                                                    VStack(spacing: 10) {
                                                        Text("Minutes Played").font(.custom(SpaceGrotesk.Regular, size: 16)).lineLimit(1)
                                                        Text(stat.minutesPlayed ?? "0").font(.custom(SpaceGrotesk.SemiBold, size: 16))
                                                    }
                                                }
                                                
                                            GroupBox {
                                                VStack(spacing: 10) {
                                                    Text("Red").font(.custom(SpaceGrotesk.Regular, size: 16))
                                                    Text(stat.redCards ?? "0").font(.custom(SpaceGrotesk.SemiBold, size: 16))
                                                }
                                            }
                                            
                                            GroupBox {
                                                VStack(spacing: 10) {
                                                    Text("Yellow").font(.custom(SpaceGrotesk.Regular, size: 16))
                                                    Text(stat.yellowCards ?? "0").font(.custom(SpaceGrotesk.SemiBold, size: 16))
                                                }
                                            }
                                            }
                                        
                                        
                                        
                                        
                                        
                                        
                                    }
                                }
                            }
                        
                    }
            }, label: {
                HStack {
                    Text("Stats").font(.custom(SpaceGrotesk.Bold, size: 18)).foregroundColor(.primary)
                    Spacer()
                }
            })
            
            
            
        }}
        
            
        }
        
        

}

#Preview {
    PlayerStatsTable()
}

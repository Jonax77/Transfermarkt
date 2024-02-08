//
//  PlayerInfoView.swift
//  Transfermarkt
//
//  Created by Zhiyun Lin on 1/18/24.
//

import SwiftUI
import Charts

struct PlayerInfoView: View {
    
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
    
    let stat = Stat(competitionID: "CDR", clubID: "368", seasonID: "23/24", competitionName: "Copa del Rey", appearances: "3", goals: "2", minutesPlayed: "244'")
    
    @State private var selectedSeason: String = ""
    
    var seasons: [String] {
        let distinctSeasons = Array(Set(stats.map { $0.seasonID ?? "" })).sorted(by: >)
        return distinctSeasons
    }
    
    let injuries: [Injury] = [
        Injury(season: "23/24", injury: "Thigh problems", from: "Oct 31, 2023", until: "Nov 10, 2023", days: "10 days", gamesMissed: "3", gamesMissedClubs: ["368"]),
        Injury(season: "21/22", injury: "Calf injury", from: "Jan 27, 2022", until: "Mar 31, 2022", days: "63 days", gamesMissed: "10", gamesMissedClubs: ["583"]),
        Injury(season: "21/22", injury: "Muscular problems", from: "Nov 30, 2021", until: "Dec 15, 2021", days: "15 days", gamesMissed: "4", gamesMissedClubs: ["583"]),
        Injury(season: "21/22", injury: "Calf injury", from: "Jul 26, 2021", until: "Nov 22, 2021", days: "119 days", gamesMissed: "19", gamesMissedClubs: ["583"]),
        Injury(season: "20/21", injury: "Tendon irritation", from: "May 6, 2021", until: "Jul 11, 2021", days: "66 days"),
        Injury(season: "20/21", injury: "Corona virus", from: "Apr 13, 2021", until: "Apr 22, 2021", days: "9 days", gamesMissed: "3", gamesMissedClubs: ["418"]),
        Injury(season: "20/21", injury: "Muscle injury", from: "Apr 1, 2021", until: "May 4, 2021", days: "33 days", gamesMissed: "9", gamesMissedClubs: ["418"])
    ]
    
    let injury = Injury(season: "23/24", injury: "Thigh problems", from: "Oct 31, 2023", until: "Nov 10, 2023", days: "10 days", gamesMissed: "3", gamesMissedClubs: ["368"])

    
    var body: some View {
        VStack {
            
            ScrollView {
                // header
                GroupBox {
                    VStack {
                        HStack {
                            Spacer()
                            AsyncImage(url: URL(string: profile.imageURL ?? "")).aspectRatio(contentMode: .fit).clipShape(Circle()).frame(width: 100, height: 100)
                            Spacer()
                        }.padding()
                        
                        HStack {
                            Spacer()
                            Text(profile.name ?? "").font(.custom(SpaceGrotesk.Bold, size: 24))
                            Spacer()
                        }
                        
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
                            Text("/").font(.custom(SpaceGrotesk.Regular, size: 14))
                            Text(profile.shirtNumber ?? "").font(.custom(SpaceGrotesk.Regular, size: 14))
                            
                            Divider()
                            
                            Text(profile.position?.main ?? "").font(.custom(SpaceGrotesk.Regular, size: 14))
                            
                            Text("/").font(.custom(SpaceGrotesk.Regular, size: 14))
                            
                            Text(profile.foot ?? "").font(.custom(SpaceGrotesk.Regular, size: 14))
                            
                            Spacer()
                        }.frame(height: 30)
                        
                        
                    }
                }
                
                // basic info
                GroupBox {
                    VStack(spacing: 5) {
                        HStack {
                            Text("Basic Info").font(.custom(SpaceGrotesk.Bold, size: 18))
                            Spacer()
                        }
                        
                        Divider()
                        
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
                
                
                
               
                // Injury history
                GroupBox {
                    VStack {
                        HStack {
                            Text("Injury").font(.custom(SpaceGrotesk.Bold, size: 18))
                            Spacer()
                        }
                        
                        
                        
                        GroupBox {
                            
                                HStack {
                                    GroupBox {
                                        VStack(spacing: 10) {
                                            Text("Season").font(.custom(SpaceGrotesk.Regular, size: 16))
                                            Text(injury.season ?? "???").font(.custom(SpaceGrotesk.SemiBold, size: 16))
                                        }
                                    }
                                    
                                    GroupBox {
                                        VStack(spacing: 10) {
                                            Text("Injury").font(.custom(SpaceGrotesk.Regular, size: 16))
                                            Text(injury.injury ?? "???").font(.custom(SpaceGrotesk.SemiBold, size: 16)).lineLimit(1)
                                        }
                                    }
                                    
                                    
                                    
                                    
                                
                            }
                            
                            HStack {
                                GroupBox {
                                    VStack(spacing: 10) {
                                        Text("From").font(.custom(SpaceGrotesk.Regular, size: 16))
                                        Text(injury.from ?? "???").font(.custom(SpaceGrotesk.SemiBold, size: 16))
                                    }
                                }
                                
                                GroupBox {
                                    VStack(spacing: 10) {
                                        Text("Until").font(.custom(SpaceGrotesk.Regular, size: 16))
                                        Text(injury.until ?? "???").font(.custom(SpaceGrotesk.SemiBold, size: 16))
                                    }
                                }
                                
                                
                            }
                            
                            HStack {
                                GroupBox {
                                    VStack(spacing: 10) {
                                        Text("Days").font(.custom(SpaceGrotesk.Regular, size: 16))
                                        Text(injury.days ?? "???").font(.custom(SpaceGrotesk.SemiBold, size: 16))
                                    }
                                }
                                
                                GroupBox {
                                    VStack(spacing: 10) {
                                        Text("Games Missed").font(.custom(SpaceGrotesk.Regular, size: 16))
                                        Text(injury.gamesMissed ?? "???").font(.custom(SpaceGrotesk.SemiBold, size: 16))
                                    }
                                }
                            }
                        }
                        
                        
                        
                        
                    }
                }
                
                // stats
                GroupBox {
                    VStack {
                        HStack {
                            Text("Stats").font(.custom(SpaceGrotesk.Bold, size: 18))
                            Spacer()
                        }
                        
                        HStack {
                            Picker("Seasons", selection: $selectedSeason) {
                                ForEach(seasons, id: \.self) {
                                    season in
                                    Text(season).tag(season)
                                }
                            }.font(.custom(SpaceGrotesk.Light, size: 14))
                            Spacer()
                        }
                        
                        
                        
                        
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
                                                Text("Appearances").font(.custom(SpaceGrotesk.Regular, size: 16))
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
                                                Text("Minutes Played").font(.custom(SpaceGrotesk.Regular, size: 16))
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
                
                // market value history
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
                
                // transfer history
                VStack {
                    HStack {
                        Text("Transfer").font(.custom(SpaceGrotesk.Bold, size: 18))
                        Spacer()
                    }
                    
                    Divider()
                    
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
    PlayerInfoView()
}

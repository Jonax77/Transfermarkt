//
//  InjuryHistoryList.swift
//  Transfermarkt
//
//  Created by Zhiyun Lin on 1/26/24.
//

import SwiftUI

struct InjuryHistoryList: View {
    
    let injury = Injury(season: "23/24", injury: "Thigh problems", from: "Oct 31, 2023", until: "Nov 10, 2023", days: "10 days", gamesMissed: "3", gamesMissedClubs: ["368"])
    
    let injuries = [Injury(season: "23/24", injury: "Thigh problems", from: "Oct 31, 2023", until: "Nov 10, 2023", days: "10 days", gamesMissed: "3", gamesMissedClubs: ["368"])]
    
    var body: some View {
        
        GroupBox {
            VStack {
                HStack {
                    Text("Injury").font(.custom(SpaceGrotesk.Bold, size: 18))
                    Spacer()
                }
                
                ForEach(injuries, id: \.from) { injury in
                    GroupBox {
                        VStack(spacing: 5) {
                            
                            
                                
                                    HStack {
                                        Text("Season").font(.custom(SpaceGrotesk.Regular, size: 16))
                                        
                                        Spacer()
                                        
                                        Text(injury.season ?? "???").font(.custom(SpaceGrotesk.SemiBold, size: 16))
                                        
                                        }
                                        

                                            HStack {
                                                Text("Injury").font(.custom(SpaceGrotesk.Regular, size: 16))
                            Spacer()
                                                Text(injury.injury ?? "???").font(.custom(SpaceGrotesk.SemiBold, size: 16)).lineLimit(1)
                                            }

                                        
                                        
                                        
                                        
                                    

                                


                                       HStack {
                                            Text("From").font(.custom(SpaceGrotesk.Regular, size: 16))
                            Spacer()
                                            Text(injury.from ?? "???").font(.custom(SpaceGrotesk.SemiBold, size: 16))
                                    }
                                    

                                        HStack {
                                            Text("Until").font(.custom(SpaceGrotesk.Regular, size: 16))
                            Spacer()
                                            Text(injury.until ?? "???").font(.custom(SpaceGrotesk.SemiBold, size: 16))
                                        }

                                    
                                    


                                        HStack {
                                            Text("Days").font(.custom(SpaceGrotesk.Regular, size: 16))
                            Spacer()
                                            Text(injury.days ?? "???").font(.custom(SpaceGrotesk.SemiBold, size: 16))
                                        }


                            
                                        HStack {
                                            Text("Games Missed").font(.custom(SpaceGrotesk.Regular, size: 16))
                            Spacer()
                                            Text(injury.gamesMissed ?? "???").font(.custom(SpaceGrotesk.SemiBold, size: 16))
                                        }

                                }

                    }
                }
                
                
                
                
                    
                    
            }
        }
        
        
    }
}

#Preview {
    InjuryHistoryList()
}

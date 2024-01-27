//
//  Music.swift
//  music-player
//
//  Created by kehinde on 26/01/2024.
//

import SwiftUI

struct Music: View {
    var body: some View {
        VStack{
            ScrollView(showsIndicators: false){
                VStack{
                    HStack{
                        ZStack(alignment: .leading){
                            
                            Button(action: {
                                
                            }, label: {
                                VStack{
                                    
                                    Image("menu").resizable().frame(width: 30 , height: 30)
                                }.background(Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: 45, height: 45)
                                    .background(.white)
                                    .cornerRadius(10)
                                    .shadow(color: .black.opacity(0.25), radius: 9.5, x: 0, y: 0)).overlay(
                                        HStack{
                                            
                                        }.frame(width: 130, height: 130).background(Color(red: 0.27, green: 0.15, blue: 0.63))
                                            .blur(radius: 107))
                            })
                        }
                        Spacer()
                        VStack{
                            Image("gojo")
                                .resizable()
                                .frame(width: 45, height: 45).shadow(color: .black.opacity(0.25), radius: 11, x: 0, y: 4).overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .inset(by: -2)
                                        .stroke(.white, lineWidth: 4)
                                )
                        }.padding(0)
                        
                        
                    }.padding(.bottom , 50)
                    ZStack(alignment: .topLeading){
                        
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(maxWidth:.infinity).frame(height: 215)
                            .background(
                                
                                Image("blur")
                            )
                            .cornerRadius(20)
                            .blur(radius: 25)
                        
                        
                        ZStack(alignment: .bottomLeading){
                            
                            Image("fonsi-bg")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(.clear)
                            
                            HStack{
                                VStack(alignment: .leading){
                                    HStack{
                                        Text("Luis Fonsi")
                                            .foregroundColor(.white)
                                        Image("verified").resizable().scaledToFit().frame(width: 17 , height: 17)
                                    }
                                    Text("1,322,799,000 Streams")
                                        .font(Font.custom("Inter", size: 12))
                                        .foregroundColor(.white)
                                }
                                Spacer()
                                Button(action: {}, label: {
                                    Text("Follow +").foregroundStyle(.white).background(Rectangle()
                                        .fill(.clear)
                                        .frame(width: 90, height: 30)
                                        .background(Color(red: 0.85, green: 0.85, blue: 0.85).opacity(0.2))
                                        .cornerRadius(20))
                                }).padding(10)
                            }.padding()
                        }
                    }
                    
                    HStack{
                        Text("Top Mix").font(.system(size: 28)).foregroundStyle(Color.musicBlack).bold()
                        Spacer()
                        Text("See all").foregroundStyle(Color.musicBlack)
                    }
                    
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack(spacing:30){
                            ForEach(0..<3){_ in
                                ZStack(alignment: .top){
                                  
                                    Rectangle()
                                        .foregroundColor(.clear)
                                        .frame(width:60, height: 196)
                                        .background(
                                            Image("mini-blur")
                                        )
                                        .cornerRadius(20)                                .blur(radius: 25)
                                    
                                    
                                    
                                    ZStack(alignment: .bottom){
                                        Image("davis").resizable().scaledToFit().frame(width: 169, height: 169)
                                        VStack{
                                            Button(action: {
                                                
                                            }, label: {
                                                HStack{
                                                    Text("hell odavies")
                                                        .foregroundStyle(.white)
                                                        .fontWeight(.bold)
                                                    Image(systemName: "play.circle.fill").foregroundStyle(.white)
                                                }.padding(10).background(
                                                    Rectangle()
                                                        .fill(Color("t").opacity(0.2))
                                                        .cornerRadius(20))
                                            })
                                        }.padding()
                                        
                                        
                                    }
                                    
                                }
                            }
                        }
                    }
                    
                    HStack{
                        Text("Recently played").font(.system(size: 28)).foregroundStyle(Color.musicBlack).bold()
                        Spacer()
                        Text("See all").foregroundStyle(Color.musicBlack)
                    }.padding(.top , 30)
                    
                    VStack(alignment: .leading , spacing: 30){
                        ForEach(0..<3){_ in
                            HStack{
                                HStack{
                                    Image("never").resizable().scaledToFit().frame(width: 60, height: 60).cornerRadius(20)
                                    VStack(alignment: .leading){
                                        Text("Never").font(.system(size: 16)).foregroundStyle(Color.musicBlack).fontWeight(.semibold)
                                        Text("Heart . VEVO")
                                            .font(Font.custom("Inter", size: 14).weight(.medium))
                                            .foregroundColor(Color(red: 0.27, green: 0.15, blue: 0.63).opacity(0.70))
                                    }
                                }
                                Spacer()
                                Image(systemName: "ellipsis").rotationEffect(.init(degrees: 90))
                            }
                        }

                    }
                    
                }.padding()
                Spacer()
            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity).background(Color.background)
    }
}

#Preview {
    Music()
}

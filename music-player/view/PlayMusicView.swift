//
//  PlayMusicView.swift
//  music-player
//
//  Created by kehinde on 28/01/2024.
//

import SwiftUI

let musicArray = ["https://assets.talentlitmus.com/gamesounds/timer-10-seconds.mp3" , "https://res.cloudinary.com/kehindebankole/video/upload/v1706444123/vfg7z8rgy86hd3kb1th3.mp3"]

struct PlayMusicView: View {
    
    @State var currentMusic = 0
    @State var myAudio = PlayerAudio(sound:musicArray[0])
    @State var isPlay = false
    let timer = Timer.publish(every: 1, on: .main, in: .common)
    @State var timeSpent : Double = 0
    
    func changeMusic(){
        myAudio = PlayerAudio(sound: musicArray[currentMusic])
        myAudio.restart()
        myAudio.playSound()
        timeSpent = 0
    }
    
    var body: some View {
        VStack(spacing:30){
            ZStack(alignment: .topLeading){
                
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(maxWidth:.infinity).frame(height: 215)
                    .background(
                        
                        Image("blur")
                    )
                    .cornerRadius(20)
                    .blur(radius: 25)
                
                Image("music-view")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.clear)
            }
            
            HStack{
                VStack(alignment: .leading){
                    Text("Raataan Lambiyan").font(.system(size: 24)).foregroundStyle(Color.musicBlack).fontWeight(.bold)
                    Text("Tanishk Bagchi")
                        .font(Font.custom("Inter", size: 16))
                        .foregroundColor(Color(red: 1, green: 1, blue: 1).opacity(0.60))
                }
                
                Spacer()
                Image(systemName: "heart.fill").foregroundStyle(.red)
            }
            
            ProgressView(value: timeSpent, total:myAudio.getDuration().isNaN  ? 100 : myAudio.getDuration().rounded(.up)).id(currentMusic).onReceive(timer.throttle(for: 1, scheduler: RunLoop.main, latest: false)){ data in
                print(data)
                if(isPlay && timeSpent != myAudio.getDuration().rounded(.up)){
                    timeSpent+=1
                }
            }
            
            
            HStack(alignment: .center){
                Button(action: {
                    currentMusic -= 1
                    changeMusic()
                }, label: {
                    Image(systemName: "playpause").rotationEffect(.degrees(-180)).foregroundStyle(Color.musicPurple)
                }).disabled(currentMusic==0)
                Spacer()
                Button(action: {
                    
                    if(timeSpent == myAudio.getDuration().rounded(.up)){
                        myAudio.restart()
                        myAudio.playSound()
                        timeSpent = 0
                        isPlay.toggle()
                    }
                    if(isPlay){
                        myAudio.pauseSound()
                    }else{
                        
                        myAudio.playSound()
                        
                        _ =   timer.autoconnect().upstream.connect()
                    }
                    
                    isPlay.toggle()
                    print(myAudio.getDuration())
                }, label: {
                    
                    Image(systemName: isPlay  && timeSpent != myAudio.getDuration().rounded(.up) ? "pause" : "play")
                        .animation(nil)
                        .foregroundStyle(.white)
                        .frame(width: 80, height: 80)
                        .background(Circle()
                            .fill(
                                LinearGradient(gradient: Gradient(colors: [Color(red: 0.44, green: 0.31, blue: 0.82), Color(red: 0.68, green: 0.57, blue: 1)]), startPoint: .bottomLeading, endPoint: .topTrailing)
                            )
                                .foregroundColor(.clear)
                                .frame(width: 80, height: 80)
                        )
                }).padding(.top,20)
                Spacer()
                Button(action: {
                    currentMusic += 1
                    changeMusic()
                }, label: {
                    Image(systemName: "playpause").foregroundStyle(Color.musicPurple)
                }).disabled(currentMusic == musicArray.count - 1)
            }
            Spacer()
        }.padding().background(Color.background)
    }
}

#Preview {
    PlayMusicView()
}

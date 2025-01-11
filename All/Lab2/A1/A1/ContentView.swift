//
//  ContentView.swift
//  A1
//
//  Created by Gaming Lab on 31/10/24.
//

import SwiftUI

struct ContentView: View {

    
    @State var cpuCard = "card13"
    @State var playerCard = "card12"
    @State var playerScore = 0
    @State var cpuScore = 0
    @State var result = " "

    
    var body: some View {
        ZStack{
            Image("background-wood-cartoon")
                .resizable()
                .ignoresSafeArea()
            
            VStack{
                
                Spacer()
                
                Image("logo")
                Spacer()
                HStack{
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(cpuCard)
                    Spacer()
                }
                Spacer()
                
                Button{
                  deal()
                }label:{
                    Image("button")
                }
                Spacer()
                HStack{
                    Spacer()
                    VStack{
                        Text("Player")
                            .font(.headline)
                        Text(String(playerScore))
                            .font(.largeTitle)
                            .padding(.bottom,10.0)
                    }
                    
                    Spacer()
                    VStack{
                        Text("KUET")
                            .font(.headline)
                        Text(String(cpuScore))
                            .font(.largeTitle)
                            .padding(.bottom,10.0)
                    }
                    Spacer()
                    
                }
                .foregroundColor(.white)
                Spacer()
                Text(result)
                    .font(.largeTitle)
                    .padding(.bottom,10.0)
                    .foregroundColor(.white)
                Spacer()
                
                
                
            }
        }
    }
    
    func deal()
    {
        result = " "
        
        let playerCurrentCard = Int.random(in: 2...14)
        playerCard = "card" + String(playerCurrentCard)
        
        let cpuCurrentCard = Int.random(in: 2...14)
        cpuCard = "card" + String(cpuCurrentCard)
        
        if playerCurrentCard > cpuCurrentCard {
            playerScore+=1
        }
        else if(cpuCurrentCard > playerCurrentCard)
        {
            cpuScore+=1
        }
        else
        {
            playerScore+=1
            cpuScore+=1
        }
        
        
        if(playerScore >= 10 && cpuScore < 10)
        {
            result="Player ekta gab"
            playerScore=0
            cpuScore=0
        }
        else if(playerScore < 10 && cpuScore >= 10)
        {
            result="KUET ekta gab"
            playerScore=0
            cpuScore=0
        }
        else if(playerScore == 10 && cpuScore == 10)
        {
            result="Match Tie"
            playerScore=0
            cpuScore=0
        }
        
        
    }
}

#Preview {
    ContentView()
}





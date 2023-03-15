//
//  Block_button.swift
//  roulette
//
//  Created by 李炘杰 on 2023/3/15.
//

import SwiftUI

struct Block_button: View {
    let number: chac
    @Binding var Selected: Array<SelectedNumber>
    @Binding var amount: Int
    @Binding var IsClear: Bool
    @Binding var lackofbudget: Bool
    @State private var IsClick = false
    @State var ShowChips = ""
    @EnvironmentObject var chips: betCount
    var body: some View {
        Button {
            if(chips.budget <= 0) {
                lackofbudget = true
                return
            }
            IsClick = true
            ShowChips = String(amount)
            chips.total += amount
            chips.budget -= amount
            Selected.append(SelectedNumber(number: [number.number], money: amount))
        } label: {
            if IsClick{
                Text("\(number.number)")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .frame(width: 50,height: 50)
                    .background(number.color)
                    .background(.white)
                    .overlay {
                        Image(ShowChips)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                    }
                    
            }
            else{
                Text("\(number.number)")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .frame(width: 50,height: 50)
                    .background(number.color)
                    .background(.white)
            }
        }.onChange(of: IsClear) { newValue in
            if newValue {
                IsClick = false
            }
        }
    }
}


//
//  ContentView.swift
//  roulette
//
//  Created by 李炘杰 on 2023/3/10.
//

import SwiftUI

struct ContentView: View {
    @State private var table1=[
        chac(number: 3, color: .red),
        chac(number: 6, color: .black),
        chac(number: 9, color: .red),
        chac(number: 12, color: .red),
        chac(number: 15, color: .black),
        chac(number: 18, color: .red),
        chac(number: 21, color: .red),
        chac(number: 24, color: .black),
        chac(number: 27, color: .red),
        chac(number: 30, color: .red),
        chac(number: 33, color: .black),
        chac(number: 36, color: .red),
    ]
    @State private var table2=[
        chac(number: 2, color: .black),
        chac(number: 5, color: .red),
        chac(number: 8, color: .black),
        chac(number: 11, color: .black),
        chac(number: 14, color: .red),
        chac(number: 17, color: .black),
        chac(number: 20, color: .black),
        chac(number: 23, color: .red),
        chac(number: 26, color: .black),
        chac(number: 29, color: .black),
        chac(number: 32, color: .red),
        chac(number: 35, color: .black),
    ]
    @State private var table3=[
        chac(number: 1, color: .red),
        chac(number: 4, color: .black),
        chac(number: 7, color: .red),
        chac(number: 10, color: .black),
        chac(number: 13, color: .black),
        chac(number: 16, color: .red),
        chac(number: 19, color: .red),
        chac(number: 22, color: .black),
        chac(number: 25, color: .red),
        chac(number: 28, color: .black),
        chac(number: 31, color: .black),
        chac(number: 34, color: .red),
    ]
    @State private var result = 0
    @State private var showAlert = false
    @State private var lackofbudget = false
    @State private var amount = 0
    @State private var Selectednumber = [SelectedNumber]()
    @State private var IsClear = false
    @StateObject private var chips = betCount()
    var body: some View {
        VStack {
            HStack {
                Spacer()
                ForEach(table1, id: \.self) { newvalue in
                    Block_button(number: newvalue,Selected: $Selectednumber, amount: $amount,IsClear: $IsClear, lackofbudget: $lackofbudget)
                }
                Spacer()
            }
            HStack {
                Spacer()
                ForEach(table2, id: \.self) { newvalue in
                    Block_button(number: newvalue,Selected: $Selectednumber,amount: $amount,IsClear: $IsClear, lackofbudget: $lackofbudget)
                }
                Spacer()
            }
            HStack {
                Spacer()
                ForEach(table3, id: \.self) { newvalue in
                    Block_button(number: newvalue,Selected: $Selectednumber,amount: $amount,IsClear: $IsClear, lackofbudget: $lackofbudget)
                }
                Spacer()
            }
            HStack {
                Chip_button(dm: 1,amount: $amount)
                Chip_button(dm: 5,amount: $amount)
                Chip_button(dm: 10,amount: $amount)
                Chip_button(dm: 20,amount: $amount)
                Chip_button(dm: 50,amount: $amount)
                Chip_button(dm: 100,amount: $amount)
                Chip_button(dm: 500,amount: $amount)
                Chip_button(dm: 1000,amount: $amount)
                Chip_button(dm: 10000,amount: $amount)
            }
            HStack {
                Text("\(chips.budget)")
                Button {
                    result = Int.random(in: 0...36)
                    showAlert = true
                } label: {
                    Text("Start")
                }
                .padding()
                Button {
                    IsClear = true
                } label: {
                    Text("Clear")
                }
                .padding()
                
                Button {
                    IsClear = true
                    chips.budget = 100000
                } label: {
                    Text("Reset")
                }
                .padding()
            }
            
        }
        .environmentObject(chips)
        .alert(isPresented: $lackofbudget) {
                    Alert(title: Text("Insufficient Budget"), message: Text("Insufficient Budget"), dismissButton: .default(Text("OK")))
                }
        .alert(isPresented: $showAlert) {
                    Alert(title: Text("The Number is "), message: Text("\(result)"), dismissButton: .default(Text("OK")))
                }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}

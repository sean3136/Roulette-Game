//
//  Chip_button.swift
//  roulette
//
//  Created by 李炘杰 on 2023/3/15.
//

import SwiftUI

struct Chip_button: View {
    let dm: Int
    @Binding var amount: Int
    @State private var IsSelected = false
    var body: some View {
        VStack{
            Button {
                amount = dm
                IsSelected = true
            } label: {
                if IsSelected{
                    Circle()
                        .foregroundColor(.yellow)
                        .frame(width: 65,height: 65)
                        .overlay {
                            Image(String(dm))
                                .resizable()
                                .scaledToFit()
                                .clipShape(Circle())
                                .frame(width: 60,height: 60)
                        }
                }
                else{
                    Image(String(dm))
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        .frame(width: 60,height: 60)
                }
            }
        }
    }
}

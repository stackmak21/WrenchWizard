//
//  MechanicListItem.swift
//  WrenchWizard
//
//  Created by Paris Makris on 20/2/24.
//

import SwiftUI

struct MechanicListItem: View {
    
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            HStack{
                Circle()
                    .fill(Color.red)
                    .frame(width: 24, height: 24)
                VStack(alignment: .leading){
                    HStack{
                        Text("paraskevas".capitalized)
                        Text("makris".capitalized)
                    }
                    .font(Typography.medium(size: 16))
                    Text("Electec")
                        .font(Typography.regular(size: 14))
                }
                Spacer()
                VStack(alignment: .center, spacing: 0){
                    HStack(spacing: 0){
                        Image(systemName: "star.fill")
                            .resizable()
                            .frame(width: 12, height: 12)
                            .foregroundColor(.yellow)
                        Spacer().frame(width: 2)
                        Text("4.5")
                            .font(Typography.regular(size: 12))
                    }
                    Text("(345)")
                        .font(Typography.light(size: 10))
                        .offset(x:2)
                }
                
            }
            
            Spacer().frame(height: 16)
            HStack{
                Text("Electrician".capitalized)
                    .font(Typography.light(size: 14))
            }
            .padding(.horizontal)
            .overlay{
                RoundedRectangle(cornerRadius: 18).stroke(lineWidth: 1)
            }
            
            
        }
        .padding()
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

#Preview {
    MechanicListItem()
        .padding()
}

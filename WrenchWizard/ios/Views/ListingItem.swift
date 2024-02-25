//
//  ListingItem.swift
//  WrenchWizard
//
//  Created by Paris Makris on 24/2/24.
//

import SwiftUI

struct ListingItem: View {
//    test
    let mechanic: Mechanic
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0, content: {
                Image("Image")
                    .resizable()
                    .frame(width: .infinity, height: 140)
            VStack(alignment: .leading){
                HStack{
                    Circle()
                        .frame(width: 36, height: 36)
                    VStack(alignment: .leading){
                        Text(mechanic.lastName)
                            .font(Typography.medium(size: 14))
                        Text("Electec")
                            .font(Typography.light(size: 12))
                    }
                    Spacer()
                    Image(systemName: "heart")
                        .resizable()
                        .frame(width: 26, height: 26)
                }
                
                Spacer().frame(height: 12)
                Text("Design ui uxfsdfdsfdsf asd d asd sad sfdfsdfdsfsd jfdsjfdsj jdsfjsdjfsdj fsdfkdskf")
                    .font(Typography.regular(size: 12))
                    .lineLimit(2)
                    .frame(minHeight: 30)
                    .frame(width: .infinity, alignment: .leading)
                    .multilineTextAlignment(.leading)
                    
                
                Spacer().frame(height: 12)
                HStack(alignment: .bottom){
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    Text("4.9")
                        .font(Typography.semiBold(size: 16))
                        .foregroundColor(.yellow)
                    Text("(539)")
                        .font(Typography.semiBold(size: 14))
                        .foregroundColor(.gray)
                    Spacer()
                    Text("From")
                        .font(Typography.light(size: 12))
                    
                    Text("US$50")
                    
                }
                
            }
            .padding(8)
            
        })
        
        
        }
        
        
        
    }


#Preview {
    Button(action: {print("fdfdfd")}, label: {
        ListingItem()
            
    })
    .buttonStyle(ItemsButtonStyle())
        
    
}

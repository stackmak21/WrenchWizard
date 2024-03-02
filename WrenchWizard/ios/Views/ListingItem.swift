//
//  ListingItem.swift
//  WrenchWizard
//
//  Created by Paris Makris on 24/2/24.
//

import SwiftUI

struct ListingItem: View {

    let mechanic: Mechanic
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0, content: {
            Asset.Illustrations.image.swiftUIImage
                    .resizable()
                    .frame(maxWidth: .infinity, maxHeight: 170)
            VStack(alignment: .leading){
                HStack{
                    Circle()
                        .frame(width: 36, height: 36)
                    VStack(alignment: .leading){
                        Text(mechanic.lastName)
                            .font(Typography.medium(size: 14))
                        Text(mechanic.company)
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
                    .multilineTextAlignment(.leading)
                    
                
                Spacer().frame(height: 12)
                HStack(alignment: .bottom){
                    rating
                    Spacer()
                    Text("From")
                        .font(Typography.light(size: 12))
                    
                    Text("US$50")
                    
                }
                
            }
            .padding(8)
            
        })
        
        
        }
    
    @ViewBuilder var rating: some View {
        Image(systemName: "star.fill")
            .foregroundColor(.yellow)
        Text("4.9")
            .font(Typography.semiBold(size: 16))
            .foregroundColor(.yellow)
        Text("(539)")
            .font(Typography.semiBold(size: 14))
            .foregroundColor(.gray)
    }
        
        
        
    }


#Preview {
    Button(action: {print("fdfdfd")}, label: {
        ListingItem(mechanic: Mechanic(id: UUID(), firstName: "paris", lastName: "makris", category: .electrician, rating: 4.5, company: "electec", phone: "6980376044", address: "xanthoudaki 7", city: "chania", postalCode: "73100", subCategoryId: 2))
            
    })
    .buttonStyle(ListingItemButtonStyle())
        
    
}

//
//  ProfessionalListItem.swift
//  WrenchWizard
//
//  Created by Paris Makris on 16/4/24.
//

import SwiftUI

struct ProfessionalListItem: View {
    var body: some View {
        VStack(spacing: 0){
            HStack(alignment: .top, spacing: 16){
                Image(uiImage: Asset.Illustrations.urgentJobsRepair.image)
                    .resizable()
                    .frame(width: 80, height: 80)
                    .background(.blue)
                    .clipShape(Circle())
                VStack(alignment: .leading, spacing: 0){
                    HStack(spacing: 4){
                        Text("Stuart Jacobson")
                            .font(Typography.bold(size: 18))
                            .foregroundColor(.coal)
                        Image(systemName: "checkmark.seal.fill")
                            .renderingMode(.template)
                            .foregroundColor(.blue)
                    }
                    Text("Cleaner")
                        .font(Typography.regular(size: 14))
                        .foregroundColor(.emperor)
                    Text("5 year of exp. overall")
                        .font(Typography.regular(size: 14))
                        .foregroundColor(.emperor)
                    HStack(spacing: 4){
                        Image(systemName: "star.fill")
                            .renderingMode(.template)
                            .foregroundColor(.yellow)
                        Text("5.0")
                            .font(Typography.semiBold(size: 18))
                            .foregroundColor(.emperor)
                        Text("2200 Reviews")
                            .font(Typography.regular(size: 16))
                            .underline(true)
                    }
                }
                Spacer()
                Image(systemName: "heart.circle")
                    .renderingMode(.template)
                    .resizable()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.emperor)
            }
            Divider().background(.mercury).padding(10)
            
            HStack(alignment: .top, spacing: 10){
                Image(systemName: "location.circle.fill")
                    .renderingMode(.template)
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundColor(.gossamer)
                Text("3623 W Whiteland Rd City/Town, Bargersville United stateds.")
                    .font(Typography.medium(size: 14))
                Spacer()
            }
            
            Divider().background(.mercury).padding(10)
            
            HStack(alignment: .top, spacing: 0) {
                VStack(alignment: .leading, spacing: 0){
                    Text("Available Slots")
                        .font(Typography.bold(size: 16))
                        .foregroundColor(.coal)
                    Text("10:00 am to 3:30 pm")
                        .font(Typography.medium(size: 14))
                        .foregroundColor(.emperor)
                }
                Spacer()
                Button {
                    
                } label: {
                    Text("Book Visit")
                }
                .buttonStyle(PrimaryButtonStyle(isEnabled: true))

            }
        }
        .padding(.vertical)
        .padding(.horizontal, 10)
        .clipShape(RoundedRectangle(cornerRadius: 4))
        .overlay{
            RoundedRectangle(cornerRadius: 8).stroke(Color.mercury, lineWidth: 1)
        }
    }
}

#Preview {
    ProfessionalListItem()
}

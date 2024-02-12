//
//  AccountScreen.swift
//  WrenchWizard
//
//  Created by Paris Makris on 11/2/24.
//

import SwiftUI

struct AccountScreen: View {
    
    @StateObject var viewModel: AccountViewModel
    
    init(viewModel: AccountViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        AccountContent()
    }
}

private struct AccountContent: View {

    var body: some View{
        ZStack{
            Text("")
        }
    }
}

#Preview {
    AccountContent()
}

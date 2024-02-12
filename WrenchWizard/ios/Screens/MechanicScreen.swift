//
//  MechanicScreen.swift
//  WrenchWizard
//
//  Created by Paris Makris on 11/2/24.
//  

import SwiftUI

struct MechanicScreen: View {
    @StateObject var viewModel: MechanicViewModel
    
    init(viewModel: MechanicViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    var body: some View {
        MechanicContent()
    }
}

private struct MechanicContent: View {

    var body: some View{
        ZStack{
            Text("")
        }
    }
}

#Preview {
    MechanicContent()
}

//
//  MechanicScreen.swift
//  WrenchWizard
//
//  Created by Paris Makris on 11/2/24.
//  

import SwiftUI

struct MechanicScreen: View {
    @StateObject var viewModel: MechanicViewModel
    
    
    var body: some View {
        MechanicContent(vm: viewModel)
    }
}

private struct MechanicContent: View {
    @ObservedObject var vm: MechanicViewModel
    var body: some View{
        ZStack{
            Text("")
        }
    }
}

//#Preview {
//    MechanicContent()
//}

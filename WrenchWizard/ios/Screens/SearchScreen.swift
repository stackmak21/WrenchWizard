//
//  SearchScreen.swift
//  WrenchWizard
//
//  Created by Paris Makris on 11/2/24.
//

import SwiftUI

struct SearchScreen: View {
    
    @StateObject var viewModel: SearchViewModel
    
    init(viewModel: SearchViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        SearchContent()
    }
}

private struct SearchContent: View {

    var body: some View{
        ZStack{
            Text("")
        }
    }
}

#Preview {
    SearchContent()
}

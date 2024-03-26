//
//  Colors.swift
//  WrenchWizard
//
//  Created by Paris Makris on 8/2/24.
//

import Foundation
import SwiftUI


extension Color{
    
   
    
    
    struct ContentBackground{
            static let contentBackgroundPrimary = Asset.Theme.ContentBackground.contentBackgroundPrimary.color.toSwiftUi()
            static let contentBackgroundSecondary = Asset.Theme.ContentBackground.contentBackgroundSecondary.color.toSwiftUi()
    }

    
    struct Button {
        static let primaryDisabledBackground = Asset.Theme.Button.primaryDisabledBackground.color.toSwiftUi()
        static let primaryDisabledForeground = Asset.Theme.Button.primaryDisabledForeground.color.toSwiftUi()
        static let primaryNormalBackground = Asset.Theme.Button.primaryNormalBackground.color.toSwiftUi()
        static let primaryNormalForeground = Asset.Theme.Button.primaryNormalForeground.color.toSwiftUi()
        static let primaryPressedBackground = Asset.Theme.Button.primaryPressedBackground.color.toSwiftUi()
        static let primaryPressedForeground = Asset.Theme.Button.primaryPressedForeground.color.toSwiftUi()
        
    }
    
    struct NavigationBar {
        static let navigationBarBackground = Asset.Theme.NavigationBar.navigationBarBackground.color.toSwiftUi()
        static let navigationBarForeground = Asset.Theme.NavigationBar.navigationBarForeground.color.toSwiftUi()
    }
    
    struct TextField {
        static let disabledAccent = Asset.Theme.TextField.disabledAccent.color.toSwiftUi()
        static let disabledBackground = Asset.Theme.TextField.disabledBackground.color.toSwiftUi()
        static let disabledForeground = Asset.Theme.TextField.disabledForeground.color.toSwiftUi()
        static let disabledBorder = Asset.Theme.TextField.disabledBorder.color.toSwiftUi()
        static let focusedAccent = Asset.Theme.TextField.focusedAccent.color.toSwiftUi()
        static let focusedBackground = Asset.Theme.TextField.focusedBackground.color.toSwiftUi()
        static let focusedForeground = Asset.Theme.TextField.focusedForeground.color.toSwiftUi()
        static let focusedBorder = Asset.Theme.TextField.focusedBorder.color.toSwiftUi()
        static let normalAccent = Asset.Theme.TextField.normalAccent.color.toSwiftUi()
        static let normalBackground = Asset.Theme.TextField.normalBackground.color.toSwiftUi()
        static let normalForeground = Asset.Theme.TextField.normalForeground.color.toSwiftUi()
        static let normalBorder = Asset.Theme.TextField.normalBorder.color.toSwiftUi()
    }
    
    
        
    
    
}

// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
#elseif os(tvOS) || os(watchOS)
  import UIKit
#endif
#if canImport(SwiftUI)
  import SwiftUI
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "ColorAsset.Color", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetColorTypeAlias = ColorAsset.Color
@available(*, deprecated, renamed: "ImageAsset.Image", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetImageTypeAlias = ImageAsset.Image

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
internal enum Asset {
  internal enum Illustrations {
    internal static let image = ImageAsset(name: "Image")
    internal static let appleLogo = ImageAsset(name: "appleLogo")
    internal static let bathroom = ImageAsset(name: "bathroom")
    internal static let cleaning = ImageAsset(name: "cleaning")
    internal static let constructionTradeJobs = ImageAsset(name: "construction_trade_jobs")
    internal static let events = ImageAsset(name: "events")
    internal static let googleLogo = ImageAsset(name: "googleLogo")
    internal static let householdAppliances = ImageAsset(name: "household_appliances")
    internal static let key = ImageAsset(name: "key")
    internal static let offers = ImageAsset(name: "offers")
    internal static let removalsStorage = ImageAsset(name: "removals_storage")
    internal static let renovation = ImageAsset(name: "renovation")
    internal static let urgentJobsRepair = ImageAsset(name: "urgent_jobs_repair")
    internal static let windowsAndDoors = ImageAsset(name: "windows_and_doors")
  }
  internal enum Theme {
    internal enum Button {
      internal enum Primary {
        internal static let primaryDisabledBackground = ColorAsset(name: "primary_disabled_background")
        internal static let primaryDisabledForeground = ColorAsset(name: "primary_disabled_foreground")
        internal static let primaryNormalBackground = ColorAsset(name: "primary_normal_background")
        internal static let primaryNormalForeground = ColorAsset(name: "primary_normal_foreground")
        internal static let primaryPressedBackground = ColorAsset(name: "primary_pressed_background")
        internal static let primaryPressedForeground = ColorAsset(name: "primary_pressed_foreground")
      }
      internal enum Secondary {
        internal static let secondaryDisabledBackground = ColorAsset(name: "secondary_disabled_background")
        internal static let secondaryDisabledForeground = ColorAsset(name: "secondary_disabled_foreground")
        internal static let secondaryNormalBackground = ColorAsset(name: "secondary_normal_background")
        internal static let secondaryNormalForeground = ColorAsset(name: "secondary_normal_foreground")
        internal static let secondaryPressedBackground = ColorAsset(name: "secondary_pressed_background")
        internal static let secondaryPressedForeground = ColorAsset(name: "secondary_pressed_foreground")
      }
    }
    internal enum ContentBackground {
      internal static let contentBackgroundPrimary = ColorAsset(name: "content_Background_Primary")
      internal static let contentBackgroundSecondary = ColorAsset(name: "content_Background_Secondary")
    }
    internal enum NavigationBar {
      internal static let navigationBarBackground = ColorAsset(name: "navigation_bar_background")
      internal static let navigationBarForeground = ColorAsset(name: "navigation_bar_foreground")
    }
    internal enum Pallete {
      internal static let alto = ColorAsset(name: "Alto")
      internal enum Beige {
        internal static let beige = ColorAsset(name: "Beige")
        internal static let camel = ColorAsset(name: "Camel")
        internal static let ecru = ColorAsset(name: "Ecru")
        internal static let heavyGluten = ColorAsset(name: "HeavyGluten")
        internal static let linen = ColorAsset(name: "Linen")
        internal static let lion = ColorAsset(name: "Lion")
        internal static let skeleton = ColorAsset(name: "Skeleton")
        internal static let whitePearl = ColorAsset(name: "WhitePearl")
      }
      internal static let burntSienna = ColorAsset(name: "BurntSienna")
      internal static let customBlack = ColorAsset(name: "CustomBlack")
      internal static let customWhite = ColorAsset(name: "CustomWhite")
      internal enum Dark {
        internal static let coal = ColorAsset(name: "Coal")
        internal static let delta = ColorAsset(name: "Delta")
        internal static let emperor = ColorAsset(name: "Emperor")
        internal static let mirage = ColorAsset(name: "Mirage")
        internal static let osloGray = ColorAsset(name: "OsloGray")
        internal static let platingrau = ColorAsset(name: "Platingrau")
      }
      internal static let errigalWhite = ColorAsset(name: "ErrigalWhite")
      internal static let fiesta = ColorAsset(name: "Fiesta")
      internal static let gainsboro = ColorAsset(name: "Gainsboro")
      internal static let grauzone = ColorAsset(name: "Grauzone")
      internal static let grayLight = ColorAsset(name: "GrayLight")
      internal enum Green {
        internal static let calmness = ColorAsset(name: "Calmness")
        internal static let gossamer = ColorAsset(name: "Gossamer")
        internal static let greenSheen = ColorAsset(name: "GreenSheen")
        internal static let herbal = ColorAsset(name: "Herbal")
        internal static let vertCanard = ColorAsset(name: "VertCanard")
        internal static let viride = ColorAsset(name: "Viride")
      }
      internal static let isabelline = ColorAsset(name: "Isabelline")
      internal static let lavender = ColorAsset(name: "Lavender")
      internal static let lightPeriwinkle = ColorAsset(name: "LightPeriwinkle")
      internal static let magnolia = ColorAsset(name: "Magnolia")
      internal static let mercury = ColorAsset(name: "Mercury")
      internal static let ming = ColorAsset(name: "Ming")
      internal static let mist = ColorAsset(name: "Mist")
      internal static let neutralgray = ColorAsset(name: "Neutralgray")
      internal static let olympus = ColorAsset(name: "Olympus")
      internal static let pastelGreen = ColorAsset(name: "PastelGreen")
      internal static let persimmon = ColorAsset(name: "Persimmon")
      internal static let splashdown = ColorAsset(name: "Splashdown")
      internal static let tan = ColorAsset(name: "Tan")
      internal static let warpdrive = ColorAsset(name: "Warpdrive")
      internal static let progressBar = ColorAsset(name: "progressBar")
    }
    internal enum TextField {
      internal static let disabledAccent = ColorAsset(name: "disabled_accent")
      internal static let disabledBackground = ColorAsset(name: "disabled_background")
      internal static let disabledBorder = ColorAsset(name: "disabled_border")
      internal static let disabledForeground = ColorAsset(name: "disabled_foreground")
      internal static let error = ColorAsset(name: "error")
      internal static let focusedAccent = ColorAsset(name: "focused_accent")
      internal static let focusedBackground = ColorAsset(name: "focused_background")
      internal static let focusedBorder = ColorAsset(name: "focused_border")
      internal static let focusedForeground = ColorAsset(name: "focused_foreground")
      internal static let helper = ColorAsset(name: "helper")
      internal static let normalAccent = ColorAsset(name: "normal_accent")
      internal static let normalBackground = ColorAsset(name: "normal_background")
      internal static let normalBorder = ColorAsset(name: "normal_border")
      internal static let normalForeground = ColorAsset(name: "normal_foreground")
    }
  }
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

internal final class ColorAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Color = NSColor
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Color = UIColor
  #endif

  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  internal private(set) lazy var color: Color = {
    guard let color = Color(asset: self) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }()

  #if os(iOS) || os(tvOS)
  @available(iOS 11.0, tvOS 11.0, *)
  internal func color(compatibleWith traitCollection: UITraitCollection) -> Color {
    let bundle = BundleToken.bundle
    guard let color = Color(named: name, in: bundle, compatibleWith: traitCollection) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }
  #endif

  #if canImport(SwiftUI)
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
  internal private(set) lazy var swiftUIColor: SwiftUI.Color = {
    SwiftUI.Color(asset: self)
  }()
  #endif

  fileprivate init(name: String) {
    self.name = name
  }
}

internal extension ColorAsset.Color {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  convenience init?(asset: ColorAsset) {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSColor.Name(asset.name), bundle: bundle)
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
internal extension SwiftUI.Color {
  init(asset: ColorAsset) {
    let bundle = BundleToken.bundle
    self.init(asset.name, bundle: bundle)
  }
}
#endif

internal struct ImageAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Image = UIImage
  #endif

  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, macOS 10.7, *)
  internal var image: Image {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    let name = NSImage.Name(self.name)
    let image = (bundle == .main) ? NSImage(named: name) : bundle.image(forResource: name)
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }

  #if os(iOS) || os(tvOS)
  @available(iOS 8.0, tvOS 9.0, *)
  internal func image(compatibleWith traitCollection: UITraitCollection) -> Image {
    let bundle = BundleToken.bundle
    guard let result = Image(named: name, in: bundle, compatibleWith: traitCollection) else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }
  #endif

  #if canImport(SwiftUI)
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
  internal var swiftUIImage: SwiftUI.Image {
    SwiftUI.Image(asset: self)
  }
  #endif
}

internal extension ImageAsset.Image {
  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, *)
  @available(macOS, deprecated,
    message: "This initializer is unsafe on macOS, please use the ImageAsset.image property")
  convenience init?(asset: ImageAsset) {
    #if os(iOS) || os(tvOS)
    let bundle = BundleToken.bundle
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSImage.Name(asset.name))
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
internal extension SwiftUI.Image {
  init(asset: ImageAsset) {
    let bundle = BundleToken.bundle
    self.init(asset.name, bundle: bundle)
  }

  init(asset: ImageAsset, label: Text) {
    let bundle = BundleToken.bundle
    self.init(asset.name, bundle: bundle, label: label)
  }

  init(decorative asset: ImageAsset) {
    let bundle = BundleToken.bundle
    self.init(decorative: asset.name, bundle: bundle)
  }
}
#endif

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type

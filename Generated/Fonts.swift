// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
  import AppKit.NSFont
#elseif os(iOS) || os(tvOS) || os(watchOS)
  import UIKit.UIFont
#endif
#if canImport(SwiftUI)
  import SwiftUI
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "FontConvertible.Font", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias GeneratedFont = FontConvertible.Font

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Fonts

// swiftlint:disable identifier_name line_length type_body_length
internal enum FontFamily {
  internal enum Faktum {
    internal static let bold = FontConvertible(name: "Faktum-Bold", family: "Faktum", path: "faktum_bold.ttf")
    internal static let boldItalic = FontConvertible(name: "Faktum-BoldItalic", family: "Faktum", path: "faktum_bold_italic.ttf")
    internal static let extraBold = FontConvertible(name: "Faktum-ExtraBold", family: "Faktum", path: "faktum_extra_bold.ttf")
    internal static let extraBoldItalic = FontConvertible(name: "Faktum-ExtraBoldItalic", family: "Faktum", path: "faktum_extra_bold_italic.ttf")
    internal static let extraLight = FontConvertible(name: "Faktum-ExtraLight", family: "Faktum", path: "faktum_extra_light.ttf")
    internal static let extraLightItalic = FontConvertible(name: "Faktum-ExtraLightItalic", family: "Faktum", path: "faktum_extra_light_italic.ttf")
    internal static let light = FontConvertible(name: "Faktum-Light", family: "Faktum", path: "faktum_light.ttf")
    internal static let lightItalic = FontConvertible(name: "Faktum-LightItalic", family: "Faktum", path: "faktum_light_italic.ttf")
    internal static let medium = FontConvertible(name: "Faktum-Medium", family: "Faktum", path: "faktum_medium.ttf")
    internal static let mediumItalic = FontConvertible(name: "Faktum-MediumItalic", family: "Faktum", path: "faktum_medium_italic.ttf")
    internal static let regular = FontConvertible(name: "Faktum-Regular", family: "Faktum", path: "faktum_regular.ttf")
    internal static let regularItalic = FontConvertible(name: "Faktum-RegularItalic", family: "Faktum", path: "faktum_regular_italic.ttf")
    internal static let semiBold = FontConvertible(name: "Faktum-SemiBold", family: "Faktum", path: "faktum_semi_bold.ttf")
    internal static let semiBoldItalic = FontConvertible(name: "Faktum-SemiBoldItalic", family: "Faktum", path: "faktum_semi_bold_italic.ttf")
    internal static let thin = FontConvertible(name: "Faktum-Thin", family: "Faktum", path: "faktum_thin.ttf")
    internal static let thinItalic = FontConvertible(name: "Faktum-ThinItalic", family: "Faktum", path: "faktum_thin_italic.ttf")
    internal static let all: [FontConvertible] = [bold, boldItalic, extraBold, extraBoldItalic, extraLight, extraLightItalic, light, lightItalic, medium, mediumItalic, regular, regularItalic, semiBold, semiBoldItalic, thin, thinItalic]
  }
  internal enum Btv {
    internal static let regular = FontConvertible(name: "btv", family: "btv", path: "btv.ttf")
    internal static let all: [FontConvertible] = [regular]
  }
  internal static let allCustomFonts: [FontConvertible] = [Faktum.all, Btv.all].flatMap { $0 }
  internal static func registerAllCustomFonts() {
    allCustomFonts.forEach { $0.register() }
  }
}
// swiftlint:enable identifier_name line_length type_body_length

// MARK: - Implementation Details

internal struct FontConvertible {
  internal let name: String
  internal let family: String
  internal let path: String

  #if os(macOS)
  internal typealias Font = NSFont
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Font = UIFont
  #endif

  internal func font(size: CGFloat) -> Font {
    guard let font = Font(font: self, size: size) else {
      fatalError("Unable to initialize font '\(name)' (\(family))")
    }
    return font
  }

  #if canImport(SwiftUI)
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
  internal func swiftUIFont(size: CGFloat) -> SwiftUI.Font {
    return SwiftUI.Font.custom(self, size: size)
  }

  @available(iOS 14.0, tvOS 14.0, watchOS 7.0, macOS 11.0, *)
  internal func swiftUIFont(fixedSize: CGFloat) -> SwiftUI.Font {
    return SwiftUI.Font.custom(self, fixedSize: fixedSize)
  }

  @available(iOS 14.0, tvOS 14.0, watchOS 7.0, macOS 11.0, *)
  internal func swiftUIFont(size: CGFloat, relativeTo textStyle: SwiftUI.Font.TextStyle) -> SwiftUI.Font {
    return SwiftUI.Font.custom(self, size: size, relativeTo: textStyle)
  }
  #endif

  internal func register() {
    // swiftlint:disable:next conditional_returns_on_newline
    guard let url = url else { return }
    CTFontManagerRegisterFontsForURL(url as CFURL, .process, nil)
  }

  fileprivate func registerIfNeeded() {
    #if os(iOS) || os(tvOS) || os(watchOS)
    if !UIFont.fontNames(forFamilyName: family).contains(name) {
      register()
    }
    #elseif os(macOS)
    if let url = url, CTFontManagerGetScopeForURL(url as CFURL) == .none {
      register()
    }
    #endif
  }

  fileprivate var url: URL? {
    // swiftlint:disable:next implicit_return
    return BundleToken.bundle.url(forResource: path, withExtension: nil)
  }
}

internal extension FontConvertible.Font {
  convenience init?(font: FontConvertible, size: CGFloat) {
    font.registerIfNeeded()
    self.init(name: font.name, size: size)
  }
}

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
internal extension SwiftUI.Font {
  static func custom(_ font: FontConvertible, size: CGFloat) -> SwiftUI.Font {
    font.registerIfNeeded()
    return custom(font.name, size: size)
  }
}

@available(iOS 14.0, tvOS 14.0, watchOS 7.0, macOS 11.0, *)
internal extension SwiftUI.Font {
  static func custom(_ font: FontConvertible, fixedSize: CGFloat) -> SwiftUI.Font {
    font.registerIfNeeded()
    return custom(font.name, fixedSize: fixedSize)
  }

  static func custom(
    _ font: FontConvertible,
    size: CGFloat,
    relativeTo textStyle: SwiftUI.Font.TextStyle
  ) -> SwiftUI.Font {
    font.registerIfNeeded()
    return custom(font.name, size: size, relativeTo: textStyle)
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

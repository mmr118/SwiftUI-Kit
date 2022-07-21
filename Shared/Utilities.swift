//
//  Utilities.swift
//  SwiftUI Kit iOS
//
//  Created by Rondon Monica on 21.07.22.
//

import SwiftUI


public struct OSOptions: OptionSet {

    public static let iOS = OSOptions(rawValue: 1 << 0)
    public static let macOS = OSOptions(rawValue: 1 << 1)
    public static let watchOS = OSOptions(rawValue: 1 << 2)
    public static let tvOS = OSOptions(rawValue: 1 << 3)
    public static let linux = OSOptions(rawValue: 1 << 4)

    public static let all: OSOptions = [.iOS, .macOS, .watchOS, .tvOS, .linux]

    public let rawValue: Int

    public init(rawValue: Int) {
        self.rawValue = rawValue
    }

    public init(kind: OSKind) {
        guard (0...4).contains(kind.rawValue) else { fatalError() }
        self.init(rawValue: 1 << kind.rawValue)
    }

    public func excludes(_ options: OSOptions) -> Bool {
        return contains(options) == false
    }

}


public extension SetAlgebra {

    func excludes(_ element: Element) -> Bool {
        return contains(element) == false
    }

    func contains(_ kind: OSKind) -> Bool where Element == OSOptions {
        return self.contains(kind.option)
    }

    func excludes(_ kind: OSKind) -> Bool where Element == OSOptions {
        return self.excludes(kind.option)
    }

}



public enum OSKind: Int, CaseIterable, Identifiable, Equatable {

    case iOS
    case macOS
    case watchOS
    case tvOS
    case linux
    case unknown

    public var id: Int { rawValue }

    public var caseString: String { String(describing: self.self) }

    public var option: OSOptions { OSOptions(kind: self) }

    public var isIOS: Bool { self == .iOS }

    public var isMacOS: Bool { self == .macOS }

    public var isWatchOS: Bool { self == .watchOS }

    public var isTvOS: Bool { self == .tvOS }

    public var isLinux: Bool { self == .linux }

    public var isUnknown: Bool { self == .unknown }

}


public struct CurrentOSEnvironmentKey: EnvironmentKey {

    public static let defaultValue: OSKind = {
        #if os(iOS)
        return .iOS
        #elseif os(macOS)
        return .macOS
        #elseif os(watchOS)
        return .watchOS
        #elseif os(tvOS)
        return .tvOS
        #elseif os(Linux)
        return .linux
        #else
        return .unknown
        #endif
    }()

}


public extension EnvironmentValues {

    var currentOSKind: OSKind {
        get { self[CurrentOSEnvironmentKey.self] }
        set { self[CurrentOSEnvironmentKey.self] = newValue }
    }

}


public extension View {

    @ViewBuilder func applyTo<Content: View>(os osOptions: OSOptions, transform: (Self) -> Content) -> some View {
        if osOptions.contains(CurrentOSEnvironmentKey.defaultValue) {
            transform(self)
        } else {
            self
        }
    }

}

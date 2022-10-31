# CurrencyField

[![Swift](https://img.shields.io/badge/swift-5.0-orange.svg)](https://developer.apple.com/swift/)
[![SwiftPm](https://img.shields.io/badge/swiftpm-compatible-limegreen.svg?)](https://swift.org/package-manager)
[![SwiftUI](https://img.shields.io/badge/swiftUI-blue.svg)](https://developer.apple.com/xcode/swiftui/)

With **Currency Field** you can create a numerical input field most commonly found in banking apps. The user types in the amount, and the digits fill in from the right. It uses a `UITextField` for custom input, and a `SwiftUI.Text` to display the formatted value which allows for easy styling. This also makes it possible to use the `.focused()` modifier to update its first responder state.

Example:

![Example](https://trinchero.me/samples/swiftui-currency-field-sample-1.gif)

## Installation

### Swift Package Manager

```text
dependencies: [
    .package(url: "https://github.com/jtrinc/swiftui-currency-field.git", from: "1.0.0")
]
```

## Sample Usage

```swift
import SwiftUI
import CurrencyField

struct Content: View {
    @State private var value: Int = 0

    var body: some View {
        Form {
            HStack {
                Spacer()
                
                CurrencyField(value: $value)
                    .font(.largeTitle.monospaced())
            }
        }
    }
}
```

* The value assigned is an `Int` representing the amount in cents.

### Using a Custom Number Formatter

```swift
import SwiftUI
import CurrencyField

struct Content: View {
    @State private var value = 0
    @State private var chosenLocale = Locale(identifier: "en_CA")

    private var formatter: NumberFormatter {
        let fmt = NumberFormatter()
        fmt.numberStyle = .currency
        fmt.minimumFractionDigits = 2
        fmt.maximumFractionDigits = 2
        fmt.locale = chosenLocale
        return fmt
    }

    private let locales = [
        Locale(identifier: "en_CA"),
        Locale(identifier: "fr_FR"),
        Locale(identifier: "ja_JP"),
    ]

    var body: some View {
        Form {
            Picker(selection: $chosenLocale) {
                ForEach(locales, id: \.self) {
                    if let cc = $0.currencyCode, let sym = $0.currencySymbol {
                        Text("\(cc) \(sym)")
                    }
                }
            } label: {
                Text("Currency")
            }

            CurrencyField(value: $value, formatter: formatter)
        }
    }
}
```

* Pass in a custom number formatter to support different currencies.

![Change Currency](https://trinchero.me/samples/swiftui-currency-field-sample-2.gif)

## Credits

This package was originally inspired by this tutorial: [Currency TextField in SwiftUI](https://benoitpasquier.com/currency-textfield-in-swiftui/)

## License

`CurrencyField` is available under the MIT license. See the [LICENSE](/LICENSE) for more info.

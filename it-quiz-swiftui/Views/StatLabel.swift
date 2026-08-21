import SwiftUI

struct StatLabel: View {
    let label: String
    let stat: Int
    var body: some View {
        Text("\(label): \(stat)")
    }
}



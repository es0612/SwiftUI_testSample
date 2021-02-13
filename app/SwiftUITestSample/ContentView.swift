import SwiftUI

struct ContentView: View {
    @State var leftTextFieldValue: String = ""
    @State var rightTextFieldValue: String = ""
    @State var resultValue : String = ""

    var buttonDisable: Bool {
        return leftTextFieldValue.isEmpty || rightTextFieldValue.isEmpty
    }

    var body: some View {
        VStack {
            HStack {
                TextField("", text: $leftTextFieldValue)
                    .accessibility(identifier: accessibilityIds.leftTextField.rawValue)
                    .frame(height: 60)
                    .padding(.horizontal, 8)
                    .border(Color.gray)

                Text("✖︎")
                    .font(Font.system(size: 32))
                    .padding()
                TextField("", text: $rightTextFieldValue)
                    .accessibility(identifier: accessibilityIds.rightTextField.rawValue)
                    .frame(height: 60)
                    .padding(.horizontal, 8)
                    .border(Color.gray)
            }
            Button(action: {
                self.resultButtonOnTap()
            }) {
                Text("=")
                    .font(Font.system(size: 32))
                    .frame(height: 60)
                    .padding(.horizontal, 64)
                    .foregroundColor(Color.black)
            }
            .accessibility(identifier: accessibilityIds.resultButton.rawValue)
            .disabled(buttonDisable)
            .border(Color.gray)

            Text(resultValue)
                .accessibility(identifier: accessibilityIds.resultLabel.rawValue)
                .padding()
        }.padding(.horizontal, 48)
    }

    private func resultButtonOnTap() {
        guard let leftNumber = Float(leftTextFieldValue),
              let rightNumber = Float(rightTextFieldValue)
        else { return }

        setResultLabel(leftNumber: leftNumber, rightNumber: rightNumber)
    }

    private func setResultLabel(leftNumber: Float, rightNumber: Float) {
        resultValue = String(format: "%.1f", leftNumber * rightNumber)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


enum accessibilityIds: String{
    case leftTextField
    case rightTextField
    case resultButton
    case resultLabel
}

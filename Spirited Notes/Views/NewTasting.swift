//
//  NewTasting.swift
//  Spirited Notes
//
//  Created by Jacob Brooks on 3/22/23.
//

import SwiftUI

struct NewTasting: View {
    // MARK: - Properties
    @Environment(\.presentationMode) var presentationMode
    
    // MARK: - View
    var body: some View {
        VStack{
            HStack{
                Button(action: onCancel) {
                    Text("Cancel")
                        .foregroundColor(Color.red)
                }
                .padding()
                Spacer()
                Button(action: onSave) {
                    Text("Save")
                        .foregroundColor(Color.red)
                }
                .disabled(true)
                .padding()
            }
            Spacer()
        }
    }
    
    // MARK: - Functions
    func onCancel() -> Void {
        presentationMode.wrappedValue.dismiss()
    }
    
    func onSave() -> Void {
        presentationMode.wrappedValue.dismiss()
    }
}

struct NewTasting_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Text("foo")
        }
        .sheet(isPresented: .constant(true)) {
            NewTasting()
        }
    }
}

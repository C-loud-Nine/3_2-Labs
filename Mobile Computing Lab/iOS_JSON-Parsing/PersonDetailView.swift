import SwiftUI

struct PersonDetailView: View {
    var person: Person
    
    var body: some View {
        ScrollView {
            VStack() {
                Text("\(person.firstName) \(person.surname)")
                    .font(.title)
                    .bold()
                
                Text("Gender: \(person.gender)")
                Text("Age: \(person.age)")
                
                VStack() {
                    Text("Address:")
                    Text("Street: \(person.address.streetAddress)")
                    Text("City: \(person.address.city)")
                    Text("State: \(person.address.state)")
                    Text("Postal Code: \(person.address.postalCode)")
                }
                
                VStack() {
                    Text("Phone Numbers:")
                    ForEach(person.phoneNumbers, id: \.number) { phone in
                        Text("\(phone.type.capitalized): \(phone.number)")
                    }
                }
            }
            .padding()
        }
        .navigationTitle("\(person.firstName) \(person.surname)")
    }
}

struct PersonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PersonDetailView(person: Person.samplePerson)
    }
}

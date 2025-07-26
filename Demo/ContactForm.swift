
import SwiftUI

struct ContactForm: View {
    @State private var name = ""
    @State private var cargo = "Gerente"
    @State private var empresa = "Laive"
    
    let positions = ["Gerente", "Empleado", "Supervisor", "Director"]
    let companies = ["Laive", "Gloria", "Promart", "Sodimac"]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    // Campo para ingresar el nombre
                    TextField("Nombres Completos", text: $name)
                        .onChange(of: name) { newValue in
                            // Filtrar solo letras mayúsculas y espacios
                            let filtered = newValue.uppercased().filter {
                                ($0.isLetter && $0.isUppercase) || $0 == " "
                            }
                            if filtered != newValue {
                                name = filtered
                            }
                        }
                    
                    // Picker para elegir el cargo
                    Picker("Cargo", selection: $cargo) {
                        ForEach(positions, id: \.self) { option in
                            Text(option)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    
                    // Picker para elegir la empresa
                    Picker("Empresa", selection: $empresa) {
                        ForEach(companies, id: \.self) { option in
                            Text(option)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                }
 
                NavigationLink(
                    destination: ProfileCard(name: name, cargo: cargo, empresa: empresa),
                    label: {
                        Text("Generar Fotocheck")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.black)
                            .foregroundStyle(.white)
                            .cornerRadius(8)
                    }
                )
                .disabled(name.isEmpty) 
            }
            .navigationTitle("Formulario de Contacto")
        }
    }
}


#Preview {
    ContactForm()
}

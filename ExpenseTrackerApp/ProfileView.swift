//
//  ProfileView.swift
//  ExpenseTrackerApp
//
//  Created by Asaf Contreras on 17/05/23.
//

import SwiftUI

struct ProfileView: View {
    var user = UserDefaults.standard
    var body: some View {
        ProfileEditView()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

struct ProfileEditView: View {
    var defaults = UserDefaults.standard
    @State private var name: String = (UserDefaults.standard.string(forKey: "name") ?? "Root")
    @State private var username: String = (UserDefaults.standard.string(forKey: "username") ?? "Root")
    @State private var password: String = ""
    @State private var password2: String = ""
    @State private var selectedImage: UIImage?
    @State private var isShowingImagePicker = false
    @State private var alertShow = false
    @State private var alert = ""
    
    
    var body: some View {
        VStack {
            Text("Edit profile")
                .font(.title)
                .bold()
                .padding(.bottom, 50)
            
            Button(action: {
                self.isShowingImagePicker = true
            }) {
                if let image = selectedImage {
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                        .padding()
                    
                } else {
                    if UserDefaults.standard.bool(forKey: "ImageSaved"){
                        let image = getSavedImage(named: "imageName")
                        Image(uiImage: image!)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                            .padding()
                    }else {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100, height: 100)
                            .foregroundColor(.icon)
                            .padding()
                    }
                }
            }
            
            // Estos VStacks son para los campos de entrada
            VStack(alignment: .leading, spacing: 10) {
                Text("Nombre")
                    .font(.headline)
                    .foregroundColor(.text)
                
                TextField("Ingresa tu nombre...", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .padding(.bottom, 20)
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Usuario")
                    .font(.headline)
                    .foregroundColor(.text)
                
                TextField("Ingresa tu usuario...", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .padding(.bottom, 20)
                        
            VStack(alignment: .leading, spacing: 10) {
                Text("Contraseña")
                    .font(.headline)
                    .foregroundColor(.text)
                
                SecureField("Ingresa tu contraseña...", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .padding(.bottom, 20)
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Repetir contraseña")
                    .font(.headline)
                    .foregroundColor(.text)
                
                SecureField("Ingresa tu contraseña...", text: $password2)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .padding(.bottom, 20)
            
            Button(action: {
                if self.password != "" && self.password == self.password2{
                    defaults.set(self.name, forKey: "name")
                    defaults.set(self.username, forKey: "username")
                    defaults.set(self.password, forKey: "password")
                    let success = saveImage(image: selectedImage!)
                    success ? defaults.set(true, forKey: "ImageSaved") : defaults.set(false, forKey: "ImageSaved")
                    self.alert = "Data updatec succesfully"
                    self.alertShow = true
                }else {
                    self.alert = "Please, check your data"
                    self.alertShow = true
                }
                
            }) {
                Text("Guardar")
                    .padding()
                    .background(Color.icon)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding()
        .padding(.bottom,100)
        .background(Color.background)
        .sheet(isPresented: $isShowingImagePicker) {
            ImagePicker(selectedImage: $selectedImage)
        }
        .alert(isPresented: $alertShow) {
            Alert(title: Text(self.alert))
        }
    }

}

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage?
    @Environment(\.presentationMode) var presentationMode
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = context.coordinator
        return imagePicker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        let parent: ImagePicker
        
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            if let selectedImage = info[.originalImage] as? UIImage {
                parent.selectedImage = selectedImage
            }
            
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}

func saveImage(image: UIImage) -> Bool {
    guard let data = image.jpegData(compressionQuality: 1) ?? image.pngData() else {
        return false
    }
    guard let directory = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) as NSURL else {
        return false
    }
    do {
        try data.write(to: directory.appendingPathComponent("imageName.png")!)
        print("IMG saved")
        return true
    } catch {
        print(error.localizedDescription)
        return false
    }
}
func getSavedImage(named: String) -> UIImage? {
    if let dir = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) {
        print("IMG loading")
        return UIImage(contentsOfFile: URL(fileURLWithPath: dir.absoluteString).appendingPathComponent(named).path)
    }
    return nil
}

import SwiftUI

struct LoginView: View {
    
    let didCompleteLoginProcess: () -> ()
    
    @State private var isLoginMode = true
    @State private var email = ""
    @State private var password = ""
    @State private var userType = "Student"
    private let userTypes = ["Student", "Mentor"]
    @State var shouldShowImagePicker = false
    
    @State private var showAlert = false
    @State var loginStatusMessage = "" {
            didSet {
                showAlert = !loginStatusMessage.isEmpty
            }
        }
    
    @EnvironmentObject private var viewModel: UserViewModel
    @State private var showUserDetailsPage = false
    @State private var showSupportAreaPage = false
    @State private var showContentPage = false
    @State private var selectedTab: Int = 0
    @State var image: UIImage?
    
    @State private var isLoading = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                
                VStack(spacing: 16) {
                    Picker(selection: $isLoginMode, label: Text("Picker here")) {
                        Text("Login")
                            .tag(true)
                        Text("Create Account")
                            .tag(false)
                    }.pickerStyle(SegmentedPickerStyle())
                        .navigationBarBackButtonHidden(true)
                        
                    if !isLoginMode {
                        Button {
                            shouldShowImagePicker.toggle()
                        } label: {
                            
                            VStack {
                                if let image = self.image {
                                    Image(uiImage: image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 128, height: 128)
                                        .cornerRadius(64)
                                } else {
                                    Image(systemName: "camera.fill")
                                        .font(.system(size: 64))
                                        .padding()
                                        .foregroundColor(Color(.blue))
                                        .frame(width: 128, height: 128)
                                        .cornerRadius(64)
                                }
                            }
                            .overlay(RoundedRectangle(cornerRadius: 64)
                                        .stroke(Color.black, lineWidth: 2)
                            )
                            
                        }
                    }
                    
                    Group {
                        TextField("Email", text: $email)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                        SecureField("Password", text: $password)
                    }
                    .padding(12)
                    .background(Color.white)
                    
                    if !isLoginMode {
                        Picker(selection: $userType, label: Text("User Type")) {
                            ForEach(userTypes, id: \.self) {
                                Text($0)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .padding()
                    }
                    
                    Button {
                                            handleAction()
                    } label: {
                        HStack {
                            Spacer()
                            if isLoading {
                                ProgressView()
                                    .progressViewStyle(CircularProgressViewStyle())
                                    .padding(.vertical, 10)
                            } else {
                                Text(isLoginMode ? "Log In" : "Create Account")
                                    .foregroundColor(.white)
                                    .padding(.vertical, 10)
                                    .font(.system(size: 14, weight: .semibold))
                            }
                            Spacer()
                        }
                        .background(isLoading ? Color.lightgray : Color.blue)
                        .cornerRadius(5.0)
                    }
                    .disabled(isLoading)
//                    Text(self.loginStatusMessage)
//                        .foregroundColor(.red)
                    
                }
                // NavigationLink to different pages
                .navigationDestination(isPresented: $showContentPage){
                    ContentView(selectedTab: $selectedTab)
                        .environmentObject(viewModel)
                        .navigationBarBackButtonHidden(true)
                }
                .navigationDestination(isPresented: $showSupportAreaPage){
                    SupportAreaView()
                        .environmentObject(viewModel)
                        .navigationBarBackButtonHidden(true)
                }
                .navigationDestination(isPresented: $showUserDetailsPage){
                    UserDetailsView()
                        .environmentObject(viewModel)
                }
                .padding()
                
            }
            .navigationTitle(isLoginMode ? "Log In" : "Create Account")
            .background(Color(.init(white: 0, alpha: 0.05))
                            .ignoresSafeArea())
            .alert(isPresented: $showAlert) {
                            Alert(title: Text("Info"), message: Text(loginStatusMessage), dismissButton: .default(Text("OK")))
                        }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .fullScreenCover(isPresented: $shouldShowImagePicker, onDismiss: nil) {
            ImagePicker(image: $image)
        }
    }
    
    
    private func loginUser() {
        isLoading = true
        FirebaseManager.shared.auth.signIn(withEmail: email, password: password) { result, err in
            isLoading = false
            if let err = err {
                print("Failed to login user:", err)
                self.loginStatusMessage = "Wrong email or password."
                return
            }
            
            print("Successfully logged in as user: \(result?.user.uid ?? "")")
//            self.loginStatusMessage = "Successfully logged in as user: \(result?.user.uid ?? "")"
            
            // Fetch the current user to check if the name is empty.
            // Booleans to Navigate the user to different pages
            self.viewModel.fetchCurrentUser { result in
                switch result {
                case .success(let user):
                    if user.name == "" {
                        self.showUserDetailsPage = true
                    } else if user.hasSelectedCategories == false && user.userType == "Mentor"{
                        self.showSupportAreaPage = true
                    } else {
                        self.showContentPage = true
                    }
                case .failure(let error):
                    print("Failed to fetch user after login:", error)
                    self.loginStatusMessage = "Failed to fetch user after login: \(error)"
                }
            }
        }
    }
    
    private func handleAction() {
        if isLoginMode {
            loginUser()
        } else {
            createNewAccount()
        }
    }
    
    private func createNewAccount() {
        if self.image == nil {
            self.loginStatusMessage = "Select an Avatar"
            return
        } else if self.email.isEmpty || self.password.isEmpty {
            self.loginStatusMessage = "Missing Email Or Password"
            return
        }
        
        isLoading = true
        
        FirebaseManager.shared.auth.createUser(withEmail: email, password: password) { result, err in
            if let err = err {
                isLoading = false
                print("Failed to create user:", err)
                self.loginStatusMessage = "Email already in use"
                return
            }
            
            print("Successfully created user: \(result?.user.uid ?? "")")
//            self.loginStatusMessage = "Successfully created user."
            self.persistImageToStorage()
        }
    }
    
    private func persistImageToStorage() {
        // Ensure the UID is not nil
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else { return }
        
        // Reference to the Firebase storage path using the UID
        let ref = FirebaseManager.shared.storage.reference(withPath: uid)
        
        // Ensure the image is not nil and convert it to JPEG data
        guard let imageData = self.image?.jpegData(compressionQuality: 0.5) else { return }
        
        // Upload the image data to Firebase Storage
        ref.putData(imageData, metadata: nil) { metadata, err in
            if let err = err {
                self.isLoading = false
                self.loginStatusMessage = "Failed to push image to Storage: \(err.localizedDescription)"
                return
            }
            
            // Retrieve the download URL for the uploaded image
            ref.downloadURL { url, err in
                if let err = err {
                    self.isLoading = false
                    self.loginStatusMessage = "Failed to retrieve downloadURL: \(err.localizedDescription)"
                    return
                }
                
                // Ensure the URL is not nil
                guard let downloadURL = url else {
                    self.isLoading = false
                    self.loginStatusMessage = "Failed to retrieve downloadURL: URL is nil"
                    return
                }
                
                let downloadURLString = downloadURL.absoluteString
//                self.loginStatusMessage = "Successfully stored image with url: \(downloadURLString)"
                print(downloadURLString)
                
                self.storeUserInformation(imageProfileUrl: downloadURL)
            }
        }
    }
    
    private func storeUserInformation(imageProfileUrl: URL) {
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else { return }
        let userData = [
            "email": self.email,
            "uid": uid,
            "userType" : self.userType,
            "name": "",
            "profileImageUrl": imageProfileUrl.absoluteString
        ]
        FirebaseManager.shared.firestore.collection("users")
            .document(uid).setData(userData) { err in
                self.isLoading = false
                if let err = err {
                    print(err)
                    self.loginStatusMessage = "\(err)"
                    return
                }
                
                print("Success")
                self.didCompleteLoginProcess()
            }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(didCompleteLoginProcess: {})
            .environmentObject(UserViewModel())
    }
}

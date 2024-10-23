import SwiftUI


struct ViewControllersPreview: UIViewControllerRepresentable {
   
    let viewControllerGenerator: () -> UIViewController
    
    init(viewControllerGenerator: @escaping () -> UIViewController) {
        self.viewControllerGenerator = viewControllerGenerator
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        viewControllerGenerator ()
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) { }
    
}


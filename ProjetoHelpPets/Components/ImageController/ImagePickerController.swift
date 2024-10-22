import UIKit

class ImagePickerController: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var picker = UIImagePickerController()
    var alert = UIAlertController(title: "Escolha uma opção", message: nil, preferredStyle: .actionSheet)
    
    var viewController: PetRegisterViewController?
    
    var pickerReturn : ((UIImage) -> ())?
    
    func imagePicker(_ viewController: PetRegisterViewController, _ returnPicker: @escaping ((UIImage) -> ())) {
        pickerReturn = returnPicker
        
        let cam = UIAlertAction(title: "Camera", style: .default) {
            UIAlertAction in
            self.openCam()
        }
        
        let gallery = UIAlertAction(title: "Galeria", style: .default) {
            UIAlertAction in
            self.openGallery()
        }
        
        let cancel = UIAlertAction(title: "Cancelar", style: .cancel) {
            UIAlertAction in
        }
        
        picker.delegate = self
        
        alert.addAction(cam)
        alert.addAction(gallery)
        alert.addAction(cancel)
        
        alert.popoverPresentationController?.sourceView = self.viewController!.view
        viewController.present(alert, animated: true)
    }
    
    func openCam() {
        alert.dismiss(animated: true)
        
        if(UIImagePickerController .isSourceTypeAvailable(.camera)) {
            picker.sourceType = .camera
            self.viewController?.present(picker, animated: true)
        } else {
            let warningAlert = UIAlertController(title: "Alerta", message: "Acesso a camera negado", preferredStyle: .actionSheet)
            let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel) {
                UIAlertAction in
            }
            
            warningAlert.addAction(cancelAction)
            self.viewController?.present(warningAlert, animated: true)
        }
    }
    
    func openGallery() {
        alert.dismiss(animated: true)
        
        picker.sourceType = .photoLibrary
        
        self.viewController?.present(picker, animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        
        guard let image = info[.originalImage] as? UIImage else {
            fatalError("Selecione um arquivo válido, \(info) não é um arquivo válido")
        }
        
        pickerReturn?(image)
    }
}

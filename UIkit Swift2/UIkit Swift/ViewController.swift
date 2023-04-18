//
//  ViewController.swift
//  UIkit Swift
//
//  Created by Usuário Convidado on 11/04/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblIdade: UILabel!
    @IBOutlet weak var lblPas: UILabel!
    @IBOutlet weak var lblPad: UILabel!
    @IBOutlet weak var lblSms: UILabel!
    @IBOutlet weak var clasRisco: UISegmentedControl!
    
    @IBOutlet weak var meuStepper: UIStepper!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func switchValueChanged(_ sender: UISwitch) {
        print(sender.isOn)
    }
    
    @IBAction func sliderPadValueChanged(_ sender: UISlider) {
        lblPad.text = String(Int(sender.value))
    }
    
    @IBAction func sliderPasVAlueChanged(_ sender: UISlider) {
        lblPas.text = String(Int(sender.value))
    }
    
    @IBAction func stepperValueChanged(_ sender: Any) {
        lblIdade.text = String(Int(meuStepper.value))
    }
    
    @IBAction func indexChanged(_ sender: Any) {
        switch  clasRisco.selectedSegmentIndex{
        case 0:
            print("Você selecionou o primeiro botão")
        case 1:
            print("Você selecionou o segundo botão")
        case 2:
            print("Você selecionou o terceiro botão")
        case 3:
            print("Você selecionou o quarto botão")
        default:
            break
        }
    }
    
    @IBAction func receberLink(_ sender: Any) {
        let alerta = UIAlertController(
            title: "Formas para receber seu exame",
            message: "Faça sua escolha",
            preferredStyle: UIAlertController.Style.actionSheet)
        
        alerta.addAction(UIAlertAction(
            title: "SMS",
            style: UIAlertAction.Style.default,
            handler: { (action) in
            self.lblSms.text = action.title
        }))
        alerta.addAction(UIAlertAction(
            title: "E-mail",
            style: UIAlertAction.Style.default,
            handler: { (action) in
            self.lblSms.text = action.title
        }))
        alerta.addAction(UIAlertAction(
            title: "Cancelar",
            style: UIAlertAction.Style.default,
            handler: nil))
        
        present(alerta, animated: true)
    }
    
    @IBAction func salvar(_ sender: Any) {
        var msg:String
        var tipo:String
        
        if clasRisco.selectedSegmentIndex >= 0{
            tipo = clasRisco.titleForSegment(at: 0)!
            msg = "Triagem do tipo \(tipo), paciente com \(lblIdade.text!) anos, salvo com sucesso!"
        }else{
            tipo = ""
            msg = "Antes de salvar escolha uma classificação"
        }
        let alerta = UIAlertController(
            title: "Atenção",
            message: msg,
            preferredStyle: UIAlertController.Style.alert)
        alerta.addAction(UIAlertAction(
            title: "OK",
            style: UIAlertAction.Style.cancel,
            handler: nil))
           present(alerta, animated: true)
    }
}


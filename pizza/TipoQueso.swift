//
//  tipoQueso.swift
//  pizza
//
//  Created by Antonio Franco on 12/12/15.
//  Copyright © 2015 José Antonio Franco Cortés. All rights reserved.
//

import UIKit

class TipoQueso: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var tamañoMasa: UILabel!
   
    @IBOutlet weak var tipoMasa: UILabel!
    @IBOutlet weak var picker: UIPickerView!
    
    var tamañoMasaElegido = ""
    var tipoMasaElegido = ""
    
    
    var tipoQueso = ["Mozarela", "Cheddar", "Parmesano", "Sin queso"]
    
    var tipo : String = ""
    
    override func viewWillAppear(animated: Bool) {
        tamañoMasa.text = String(tamañoMasaElegido)
        tipoMasa.text = String(tipoMasaElegido)
         navigationItem.title = "Tipo queso"
         navigationItem.backBarButtonItem?.title = "Regresar"
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.picker.dataSource = self
        self.picker.delegate = self
        
        tipo  = tipoQueso[0]
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let tamañoPizzaElegido_uno = String(tamañoMasaElegido)
        let tipoMasaElegido_uno = tipoMasaElegido
        let tipoQuesoElegido_uno = tipo
        let siguienteVista = segue.destinationViewController as! TipoIngrediente
        siguienteVista.tipoMasaElegido = tipoMasaElegido_uno
        siguienteVista.tamañoMasaElegido = tamañoPizzaElegido_uno
        siguienteVista.tipoQuesoElegido = tipoQuesoElegido_uno
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return tipoQueso.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return tipoQueso[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        tipo = tipoQueso[row]
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

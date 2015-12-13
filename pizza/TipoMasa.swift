//
//  TipoMasa.swift
//  pizza
//
//  Created by Antonio Franco on 11/12/15.
//  Copyright © 2015 José Antonio Franco Cortés. All rights reserved.
//

import UIKit

class TipoMasa: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {

   
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var tamaño: UILabel!
    
    
    var tamañoPizza : String = ""
 
    
    var tipoMasa = ["Delgada", "Crujiente", "Gruesa"]
    
    var tipo : String = ""
    
    
    override func viewWillAppear(animated: Bool) {
        tamaño.text = String(tamañoPizza)
     navigationItem.title = "Tipo masa"
      navigationItem.backBarButtonItem?.title = "Regresar"   
    }
   
  
    override func viewDidLoad() {
        super.viewDidLoad()

        
       self.picker.delegate = self
       self.picker.delegate = self
        
       tipo = tipoMasa[0]
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let tamañoPizzaElegido_uno = String(tamañoPizza)
        let tipoMasaElegido = tipo
        let siguienteVista = segue.destinationViewController as! TipoQueso
        siguienteVista.tipoMasaElegido = tipoMasaElegido
        siguienteVista.tamañoMasaElegido = tamañoPizzaElegido_uno
        
    }
    

    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return tipoMasa.count;
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return tipoMasa[row]
    }
    
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        tipo = tipoMasa[row]
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

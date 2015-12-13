//
//  TipoIngrediente.swift
//  pizza
//
//  Created by Antonio Franco on 12/12/15.
//  Copyright © 2015 José Antonio Franco Cortés. All rights reserved.
//

import UIKit

class TipoIngrediente: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var tamañoActual: UILabel!
    @IBOutlet weak var masaActual: UILabel!
    @IBOutlet weak var quesoActual: UILabel!
    

    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var pruebaarray: UILabel!
    
    var tamañoMasaElegido = ""
    var tipoMasaElegido = ""
    var tipoQuesoElegido = ""
    
    var ingredienteAgregado = [String]()
    
    
    var ingredienteMenu = ["Jamón", "Pepperoni", "Pavo", "Salchicha", "Aceituna", "Cebolla", "Pimiento", "Piña", "Anchoa"]
    
    var ingrediente = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.picker.delegate = self
        self.picker.dataSource = self

        ingrediente = ingredienteMenu[0]
        
        pruebaarray.text = String(ingredienteAgregado.count)
        
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        tamañoActual.text = tamañoMasaElegido
        masaActual.text = tipoMasaElegido
        quesoActual.text = tipoQuesoElegido
         navigationItem.title = "Ingredientes"
         navigationItem.backBarButtonItem?.title = "Regresar"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return ingredienteMenu.count
    }

    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return ingredienteMenu[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        ingrediente = ingredienteMenu[row]
    }
    
    @IBAction func btnAgrega(sender: AnyObject) {
      
     //   print(ingrediente)
      //  print(ingredienteAgregado)
        
        
      //  ingredienteAgregado.append(ingrediente)
    //    print(ingredienteAgregado)
      
        
        // print(ingredienteAgregado.append(ingrediente))
        
        
        if ingredienteAgregado.contains(ingrediente) {
            
            let mensajeAlerta = UIAlertController(title: "Ingrediente", message: "Este ingrediente ya lo has elegido" , preferredStyle: .Alert)
            
            let defaultAccion = UIAlertAction(title: "OK", style: .Default, handler: nil)
            mensajeAlerta.addAction(defaultAccion)
            
            presentViewController(mensajeAlerta, animated: true, completion: nil)
            print("este elemento ya lo has agregado")
        }else{
            ingredienteAgregado.append(ingrediente)
            pruebaarray.text = String(ingredienteAgregado.count)
        }
       


    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        segue.destinationViewController as! FirstViewController
     
        
    }


    @IBAction func btnPedido(sender: AnyObject) {
        
        let mensajeAlerta = UIAlertController(title: "Realizar pedido", message: "¿Deseas confirmar tu pedido?" , preferredStyle: .Alert)
        
        let defaultAccion = UIAlertAction(title: "Confirmar", style: .Default, handler: nil)
        let cancelAction = UIAlertAction(title: "Cancelar", style: .Cancel, handler: nil)
        
        mensajeAlerta.addAction(defaultAccion)
        mensajeAlerta.addAction(cancelAction)
        
        presentViewController(mensajeAlerta, animated: true, completion: nil)
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

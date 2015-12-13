//
//  FirstViewController.swift
//  pizza
//
//  Created by Antonio Franco on 11/12/15.
//  Copyright © 2015 José Antonio Franco Cortés. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBAction func btnSeleccionar(sender: AnyObject) {
       
        /*
        let alertController = UIAlertController(title: "Tamaño de pizza", message: tamaño , preferredStyle: .Alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alertController.addAction(defaultAction)
        
        presentViewController(alertController, animated: true, completion: nil)
*/
    }
    
    @IBOutlet weak var picker: UIPickerView!
    
    var tamañoPizza = ["Chica","Mediano", "Grande"]
    var tamaño : String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       self.picker.dataSource = self
       self.picker.delegate = self
        tamaño = tamañoPizza[0]
        
        
        navigationItem.title = "Tamaño pizza"
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let tamañoPizzaElegido  = tamaño
        let siguienteVista = segue.destinationViewController as! TipoMasa
        siguienteVista.tamañoPizza = tamañoPizzaElegido
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return tamañoPizza.count;
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return tamañoPizza[row]
    }

    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
     /*
        if (row == 0){
           tamaño = tamañoPizza[row]
        }else if (row == 1)
 
     */
        
        tamaño = tamañoPizza[row]
    }



}


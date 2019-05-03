  //
  //  ViewControllerMapa.swift
  //  OurAdventure
  //
  //  Created by student on 27/04/19.
  //  Copyright © 2019 student. All rights reserved.
  //
  
  import UIKit
  import MapKit
  
  class MyPointAnnotation : MKPointAnnotation {
    //Criando imagem pra colocar no botão dentro da annotation
    var imagem: UIImage = UIImage(named: "map-marker-icon")!
  }
  
  
  class ViewControllerMapa: UIViewController,  CLLocationManagerDelegate, UISearchBarDelegate, MKMapViewDelegate{
    
    @IBOutlet weak var mapView: MKMapView!
    
    var locationManager = CLLocationManager()
    var userLocation = CLLocation()
    var events = EventDAO.getEvent()
    //botao dentro do pin
    let btn = UIButton(type: .detailDisclosure)
    
    
    var location = ""
    
    @IBAction func AtualizarButton(_ sender: Any) {
        
        
        for events in events{
            print(events.name)
            location = events.location
            //ignorando usuario enquanto carrega
            UIApplication.shared.beginIgnoringInteractionEvents()
            
            
            //adicionando animacao de carregamento
            let activityIndicator = UIActivityIndicatorView()
            activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
            activityIndicator.center = self.view.center
            activityIndicator.hidesWhenStopped = true
            activityIndicator.startAnimating()
            
            
            //pegando o input e convertendo em query
            let searchRequest = MKLocalSearchRequest()
            searchRequest.naturalLanguageQuery = location
            
            
            let activeSearch = MKLocalSearch(request: searchRequest)
            activeSearch.start{     (response,error) in
                
                //deixando o usuario mexendo novamente
                activityIndicator.stopAnimating()
                UIApplication.shared.endIgnoringInteractionEvents()
                
                if response == nil{
                    print("ERROR")
                }else{
                    //getting data
                    let latitude = response?.boundingRegion.center.latitude
                    let longitude = response?.boundingRegion.center.longitude
                    
                    //create annotation
                    let annotations = MyPointAnnotation()
                    annotations.title = events.name + " " + events.date
                    annotations.subtitle = events.description
                    annotations.coordinate = CLLocationCoordinate2DMake(latitude!, longitude!)
                    self.mapView.addAnnotation(annotations)
                    
                    
                    //Dando zoom no annotation
                    let coordinate:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude!, longitude!)
                    let span = MKCoordinateSpanMake(0.1, 0.1)
                    let region = MKCoordinateRegionMake(coordinate, span)
                    self.mapView.setRegion(region, animated: true)
                    
                }
            }
            
        }
        
    }
    
    
    
    //Essa é a funcão que vai realizar a navegação para a proxima View quando clicarmos no Botão dentro da descrição do nosso PIN
    func mapView(_ MapView: MKMapView, annotationView: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        
        //Verificamos se é o botão desejado
        if control == annotationView.rightCalloutAccessoryView {
            //Aqui fazemos a nossa navegação passando o identificador da nossa segue: "Evento"
            //Obs: essa segue é feita da nossa View para a Proxima.
            let viewController = storyboard?.instantiateViewController(withIdentifier: "Evento")
            self.navigationController?.pushViewController(viewController!, animated: true)
            
            //passando o evento pra tela de descricao de evento
            var nome = ""
            var localizacao = ""
            var data = ""
            var tempo = ""
            var descricao = ""
            for events in events{
                print(events.name)
                if(events.name + " " + events.date == (annotationView.annotation?.title)!){
                    nome = events.name
                    localizacao = events.location
                    data = events.date
                    tempo = events.time
                    descricao = events.description
                }
            }
            
            
            let  envia = storyboard?.instantiateViewController(withIdentifier: "Evento") as! EventScreenViewController
            envia.recebeNome = nome
            envia.recebeTempo = tempo
            envia.recebeLocal = localizacao
            envia.recebeTempo = tempo
            envia.recebeDescricao = descricao
            envia.recebeData = data
            present(envia, animated: true, completion: nil)
            
            
            
            
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLocationManager()
        mapView.showsUserLocation = true
        mapView.setUserTrackingMode(.follow, animated: true)
    }
    
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView?{
        
        if annotation is MKUserLocation {
            return nil
        }
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "myAnnotation") as? MKPinAnnotationView
        
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "myAnnotation")
        } else {
            annotationView?.annotation = annotation
        }
        
        if let annotation = annotation as? MyPointAnnotation {
            
            // Atribuindo a imagem para o nosso Botão
            btn.setImage(annotation.imagem, for: UIControlState())
            annotationView?.canShowCallout = true
            annotationView?.rightCalloutAccessoryView = btn
            
            
        }
        
        return annotationView
    }
    
    
    func setupLocationManager(){
        //pegar a precisao
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        //pedir permissao
        locationManager.requestWhenInUseAuthorization()
        //manter atualizado a localizacao
        locationManager.startUpdatingLocation()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     if segue.identifier == "CreateEventDesc"{
     }
     }
     */
    
  }

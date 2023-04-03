//
//  AthleteFormViewController.swift
//  FavoriteAthlete
//
//  Created by Iyer, Eshan R on 4/3/23.
//

import UIKit

class AthleteFormViewController: UIViewController {
    
    @IBOutlet weak var teamTextField: UITextField!
    @IBOutlet weak var leagueTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    
    var athlete : Athlete?

    @IBAction func saveButton(_ sender: Any) {
        guard let name = nameTextField.text,
              let ageString = ageTextField.text,
              let age = Int(ageString),
              let league = leagueTextField.text,
              let team = teamTextField.text else
                {return}
        
              athlete = Athlete(age: age, name: name, league: league, team: team)
    }
    
    init?(coder: NSCoder, athlete : Athlete?){
        super.init(coder: coder)
        self.athlete = athlete
    }
    
    required init?(coder: NSCoder){
        fatalError("init(coder: ) has not been implemented")
    }
    
    func updateView(){
        if let athlete = athlete{
            nameTextField.text = athlete.name
            ageTextField.text = String(athlete.age)
            leagueTextField.text = athlete.league
            teamTextField.text = athlete.team

        }else
        {
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateView()
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

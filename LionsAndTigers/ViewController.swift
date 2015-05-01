//
//  ViewController.swift
//  LionsAndTigers
//
//  Created by Matt Grimes on 3/26/15.
//  Copyright (c) 2015 Daily Dram. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var breedLabel: UILabel!
    @IBOutlet weak var randomFactLable: UILabel!
    
    var myTigers:[Tiger] = []
    var lions:[Lion] = []
    var lionCubs:[LionCub] = []
    
    var currentIndex = 0
    var currentAnimal = (species: "Tiger", Index: 0)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var myTiger = Tiger()
        myTiger.name = "Tigger"
        myTiger.breed = "Bengal"
        myTiger.age = 3
        myTiger.image = UIImage(named: "BengalTiger.jpg")
        
        myTiger.age = myTiger.ageInTigerYearsFromAge(myTiger.age)
        
        myTiger.chuff()
        myTiger.chuffNumberOfTimes(5, isLoud: true)
        
        
        myTigers.append(myTiger)
        
        println("My tiger's name is: \(myTiger.name), its age is \(myTiger.age), its breed is \(myTiger.breed) and its image is \(myTiger.image)")
        
        myImageView.image = myTiger.image
        nameLabel.text = myTiger.name
        breedLabel.text = myTiger.breed
        ageLabel.text = "\(myTiger.age)"
        randomFactLable.text = myTiger.randomFact()
        
        var secondTiger = Tiger()
        secondTiger.name = "Tigress"
        secondTiger.breed = "Indochinese Tiger"
        secondTiger.age = 2
        secondTiger.image = UIImage(named: "IndochineseTiger.jpg")
        
        secondTiger.age = secondTiger.ageInTigerYearsFromAge(secondTiger.age)
        
        
        secondTiger.chuff()
        
        var thirdTiger = Tiger ()
        thirdTiger.name = "Jacob"
        thirdTiger.breed = "Malayan Tiger"
        thirdTiger.age = 4
        thirdTiger.image = UIImage(named: "MalayanTiger.jpg")
        
        thirdTiger.age = thirdTiger.ageInTigerYearsFromAge(thirdTiger.age)
        
        
        var fourthTiger = Tiger ()
        fourthTiger.name = "Spar"
        fourthTiger.breed = "Siberian Tiger"
        fourthTiger.age = 5
        fourthTiger.image = UIImage(named: "SiberianTiger.jpg")
        
        fourthTiger.age = fourthTiger.ageInTigerYearsFromAge(fourthTiger.age)
        
        
        self.myTigers += [secondTiger, thirdTiger, fourthTiger]
        
        var lion = Lion()
        lion.age = 4
        lion.isAlphaMale = false
        lion.image = UIImage(named: "Lion.jpg")
        lion.name = "Mufasa"
        lion.subSpecies = "Wester African"
        
        var lioness = Lion()
        lioness.age = 3
        lioness.isAlphaMale = false
        lioness.image = UIImage(named: "Lioness.jpeg")
        lioness.name = "Sarabi"
        lioness.subSpecies = "Barbary"
        
        lion.roar()
        lioness.roar()
        lion.changeToAlphaMale()
        println(lion.isAlphaMale)
        
        
        self.lions += [lion, lioness]
        
        var lionCub = LionCub()
        lionCub.age = 1
        lionCub.name = "Simba"
        lionCub.isAlphaMale = true
        lionCub.image = UIImage(named: "LionCub1.jpg")
        lionCub.subSpecies = "Masai"
        
        lionCub.roar()
        lionCub.rubLionCubsBelly()
        
        var femaleLionCub = LionCub()
        femaleLionCub.age = 1
        femaleLionCub.name = "Nala"
        femaleLionCub.image = UIImage(named: "LionCub2.jpeg")
        femaleLionCub.subSpecies = "Transvaal"
        femaleLionCub.isAlphaMale = false
        
        self.lionCubs += [lionCub, femaleLionCub]

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func nextBarButtonItemPressed(sender: UIBarButtonItem) {
        updateAnimal()
        updateView()
        
    }

    func updateAnimal() {
        switch currentAnimal {
        case ("Tiger", _):
            let randomIndex = Int(arc4random_uniform(UInt32(lions.count)))
            currentAnimal = ("Lion", randomIndex)
        
        case ("Lion", _):
            let randomIndex = Int(arc4random_uniform(UInt32(lionCubs.count)))
            currentAnimal = ("LionCub", randomIndex)
            
        default:
            let randomIndex = Int(arc4random_uniform(UInt32(myTigers.count)))
            currentAnimal = ("Tiger", randomIndex)
        }
    }
    
    func updateView() {
        
        UIView.transitionWithView(self.view, duration: 2, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {
            
            if self.currentAnimal.species == "Tiger" {
                let tiger = self.myTigers[self.currentAnimal.Index]
                self.myImageView.image = tiger.image
                self.breedLabel.text = tiger.breed
                self.ageLabel.text = "\(tiger.age)"
                self.nameLabel.text = tiger.name
                self.randomFactLable.text = tiger.randomFact()
            }
            
            else if self.currentAnimal.species == "Lion" {
                let lion = self.lions[self.currentAnimal.Index]
                self.myImageView.image = lion.image
                self.breedLabel.text = lion.subSpecies
                self.ageLabel.text = "\(lion.age)"
                self.nameLabel.text = lion.name
                self.randomFactLable.text = lion.randomFact()
            }
            
            else if self.currentAnimal.species == "LionCub" {
                let lionCub = self.lionCubs[self.currentAnimal.Index]
                self.myImageView.image = lionCub.image
                self.breedLabel.text = lionCub.subSpecies
                self.ageLabel.text = "\(lionCub.age)"
                self.nameLabel.text = lionCub.name
                self.randomFactLable.text = lionCub.randomFact()
            }
            
            self.randomFactLable.hidden = false
            
            }, completion: {
                (finished: Bool) -> () in
        })
    
    }
}


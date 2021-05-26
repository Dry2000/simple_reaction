//
//  GameScene.swift
//  check_reaction
//
//  Created by 洞井僚太 on 2021/05/26.
//

import SpriteKit
import GameplayKit
var timer:Timer?
var passed_time:Float = 0
var interval:Int = 0
var count:Int = 1
var label1 = SKLabelNode()
class GameScene: SKScene {
    override func didMove(to view: SKView) {
   
        label1.position = CGPoint(x:0,y:0)
        label1.text = " PUSH!"
        label1.fontSize = 90
        label1.fontColor = .white
        self.addChild(label1)
        label1.isHidden = true
        // Get label node from scene and store it for use later
        interval  = Int.random(in: Range(1...5))
        _ = Timer.scheduledTimer(withTimeInterval: TimeInterval(interval), repeats: false,block: {_ in
            self.show_label()
        })
        
    }
    
    func show_label(){
        label1.isHidden = false
        passed_time = 0
        timer = Timer.scheduledTimer(withTimeInterval: 0.0001, repeats: true,block: {_ in
            passed_time += 0.0001
        })
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if(label1.isHidden){
            return
        }
        timer?.invalidate()
        print(count," ",interval," ",passed_time)
        count += 1
        label1.isHidden = true
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
      
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        interval  = Int.random(in: Range(1...5))
        _ = Timer.scheduledTimer(withTimeInterval: TimeInterval(interval), repeats: false,block: {_ in
            self.show_label()
        })
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
     
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}

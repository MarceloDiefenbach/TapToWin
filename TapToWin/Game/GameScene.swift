//
//  GameScene.swift
//  TapToWin
//
//  Created by Marcelo Diefenbach on 05/11/22.
//

// Remember to import the SpriteKit framework
import SpriteKit
import SwiftUI

class GameScene: SKScene {
    
    var viewModel: GameViewModel?
    
    let background: SKSpriteNode = SKSpriteNode()
    
    let enemy = SKSpriteNode(imageNamed:"redPad.png")
    let ball = SKSpriteNode(imageNamed:"redPad.png")
    
    var width: Double = 0
    var height: Double = 0
    var trailing: Double = 0
    var leading: Double = 0
    var top: Double = 0
    var bottom: Double = 0
    
    override func didMove(to view: SKView) {
        
        width = UIScreen.main.bounds.width
        height = UIScreen.main.bounds.height
        trailing = width
        leading = 0
        top = height
        bottom = 0
        
        createBG()
        
        createPath()
        
        createEnemy()
        
        createBall()
        
//        DispatchQueue.main.asyncAfter(deadline: .now()+2, execute: {
            self.shotEnemy()
//        })
        
    }
    
    let path = CGMutablePath()
    func createPath() {
        path.move(to: CGPoint(x: width*0, y: height*0.2))
        path.addLine(to: CGPoint(x: width*0.3, y: height*0.2))
        path.addLine(to: CGPoint(x: width*0.3, y: height*0.5))
        path.addLine(to: CGPoint(x: width*0.6, y: height*0.5))
        path.addLine(to: CGPoint(x: width*0.6, y: height*0.2))
        path.addLine(to: CGPoint(x: width, y: height*0.2))
        
        let shapeNode = SKShapeNode(path: path)
        shapeNode.strokeColor = UIColor.black
        shapeNode.lineWidth = 50
        shapeNode.zPosition = 1
        shapeNode.position = CGPoint(x: width*0, y: height*0.2)
        addChild(shapeNode)
    }
    
    func createEnemy() {
        enemy.size =  CGSize(width: 25, height: 25)
        enemy.position = CGPoint(x: width*0, y: height*0.2)
        enemy.zPosition = 10
        addChild(enemy)
        
        let followLine = SKAction.follow(path, speed: 150)
        enemy.run(SKAction.sequence([followLine]))
    }
    
    func createBall() {
        ball.size =  CGSize(width: 20, height: 20)
//        ball.position = enemy.position
        ball.zPosition = 12
        addChild(ball)
    }
    
    let ballPath = CGMutablePath()
    
    func shotEnemy() {
        ballPath.move(to: CGPoint(x: width*0.1, y: height*0.3))
        ballPath.addLine(to: enemy.position)
        
        let shapeNode = SKShapeNode(path: ballPath)
        shapeNode.strokeColor = UIColor.green
        shapeNode.lineWidth = 10
        shapeNode.zPosition = 20
//        shapeNode.position = CGPoint(x: width*0, y: height*0.2)
        addChild(shapeNode)
        
        let followLine = SKAction.follow(ballPath, speed: 50)

        ball.run(SKAction.sequence([followLine]))
        
    }
    
    
    func createBG() {
        background.color = UIColor.white
        background.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height*1.1)
        background.position = CGPoint(x: UIScreen.main.bounds.width*0.5, y: UIScreen.main.bounds.height*0.5)
        background.name = "top"
        addChild(background)
    }
    
    override func update(_ currentTime: TimeInterval) {

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            
            //MARK: - mark points
            
            if background.contains(location) {
                print("tocou no A")
            }
        }
        
    }
}

//
//  RollingBall.swift
//  UIViewControls
//
//  Created by Mettamdaica0909 on 9/28/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class conlac: UIViewController {
    let MAX_ANGLE = M_PI_4 * 0.5
    var center: CGPoint?
    var _timer: NSTimer?
    var _angle: Double = 0.0
    var _angleDelta: Double = 0.0
    var conlac: UIImageView?
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = UIColor.whiteColor()
        self.edgesForExtendedLayout = UIRectEdge.None
        
        let size: CGSize = self.view.bounds.size
        center = CGPointMake(size.width, size.height)
        
        conlac = UIImageView(image: UIImage(named: "pendulum.png"))
        conlac?.center = CGPoint(x: size.width / 2.0, y: size.height / 3.0)
        self.conlac?.layer.anchorPoint = CGPointMake(0.5, 0)
        _angle = 0.0
        _angleDelta = 0.05
        
        self._timer = NSTimer.scheduledTimerWithTimeInterval(0.05, target: self,            selector: "animateBall:", userInfo: nil, repeats: true)
        self._timer?.fire()
        self.view.addSubview(conlac!)

    }
    func animateBall(timer: NSTimer) {
        _angle += _angleDelta
        if ((_angle > MAX_ANGLE) | (_angle < -MAX_ANGLE)) {
            self._angleDelta = -self._angleDelta
        }
        self.conlac?.transform = CGAffineTransformMakeRotation(CGFloat(_angle))

    }
}

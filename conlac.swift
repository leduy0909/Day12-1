
import UIKit

class conlac: UIViewController {
    let MAX_ANGLE = M_PI_4 * 0.5
    var center: CGPoint?
    var _timer: NSTimer?
    var _angle: Double = 0.0
    var _angleDelta: Double = 0.0
    var conlac: UIImageView?
    var slider: UISlider?
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = UIColor.whiteColor()
        self.edgesForExtendedLayout = UIRectEdge.None
        
        let size: CGSize = self.view.bounds.size
        center = CGPointMake(size.width, size.height)
        
        conlac = UIImageView(image: UIImage(named: "pendulum.png"))
        conlac?.center = CGPoint(x: size.width / 2.0, y: size.height / 3.0)
        self.conlac?.layer.anchorPoint = CGPointMake(0.5, 0)
        self.view.addSubview(conlac!)
        
        let startStopAnimation = UISwitch()
        startStopAnimation.center = CGPoint(x: size.width * 0.5, y: 65)
        startStopAnimation.addTarget(self, action: "startStopAnimation:", forControlEvents: UIControlEvents.ValueChanged)
        self.view.addSubview(startStopAnimation)
        
        slider = UISlider(frame: CGRect(x: size.width * 0.2, y: 90, width: 200, height: 40))
        slider!.addTarget(self, action: "changeAngle:", forControlEvents: UIControlEvents.ValueChanged)
        self.view.addSubview(slider!)
        
        _angle = 0.0
        _angleDelta = 0.05

        
    }
    func changeAngle(sliderButton: UISlider) {
        self.conlac?.transform = CGAffineTransformMakeRotation(CGFloat(Float(MAX_ANGLE) * sliderButton.value))
    }
    func startStopAnimation(switchButton: UISwitch) {
        if switchButton.on {
            self.startAnimation()
        } else {
            _timer?.invalidate()
            _timer = nil
        }
    }
    func startAnimation() {
        self._timer = NSTimer.scheduledTimerWithTimeInterval(0.05, target: self,            selector: "animate:", userInfo: nil, repeats: true)
        self._timer?.fire()
    }
    func animate(timer: NSTimer) {
        _angle += _angleDelta
        if ((_angle > MAX_ANGLE) | (_angle < -MAX_ANGLE)) {
            self._angleDelta = -self._angleDelta
        }
        self.conlac?.transform = CGAffineTransformMakeRotation(CGFloat(_angle))

    }
}

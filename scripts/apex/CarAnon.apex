Car bm = new car();
//access public class variable using object(bm)
bm.carColor = 'black';
system.debug('car color=' + bm.carColor);

Car lm = new car();
//access private class variable using object(bm)
lm.carColor = 'red';
system.debug('car color=' + lm.carColor);
lm.switchOn();
// system.debug(lm.maxSpeedKmPerHr)
//lm.maxSpeedKmPerHr = 100; will give error because private class variable is not visible outside the class
system.debug(lm);
Car vm = new Car();
vm.carColor ='White';
vm.carName ='Polo';
vm.switchOn();
vm.drive();
vm.driveAtMaxspeed();
system.debug(vm);
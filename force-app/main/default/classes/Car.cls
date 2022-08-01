public class Car {
   //public class variable, if we don't write access modifier, by default it is private
   public string carColor= '';
   public string carName= '';
   private integer maxSpeedKmPerHr = 150;
   //method name=switchOn
   //return type=void 
   public void switchOn(){
        //method body
        system.debug('starting the car');
   }
   public void drive(){
      system.debug('driving' + carName); 
   }
   public void driveAtMaxspeed(){
      string drivingDescription = 'driving ' +carName + 'at' + maxSpeedKMPerHr +'km/h';
      system.debug(drivingDescription); 
   }
}
 

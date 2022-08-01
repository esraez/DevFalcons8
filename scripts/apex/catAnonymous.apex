//if you define a parameterized constructor first, then non-paramaterized constructor optionnot available anymore, It will not work
//normal world
Cat dummyCat = new Cat();
dummyCat.color ='black';
dummyCat.name = 'purr';
system.debug(dummycat);
//constructor world
cat falconsCat = new cat('fluffykins','white');
system.debug(falconsCat);
# 08.06.2021

Right now I am thinking of implementing a copy of Doodle Jump game. 

<img src = "doodljumpscetch.jpg" width = 200px height = 300px style = "width = 50%; height = 50%;">

I haven't started anything, but I am thinking that it would be not as hard as it looks like. Surely, it will take some time, but I hope to implement it. 

# 09.06.2021

I looked at the gameplay of the Doodle Jump and now I can say the class that I will need.

The Doodler Class: there are only some mechanics, doodler always jumps and user change the direction of the jump to right or left. In addition, it can shoot bullets, so we 
will create another class called Bullet. The bullets are needed to kill enemies/monsters that will appear on some stages. If the doodler touches the enemies, the game ends. 

The Enemy class: just monsters spwaning at some levels of the game. Not sure if I want to add enemies that can move, so I think the enemies that just appear are good.

The Platform class: there will be 2 or 3 types of platforms: the basic ones, that just stand in space, the one that is fake, so if the doodler jumps on it, it will break and user
 will just fall. Maybe I will add the moving platform, but not sure for now. 
 
The Game class will just add everything together. So the doodler, bullets, enemies and platforms will create the game and its mechanics so everything should work fine. 


# 12.06.2021
Found the images <a href="https://www.vg-resource.com/thread-21558.html" >here. </a>
Found the audio <a href="https://www.sounds-resource.com/mobile/doodlejump/sound/1636/" >here. </a>
Created the doodler class, so he can just jump on one space right now in the bottom of the screen. After that made him also jump right and left and shoot. Also used some logic of my previous project that I made in "Intro to CS" class. That game also used shooting aspect when pressed button and also the collision aspect. Therefore I tried that to implement it to this game. Even though it was written in Python, it wasn't that hard to implement into Java. After that started to work on platforms and it worked fine as it could be seen on the video below. Implemented the moving ones after.


https://user-images.githubusercontent.com/71120362/121825186-c11c7c00-ccd2-11eb-8354-cccba7b6e234.mp4



After that implemented the scroll effect, so when the user is coming to the middle of teh screen, it will look like all the objects also move down. All of above took me about 5 hours to do, so yeah, was pretty hard.

# 13.06.2021
Started with making the starting screen and pause key, so it will appear also when the key is pressed. Below is the screenshot of the start/pause info.


![java_Lp5x0EXr6a](https://user-images.githubusercontent.com/71120362/121824859-f3c57500-ccd0-11eb-9aee-1b797ed91764.png)

Implemented the score bar, so it will be seen how much progress is made. 

![java_mUq5kD2gMQ](https://user-images.githubusercontent.com/71120362/121824884-2c654e80-ccd1-11eb-92d3-5b50f9744416.png)

Also added a level system, so if you are in level 0, there wouldn't be monster, if you are in level 1, the monsters will start to appear.
Added the Bullet class, to shoot, when the UP key is pressed. 

![java_37pDxsNmSw](https://user-images.githubusercontent.com/71120362/121825269-3720e300-ccd3-11eb-8b3b-fbfa910e3c52.png)


After that just made the monster class, a function to check how the monster will appear and the collision system with the bullets and doodler and the game was done. In addition, made the gameover screen. It all took me about 8-9 hours, it is now 5 in the morning 14.06.21, when I am submitting it. It is also because I had another project to worry about, which is Communication Lab. In my opinion, what helped me to make this game was the fact that I had some experience with c++ and processing before. Hopefully, I informed and documented every process. Hope you will like playing the game! Below is a video of how I played the game.



https://user-images.githubusercontent.com/71120362/121825089-700c8800-ccd2-11eb-90d4-b31db7d27e55.mp4


https://user-images.githubusercontent.com/71120362/121825091-73a00f00-ccd2-11eb-9f0b-978ac8f47aac.mp4


<p align="right">
Michael Valois (valoi016)
</p>
<p align="right">
CSCI 5611 Project 3
</p>
<h1 align="center">
Inverse Kinematics Scenario
</h1>

Here is my 5611 project 3 page. Below are images from each of my three simulations created for this project. There is a Single-arm IK, Multi-arm IK, and Top Down Skeleton simulation that are explored below.

<h2 align="center">
Single-arm IK
</h2>

<p align="center">
  <img width="500" height="500" src="https://github.com/ValoisMichael/ValoisMichael.github.5611.prj3/assets/85034605/1c7e1846-c8ba-440b-b568-65803fede95f">
</p>

<h2 align="center">
Multi-arm IK
</h2>

<p align="center">
  <img width="500" height="500" src="https://github.com/ValoisMichael/ValoisMichael.github.5611.prj3/assets/85034605/3b4171dc-5d0f-4282-a75b-8559d393a14e">
</p>

<h2 align="center">
Top Down Skeleton
</h2>

<p align="center">
  <img width="600" height="600" src="https://github.com/ValoisMichael/ValoisMichael.github.5611.prj3/assets/85034605/6e654ff0-752c-49d6-bc7a-654284c90465">
</p>

# Video Link
https://youtu.be/tEeQWx-RzGI

(These timestamps are also listed in the description of the video)
| Feature  | Time Stamp |
| ------------- | ------------- |
| Single-arm IK | 0:07 |
| Multi-arm IK | 0:36 |
| Joint limits | 0:56 |
| Moving IK | 1:15 |
| IK Obstacles  | 1:34 |
| User Interaction  | 2:08 |

<br>

# Features

### Single-arm IK (0:07)
The single-arm IK has 7 joints connected to a fixed base forming a full skeleton. The arm can reach out to an object at the mouse's location. If it is unable to reach the mouse, it extrends as far as it can in the mouse's direction.

<br>

### Multi-arm IK (0:36)
The multi-arm IK has 6 joints connected to a fixed base. With two seperate arms, the user useing the "1" key can toggle wich arm is reaching for the mouse object. When the leading arm takes initiative, the other arm is left to join the rest of the skeletal structure. When both arms are out of reach of the mouse, the leading arm extends as far as it can toward the mouse.

<br>

### Joint limits (0:56)
The arms of the Skeleton Simulation have angular Joint limits that affect each arm differently. The left arm and right arm have limits that aim to simulate a the reach of an actual human arm meaning they arm not able to rotate past the sholderblades of the skeleton's back. Without joint limits, the arms act the exact same as the arms in the Single and Multi-arm IK simulations. 

<br>

### Moving IK (1:15)
Using WASD, the user is able to dyanmically move the skeleton throughout the scene. Both arms work smoothly even in the midst of the skeleton's movement. 

<br>

### IK Obstacles (1:34)
The arms of the Skeleton interact with the obsticale of the skeletons head and the mouse object. The arms are not able to reach throught the head of thge skeleton, as collision with it blocks the arms movement. This was added to also inhance the nautral look of the animation, as the arms shouldn't realistically reach through the head. When the object is put behind the head, the arms try and path around the head as close as possible to the object.

<br>

### User Interaction (2:08)
In all three simulations, the user can use their mouse to change the target position of the object the arms reach for. The mouse movement causes the arms to smoothly reacts in real time, adjusting using IK to the new target. In the Skeleton simulation, the user can also use WASD to move the skeleton. Both the WASD and mouse can be used in conjuncture in this simulation, resulting in smooth animation bwteen the arms.

# Code

Github link: https://github.com/ValoisMichael/ValoisMichael.github.5611.prj3

All code was written by me.

# Tools

Resources Used:
* I used the lecture slides, labs, and notes from class.
* For any questions related to functionality within Processing I used: https://processing.org/reference

I used no extra libraries

# Difficulties
For my first iteration of the Single-arm IK, I tried laying out the framework of the segments in a linked list format. This proved to be needlessly complicated as it was extremely hard to access the segements I need to throughout the rendering loops. I desided to switch to an Array in the end, which was a lot easier to use.

The other part I struggled with was adding the moving IK base feature. I wasn;t able to shift the base without the each arm spazzing out, but I figured out a way in the end. I dynamically update the base point every frame rather than setting it in the beginning which allows me to update it easily.

# Robust-3D-Human-Motion-Capture-Technology-based-on-2D-Videos

## Backgound
1.  2D human pose estimation is a research hotspot in the field of computer vision 
2.  Most human pose estimation is limited to the extraction of 2D poses, and the experimental results are not stable  
3.  Some scholars proposed to derive 3D pose based on data matching  
------>Extract more stable 3D motion data directly from 2D video  

## Challenge
1.  How to construct an appropriate data set and compare the existing human pose estimation algorithms experimentally?  
2.  How to build a bridge between 2D human pose estimation model and 2D-3D data matching model?  
3.  How does the filtering algorithm used for data processing avoid losing key frames?  
4.  How to use the position information to derive the rotation angle?  

## DataSet
&emsp;The data set used is divided into two parts. 
1.  The first part is a series of short-length fitness exercises, including inverted push-ups, inverted wall-climbing, high-five push-ups, one-leg squats, forehand and backhand pull-ups, bobby jumps, and bending Mountain running, V-shaped heads, ground running, etc. These data basically include various special human postures, such as various occlusions, the human body is not in the center of the screen, the human body is in extensive contact with the ground, the human body is inverted, etc. .  
2.  The second part is the dance movements with a long duration. Because the dance movements are complex and varied, sometimes the fans and ribbons are used to check the accuracy and stability of the recognition.  

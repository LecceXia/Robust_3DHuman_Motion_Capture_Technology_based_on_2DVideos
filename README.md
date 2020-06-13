# Robust-3D-Human-Motion-Capture-Technology-based-on-2D-Videos

## Code Note：
1.  AlphaPose-pytorch is the first phase of this article. Specific environment configuration reference: https://github.com/MVIG-SJTU/AlphaPose
2.  Run from the command line: ./run.sh --video examples/input.mp4 --outdir examples/results/ --vis --format cmu --sp --save_video Run the program in a single thread and get the result as json formatted motion Data and recognized video

3.  Convert json format data to 14*2 mat format data using data.py in the data processing folder

4.  Put mat format data and original pictures into 3DHumanPose-master imgs, run demo.m to get 3D motion data, and then use processings.m to denoise the data, generate each frame of denoised pictures and store as BVH format

5.  Use MP4.m to generate the video in MP4 format




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

## Human Pose Estimation

1.  CPM  
&emsp;When the human body is not in the middle of the screen, it is completely unrecognizable. The reason is that the CPM algorithm model has a prerequisite: assume that the human body to be recognized is in the middle of the screen.  
  
2.  DeeperCut
3.  OpenPose  
&emsp;Use convolutional neural networks to extract features to get feature maps, and then use CNN to extract partial confidence maps and partial region affinity, and then based on the extracted parts of the feature maps, use the binary matching algorithm model to distinguish different joints of different people and recognize The joint points are connected in the order of each person.  
&emsp;Then, the resulting heat maps of the two lines are respectively calculated according to the positions of the joint points and the positions of the bones, which joints should be connected with the best effect, and a normal map is generated. Finally, determine which line should exist according to the calculated probability, and then use the minimum spanning tree algorithm to derive from this line, and then derive the entire human skeleton.  
4.  Alphapose  
&emsp;Symmetric spatial transformation network STN+SPPE+SDTN The first spatial transformation network can help adjust the human body posture, such as too large recognition frame, missing person recognition and other problems, it can try to transform the posture to a suitable position, so that the next single posture Identification can be more accurate. The inverse space transformation network in the tail will map the human body transformed by the space transformation network back to the original space.  

### Result  
&emsp;Compared with the four existing 2D human pose recognition models, Openpose has a poor effect on human inverted pose detection; the detection requirement of the detector used by CPM is that the human body should be close to the middle of the screen, so the edge position detection effect is poor, and Alphapose shows excellent results when dealing with various situations. Comprehensive effect: Alphapose> DeeperCut> OpenPose> CPM.

## Data Preprocessing and Data matching
&emsp;Given a 3D pose library, a large number of 2D projections (from the virtual camera view) are generated. Each of the 3D poses will have a different 2D projection, which is equivalent to a one-to-many mapping. Then the 2D data extracted by the 2D human pose estimation algorithm is matched with the 2D projection data in the database, that is, the 3D pose of the 2D projection data closest to the original data is the best 3D pose given in this article.

## Motion Data Processing
&emsp;After comparing the centralized filtering algorithms, including limiting filtering, median filtering, arithmetic average filtering, and median average filtering, the median average filtering has the best optimization effect on the experimental data

## Data Storage
1.  Using forward dynamics, Rodriguez's rotation formula derives the relationship between position information and rotation matrix
  
2.  Using trigonometric functions, matrix-related knowledge finds the Euler angle by rotating the matrix, that is, the BVH format data part is solved

## Future Expectation
1.  Since this article relies heavily on the results of the first-stage human recognition model, many improvements can be made to the human pose recognition model, such as modifying the underlying function or adding the number of layers of the neural network, thereby improving the accuracy of the extracted 3D human motion data degree.  
  
2.  In terms of data processing, motion manifolds can be used to optimize the data, so as to avoid the situation that the data can not participate in the filtering at the beginning and end of the data caused by filtering and denoising.
  
3.  BVH format can be further converted into fbx format using software, and then unity3D can be imported to form animation, and finally achieve the purpose of driving the movement of animated characters


% demo code for 3D human pose estimation from a monocular RGB image
% this demo code uses CPM (Convolutional Pose Machines) for 2D pose
% estimation, however, any 2D pose estimator from image can be applied.
% prediction: The 2D pose, a 14X2 matrix, 14 corresponding position as
% listed in the following order, 3 columns with [x y] coordinates.
% (head)
% (neck)
% (right shoulder)
% (right elbow)
% (right wrist)
% (left shoulder)
% (left elbow)
% (left wrist)
% (right hip)
% (right knee)
% (right ankle)
% (left hip)
% (left knee)
% (left ankle)

%% setup
% param = model_config();
load('3D_library.mat');

global number;
global fid;
global Fdata;
Fdata=zeros(15,3,1000000);
number=0;        %the number of the frame.
fid=fopen('result/Fdata.txt','w');
%% input image path
for i=0:66
    fileName_image=strcat('imgs/data9/image',num2str(i),'.jpg');
    fileName_data=strcat('imgs/data9/data',num2str(i),'.mat');
    if exist(fileName_image,'file')==0
        break;
    end
test_image = fileName_image;
im = imread(test_image);

% load the precomputed 2D pose derived by Convolutional Pose Machines,
% other 2D pose estimation methods is applicable, format the 2D pose in the
% definition described above
load(fileName_data);

Prediction{1}=prediction;

% manually adjust two hips' position due to the variation across MPII and
% H36M
prediction(9,2) = prediction(9,2) - 20;
prediction(12,2) = prediction(12,2) - 20;

%% extract the nearest neighbor 
[j_p] = NN_pose(s1_s9_2d_n,s1_s9_3d,prediction);
% [j_p] = kNN_pose_procrus(s1_s9_2d_n,s1_s9_3d,prediction, 10);

% compute the scale between pixel and real world to recover real size of
% prediction
scale = (max(j_p(:,2))-min(j_p(:,2)))/(max(prediction(:,2))-min(prediction(:,2)));

% predict the depth of each joint by the exemplar
prediction(:,3) = j_p(:,3)/scale;

%% visualization
% H=figure(); 

% 自定义平面
% prediction(:,3) = prediction(:,3) - min(prediction(:,3)) + 1300;
% an_x_m = min(prediction(:,1));
% an_x_M = max(prediction(:,1));
% an_y_M = max(prediction(11,2),prediction(14,2));
% x = [an_x_m-100 an_x_M+100 an_x_m-100 an_x_M+100];
% y = [an_y_M-10 an_y_M-10 an_y_M+40 an_y_M+40];
% z = [min(prediction(:,3)-120) min(prediction(:,3)-120) max(prediction(:,3)+120) max(prediction(:,3)+120)];
% A = [x(:) y(:) z(:)];
% 
% [n,v,m,aved]=plane_fit(A);

% 绘制3D骨架
vis_3d(prediction);

number=number+1;
% draw the ground plane
% planeplot(A,n,m)

% 调整视角
% view(0,-90);
% axis([100 450 0 400])

% 保存图片
% Result_image=strcat('result/image',num2str(i),'.jpg');
% print(H,'-djpeg',Result_image);

end

%滑动窗口 大小为N
N=9;
%  Fdata(1,1,1) Fdata(1,1,2) ......Fdata(1,1,number)  JOINT1_X
%  Fdata(1,2,1) Fdata(1,2,2) ......Fdata(1,2,number)  JOINT1_Y
%   ........
%  Fdata(15,3,1) Fdata(15,3,2) ....Fdata(15,3,number) JOINT15_Z
% display(Fdata(1,1,1));
P= figure();
example1=[Fdata(1,1,1) Fdata(1,1,2) Fdata(1,1,3) Fdata(1,1,4) Fdata(1,1,5) Fdata(1,1,6) Fdata(1,1,7) Fdata(1,1,8) Fdata(1,1,9) Fdata(1,1,10) Fdata(1,1,11) Fdata(1,1,12) Fdata(1,1,13) Fdata(1,1,14) Fdata(1,1,15) Fdata(1,1,16) Fdata(1,1,17) Fdata(1,1,18) Fdata(1,1,19) Fdata(1,1,20) Fdata(1,1,21) Fdata(1,1,22) Fdata(1,1,23) Fdata(1,1,24) Fdata(1,1,25) Fdata(1,1,26) Fdata(1,1,27) Fdata(1,1,28) Fdata(1,1,29) Fdata(1,1,30) Fdata(1,1,31) Fdata(1,1,32) Fdata(1,1,33) Fdata(1,1,34) Fdata(1,1,35) Fdata(1,1,36) Fdata(1,1,37) Fdata(1,1,38) Fdata(1,1,39) Fdata(1,1,40) Fdata(1,1,41) Fdata(1,1,42) Fdata(1,1,43) Fdata(1,1,44) Fdata(1,1,45) Fdata(1,1,46) Fdata(1,1,47) Fdata(1,1,48) Fdata(1,1,49) Fdata(1,1,50) Fdata(1,1,51) Fdata(1,1,52) Fdata(1,1,53) Fdata(1,1,54) Fdata(1,1,55) Fdata(1,1,56) Fdata(1,1,57) Fdata(1,1,58) Fdata(1,1,59) Fdata(1,1,60) Fdata(1,1,61) Fdata(1,1,62) Fdata(1,1,63) Fdata(1,1,64) Fdata(1,1,65) Fdata(1,1,66) Fdata(1,1,67)];
subplot(2,1,1);
plot(example1,'-');

% % 中位值平均滤波算法
% for m1=1:15
%     for m2=1:3
%         for m3=1:number-N+1
%             Max=Fdata(m1,m2,m3);
%             for t1=m3:m3+N-1
%                 if Fdata(m1,m2,t1)>Max
%                     Max=Fdata(m1,m2,t1);
%                 end
%             end
%             
%             Min=Fdata(m1,m2,m3);
%             for t2=m3:m3+N-1
%                 if Fdata(m1,m2,t2)<Min
%                     Min=Fdata(m1,m2,t2);
%                 end
%             end
%             
%             total=0;
%             for t3=m3:m3+N-1
%                 total=total+Fdata(m1,m2,t3);
%             end
%             
%             average=(total-Max-Min)/(N-2);
%             
%             if mod(N,2)==0
%                 Fdata(m1,m2,(N/2)+m3)=average;
%             else
%                 Fdata(m1,m2,((N-1)/2)+m3)=average;
%             end
%         end    
%     end
% end

%中值滤波算法
% for m1=1:1
%     for m2=1:1
%         for m3=1:number-N+1         
%             count=1;
%             for t3=m3:m3+N-1
%                 G(count)=Fdata(m1,m2,t3);
%                 count=count+1;
%             end          
%             med=median(G);
%             
%             Fdata(m1,m2,((N-1)/2)+m3)=med;
%         end    
%     end
% end

% 算术平均滤波算法
for m1=1:15
    for m2=1:3
        for m3=1:number-N+1      
            total=0;
            for t3=m3:m3+N-1
                total=total+Fdata(m1,m2,t3);
            end
            average=total/N;
            
            if mod(N,2)==0
                Fdata(m1,m2,(N/2)+m3)=average;
            else
                Fdata(m1,m2,((N-1)/2)+m3)=average;
            end
        end    
    end
end


example2=[Fdata(1,1,1) Fdata(1,1,2) Fdata(1,1,3) Fdata(1,1,4) Fdata(1,1,5) Fdata(1,1,6) Fdata(1,1,7) Fdata(1,1,8) Fdata(1,1,9) Fdata(1,1,10) Fdata(1,1,11) Fdata(1,1,12) Fdata(1,1,13) Fdata(1,1,14) Fdata(1,1,15) Fdata(1,1,16) Fdata(1,1,17) Fdata(1,1,18) Fdata(1,1,19) Fdata(1,1,20) Fdata(1,1,21) Fdata(1,1,22) Fdata(1,1,23) Fdata(1,1,24) Fdata(1,1,25) Fdata(1,1,26) Fdata(1,1,27) Fdata(1,1,28) Fdata(1,1,29) Fdata(1,1,30) Fdata(1,1,31) Fdata(1,1,32) Fdata(1,1,33) Fdata(1,1,34) Fdata(1,1,35) Fdata(1,1,36) Fdata(1,1,37) Fdata(1,1,38) Fdata(1,1,39) Fdata(1,1,40) Fdata(1,1,41) Fdata(1,1,42) Fdata(1,1,43) Fdata(1,1,44) Fdata(1,1,45) Fdata(1,1,46) Fdata(1,1,47) Fdata(1,1,48) Fdata(1,1,49) Fdata(1,1,50) Fdata(1,1,51) Fdata(1,1,52) Fdata(1,1,53) Fdata(1,1,54) Fdata(1,1,55) Fdata(1,1,56) Fdata(1,1,57) Fdata(1,1,58) Fdata(1,1,59) Fdata(1,1,60) Fdata(1,1,61) Fdata(1,1,62) Fdata(1,1,63) Fdata(1,1,64) Fdata(1,1,65) Fdata(1,1,66) Fdata(1,1,67)];
subplot(2,1,2);
plot(example2,'r-')

% for m=1:number
%     H=figure(); 
%     
%     line([Fdata(1,1,m),Fdata(2,1,m)],[Fdata(1,2,m),Fdata(2,2,m)],[Fdata(1,3,m),Fdata(2,3,m)],'Color','b','LineWidth',3);
%     line([Fdata(2,1,m),Fdata(3,1,m)],[Fdata(2,2,m),Fdata(3,2,m)],[Fdata(2,3,m),Fdata(3,3,m)],'Color','b','LineWidth',3);
%     line([Fdata(3,1,m),Fdata(4,1,m)],[Fdata(3,2,m),Fdata(4,2,m)],[Fdata(3,3,m),Fdata(4,3,m)],'Color','g','LineWidth',3);
%     line([Fdata(4,1,m),Fdata(5,1,m)],[Fdata(4,2,m),Fdata(5,2,m)],[Fdata(4,3,m),Fdata(5,3,m)],'Color','g','LineWidth',3);
%     line([Fdata(2,1,m),Fdata(6,1,m)],[Fdata(2,2,m),Fdata(6,2,m)],[Fdata(2,3,m),Fdata(6,3,m)],'Color','b','LineWidth',3);
%     line([Fdata(6,1,m),Fdata(7,1,m)],[Fdata(6,2,m),Fdata(7,2,m)],[Fdata(6,3,m),Fdata(7,3,m)],'Color','r','LineWidth',3);
%     line([Fdata(7,1,m),Fdata(8,1,m)],[Fdata(7,2,m),Fdata(8,2,m)],[Fdata(7,3,m),Fdata(8,3,m)],'Color','r','LineWidth',3);
%     line([Fdata(9,1,m),Fdata(10,1,m)],[Fdata(9,2,m),Fdata(10,2,m)],[Fdata(9,3,m),Fdata(10,3,m)],'Color','g','LineWidth',3);
%     line([Fdata(10,1,m),Fdata(11,1,m)],[Fdata(10,2,m),Fdata(11,2,m)],[Fdata(10,3,m),Fdata(11,3,m)],'Color','g','LineWidth',3);
%     line([Fdata(12,1,m),Fdata(13,1,m)],[Fdata(12,2,m),Fdata(13,2,m)],[Fdata(12,3,m),Fdata(13,3,m)],'Color','r','LineWidth',3);
%     line([Fdata(13,1,m),Fdata(14,1,m)],[Fdata(13,2,m),Fdata(14,2,m)],[Fdata(13,3,m),Fdata(14,3,m)],'Color','r','LineWidth',3);
%     line([Fdata(15,1,m),Fdata(2,1,m)],[Fdata(15,2,m),Fdata(2,2,m)],[Fdata(15,3,m),Fdata(2,3,m)],'Color','b','LineWidth',3);
%     line([Fdata(9,1,m),Fdata(12,1,m)],[Fdata(9,2,m),Fdata(12,2,m)],[Fdata(9,3,m),Fdata(12,3,m)],'Color','b','LineWidth',3);
%     
%     view(0,-90);
%     axis([100 450 0 400])
%     
%     Result_image=strcat('result/image',num2str(m-1),'.jpg');
%     print(H,'-djpeg',Result_image);
% end
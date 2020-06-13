load('A_Fdata.mat');

fid=fopen('result/Fdata.txt','w');

    offset_Hipsx=0.00;offset_Hipsy=0.00;offset_Hipsz=0.00;

    offset_neckx=Fdata(2,1,1)-Fdata(15,1,1);
    offset_necky=Fdata(2,2,1)-Fdata(15,2,1);
    offset_neckz=Fdata(2,3,1)-Fdata(15,3,1);
    
    offset_headx=Fdata(1,1,1)-Fdata(2,1,1);
    offset_heady=Fdata(1,2,1)-Fdata(2,2,1);
    offset_headz=Fdata(1,3,1)-Fdata(2,3,1);
    
    offset_leftshoulderx=Fdata(3,1,1)-Fdata(2,1,1);
    offset_leftshouldery=Fdata(3,2,1)-Fdata(2,2,1);
    offset_leftshoulderz=Fdata(3,3,1)-Fdata(2,3,1);
    
    offset_leftelbowx=Fdata(4,1,1)-Fdata(3,1,1);
    offset_leftelbowy=Fdata(4,2,1)-Fdata(3,2,1);
    offset_leftelbowz=Fdata(4,3,1)-Fdata(3,3,1);
    
    offset_leftwristx=Fdata(5,1,1)-Fdata(4,1,1);
    offset_leftwristy=Fdata(5,2,1)-Fdata(4,2,1);
    offset_leftwristz=Fdata(5,3,1)-Fdata(4,3,1);
    
    offset_rightshoulderx=Fdata(6,1,1)-Fdata(2,1,1);
    offset_rightshouldery=Fdata(6,2,1)-Fdata(2,2,1);
    offset_rightshoulderz=Fdata(6,3,1)-Fdata(2,3,1);
    
    offset_rightelbowx=Fdata(7,1,1)-Fdata(6,1,1);
    offset_rightelbowy=Fdata(7,2,1)-Fdata(6,2,1);
    offset_rightelbowz=Fdata(7,3,1)-Fdata(6,3,1);
    
    offset_rightwristx=Fdata(8,1,1)-Fdata(7,1,1);
    offset_rightwristy=Fdata(8,2,1)-Fdata(7,2,1);
    offset_rightwristz=Fdata(8,3,1)-Fdata(7,3,1);

    offset_righthipx=Fdata(9,1,1)-Fdata(15,1,1);
    offset_righthipy=Fdata(9,2,1)-Fdata(15,2,1);
    offset_righthipz=Fdata(9,3,1)-Fdata(15,3,1);

    offset_rightkneex=Fdata(10,1,1)-Fdata(9,1,1);
    offset_rightkneey=Fdata(10,2,1)-Fdata(9,2,1);
    offset_rightkneez=Fdata(10,3,1)-Fdata(9,3,1);
    
    offset_rightanklex=Fdata(11,1,1)-Fdata(10,1,1);
    offset_rightankley=Fdata(11,2,1)-Fdata(10,2,1);
    offset_rightanklez=Fdata(11,3,1)-Fdata(10,3,1);
    
    offset_lefthipx=Fdata(12,1,1)-Fdata(15,1,1);
    offset_lefthipy=Fdata(12,2,1)-Fdata(15,2,1);
    offset_lefthipz=Fdata(12,3,1)-Fdata(15,3,1);
    
    offset_leftkneex=Fdata(13,1,1)-Fdata(12,1,1);
    offset_leftkneey=Fdata(13,2,1)-Fdata(12,2,1);
    offset_leftkneez=Fdata(13,3,1)-Fdata(12,3,1);
    
    offset_leftanklex=Fdata(14,1,1)-Fdata(13,1,1);
    offset_leftankley=Fdata(14,2,1)-Fdata(13,2,1);
    offset_leftanklez=Fdata(14,3,1)-Fdata(13,3,1);
    
    fprintf(fid,'HIERARCHY\n');
    fprintf(fid,'ROOT Hips\n'); 
    fprintf(fid,'{\n');
    fprintf(fid,'\tOFFSET\t%f\t%f\t%f\n',offset_Hipsx,offset_Hipsy,offset_Hipsz); 
    fprintf(fid,'\tCHANNELS 6 Xposition Yposition Zpostion Zrotation Xrotation Yrotation\n');
    fprintf(fid,'\tJOINT Neck\n');
    fprintf(fid,'\t{\n');
    fprintf(fid,'\t\tOFFSET\t%f\t%f\t%f\n',offset_neckx,offset_necky,offset_neckz);
    fprintf(fid,'\t\tCHANNELS 3 Zrotation Xrotation Yrotation\n');
    fprintf(fid,'\t\tJOINT Head\n');
    fprintf(fid,'\t\t{\n');
    fprintf(fid,'\t\t\tOFFSET\t%f\t%f\t%f\n',offset_headx,offset_heady,offset_headz);
    fprintf(fid,'\t\t\tCHANNELS 3 Zrotation Xrotation Yrotation\n');
    fprintf(fid,'\t\t\tEnd Site\n');
    fprintf(fid,'\t\t\t{\n');
    fprintf(fid,'\t\t\t\tOFFSET\t0.01\t0.01\t0.01\n');
    fprintf(fid,'\t\t\t}\n');
    fprintf(fid,'\t\t}\n');
    
    
    fprintf(fid,'\t\tJOINT LeftShoulder\n');
    fprintf(fid,'\t\t{\n');
    fprintf(fid,'\t\t\tOFFSET\t%f\t%f\t%f\n',offset_leftshoulderx,offset_leftshouldery,offset_leftshoulderz);
    fprintf(fid,'\t\t\tCHANNELS 3 Zrotation Xrotation Yrotation\n');
    fprintf(fid,'\t\t\tJOINT LeftElbow\n');
    fprintf(fid,'\t\t\t{\n');
    fprintf(fid,'\t\t\t\tOFFSET\t%f\t%f\t%f\n',offset_leftelbowx,offset_leftelbowy,offset_leftelbowz);
    fprintf(fid,'\t\t\t\tCHANNELS 3 Zrotation Xrotation Yrotation\n');
    fprintf(fid,'\t\t\t\tJOINT LeftWrist\n');
    fprintf(fid,'\t\t\t\t{\n');
    fprintf(fid,'\t\t\t\t\tOFFSET\t%f\t%f\t%f\n',offset_leftwristx,offset_leftwristy,offset_leftwristz);
    fprintf(fid,'\t\t\t\t\tCHANNELS 3 Zrotation Xrotation Yrotation\n');
    fprintf(fid,'\t\t\t\t\tEnd Site\n');
    fprintf(fid,'\t\t\t\t\t{\n');
    fprintf(fid,'\t\t\t\t\t\tOFFSET\t0.01\t0.01\t0.01\n');
    fprintf(fid,'\t\t\t\t\t}\n');
    fprintf(fid,'\t\t\t\t}\n');
    fprintf(fid,'\t\t\t}\n');
    fprintf(fid,'\t\t}\n');
    
    fprintf(fid,'\t\tJOINT RightShouler\n');
    fprintf(fid,'\t\t{\n');
    fprintf(fid,'\t\t\tOFFSET\t%f\t%f\t%f\n',offset_rightshoulderx,offset_rightshouldery,offset_rightshoulderz);
    fprintf(fid,'\t\t\tCHANNELS 3 Zrotation Xrotation Yrotation\n');
    fprintf(fid,'\t\t\tJOINT RightElbow\n');
    fprintf(fid,'\t\t\t{\n');
    fprintf(fid,'\t\t\t\tOFFSET\t%f\t%f\t%f\n',offset_rightelbowx,offset_rightelbowy,offset_rightelbowz);
    fprintf(fid,'\t\t\t\tCHANNELS 3 Zrotation Xrotation Yrotation\n');
    fprintf(fid,'\t\t\t\tJOINT RightWrist\n');
    fprintf(fid,'\t\t\t\t{\n');
    fprintf(fid,'\t\t\t\t\tOFFSET\t%f\t%f\t%f\n',offset_rightwristx,offset_rightwristy,offset_rightwristz);
    fprintf(fid,'\t\t\t\t\tCHANNELS 3 Zrotation Xrotation Yrotation\n');
    fprintf(fid,'\t\t\t\t\tEnd Site\n');
    fprintf(fid,'\t\t\t\t\t{\n');
    fprintf(fid,'\t\t\t\t\t\tOFFSET\t0.01\t0.01\t0.01\n');
    fprintf(fid,'\t\t\t\t\t}\n');
    fprintf(fid,'\t\t\t\t}\n');
    fprintf(fid,'\t\t\t}\n');
    fprintf(fid,'\t\t}\n');
    fprintf(fid,'\t}\n');
    
    fprintf(fid,'\tJOINT LeftLeg\n');
    fprintf(fid,'\t{\n');
    fprintf(fid,'\t\tOFFSET\t%f\t%f\t%f\n',offset_lefthipx,offset_lefthipy,offset_lefthipz);
    fprintf(fid,'\t\tCHANNELS 3 Zrotation Xrotation Yrotation\n');
    fprintf(fid,'\t\tJOINT LeftKnee\n');
    fprintf(fid,'\t\t{\n');
    fprintf(fid,'\t\t\tOFFSET\t%f\t%f\t%f\n',offset_leftkneex,offset_leftkneey,offset_leftkneez);
    fprintf(fid,'\t\t\tCHANNELS 3 Zrotation Xrotation Yrotation\n');
    fprintf(fid,'\t\t\tJOINT LeftAnkle\n');
    fprintf(fid,'\t\t\t{\n');
    fprintf(fid,'\t\t\t\tOFFSET\t%f\t%f\t%f\n',offset_leftanklex,offset_leftankley,offset_leftanklez);
    fprintf(fid,'\t\t\t\tCHANNELS 3 Zrotation Xrotation Yrotation\n');
    fprintf(fid,'\t\t\t\tEnd Site\n');
    fprintf(fid,'\t\t\t\t{\n');
    fprintf(fid,'\t\t\t\t\tOFFSET\t0.01\t0.01\t0.01\n');
    fprintf(fid,'\t\t\t\t}\n');
    fprintf(fid,'\t\t\t}\n');
    fprintf(fid,'\t\t}\n');
    fprintf(fid,'\t}\n');
    
    fprintf(fid,'\tJOINT RightLeg\n');
    fprintf(fid,'\t{\n');
    fprintf(fid,'\t\tOFFSET\t%f\t%f\t%f\n',offset_righthipx,offset_righthipy,offset_righthipz);
    fprintf(fid,'\t\tCHANNELS 3 Zrotation Xrotation Yrotation\n');
    fprintf(fid,'\t\tJOINT RightKnee\n');
    fprintf(fid,'\t\t{\n');
    fprintf(fid,'\t\t\tOFFSET\t%f\t%f\t%f\n',offset_rightkneex,offset_rightkneey,offset_rightkneez);
    fprintf(fid,'\t\t\tCHANNELS 3 Zrotation Xrotation Yrotation\n');
    fprintf(fid,'\t\t\tJOINT RightAnkle\n');
    fprintf(fid,'\t\t\t{\n');
    fprintf(fid,'\t\t\t\tOFFSET\t%f\t%f\t%f\n',offset_rightanklex,offset_rightankley,offset_rightanklez);
    fprintf(fid,'\t\t\t\tCHANNELS 3 Zrotation Xrotation Yrotation\n');
    fprintf(fid,'\t\t\t\tEnd Site\n');
    fprintf(fid,'\t\t\t\t{\n');
    fprintf(fid,'\t\t\t\t\tOFFSET\t0.01\t0.01\t0.01\n');
    fprintf(fid,'\t\t\t\t}\n');
    fprintf(fid,'\t\t\t}\n');
    fprintf(fid,'\t\t}\n');
    fprintf(fid,'\t}\n');
    fprintf(fid,'}\n');
  

    fprintf(fid, 'MOTION\n');
    fprintf(fid, 'Frames: 3735\n');
    fprintf(fid, 'Frame Time: 0.033333\n');
    

R={3734,14};

Rdata=zeros(14,4,3734);
for m=2:2
    %骨架关节点
    p1=[Fdata(1,1,m);Fdata(1,2,m);Fdata(1,3,m)];
    p2=[Fdata(2,1,m);Fdata(2,2,m);Fdata(2,3,m)];
    p3=[Fdata(3,1,m);Fdata(3,2,m);Fdata(3,3,m)];
    p4=[Fdata(4,1,m);Fdata(4,2,m);Fdata(4,3,m)];
    p5=[Fdata(5,1,m);Fdata(5,2,m);Fdata(5,3,m)];
    p6=[Fdata(6,1,m);Fdata(6,2,m);Fdata(6,3,m)];
    p7=[Fdata(7,1,m);Fdata(7,2,m);Fdata(7,3,m)];
    p8=[Fdata(8,1,m);Fdata(8,2,m);Fdata(8,3,m)];
    p9=[Fdata(9,1,m);Fdata(9,2,m);Fdata(9,3,m)];
    p10=[Fdata(10,1,m);Fdata(10,2,m);Fdata(10,3,m)];
    p11=[Fdata(11,1,m);Fdata(11,2,m);Fdata(11,3,m)];
    p12=[Fdata(12,1,m);Fdata(12,2,m);Fdata(12,3,m)];
    p13=[Fdata(13,1,m);Fdata(13,2,m);Fdata(13,3,m)];
    p14=[Fdata(14,1,m);Fdata(14,2,m);Fdata(14,3,m)];
    p15=[Fdata(15,1,m);Fdata(15,2,m);Fdata(15,3,m)];
    
    %初始骨架
    ap1=[Fdata(1,1,1);Fdata(1,2,1);Fdata(1,3,1)];
    ap2=[Fdata(2,1,1);Fdata(2,2,1);Fdata(2,3,1)];
    ap3=[Fdata(3,1,1);Fdata(3,2,1);Fdata(3,3,1)];
    ap4=[Fdata(4,1,1);Fdata(4,2,1);Fdata(4,3,1)];
    ap5=[Fdata(5,1,1);Fdata(5,2,1);Fdata(5,3,1)];
    ap6=[Fdata(6,1,1);Fdata(6,2,1);Fdata(6,3,1)];
    ap7=[Fdata(7,1,1);Fdata(7,2,1);Fdata(7,3,1)];
    ap8=[Fdata(8,1,1);Fdata(8,2,1);Fdata(8,3,1)];
    ap9=[Fdata(9,1,1);Fdata(9,2,1);Fdata(9,3,1)];
    ap10=[Fdata(10,1,1);Fdata(10,2,1);Fdata(10,3,1)];
    ap11=[Fdata(11,1,1);Fdata(11,2,1);Fdata(11,3,1)];
    ap12=[Fdata(12,1,1);Fdata(12,2,1);Fdata(12,3,1)];
    ap13=[Fdata(13,1,1);Fdata(13,2,1);Fdata(13,3,1)];
    ap14=[Fdata(14,1,1);Fdata(14,2,1);Fdata(14,3,1)];
    ap15=[Fdata(15,1,1);Fdata(15,2,1);Fdata(15,3,1)];
    
    v1=ap2-ap1;
    v2=ap15-ap2;
    v3=ap2-ap3;
    v4=ap3-ap4;
    v5=ap4-ap5;
    v6=ap2-ap6;
    v7=ap6-ap7;
    v8=ap7-ap8;
    v9=ap15-ap9;
    v10=ap9-ap10;
    v11=ap10-ap11;
    v12=ap15-ap12;
    v13=ap12-ap13;
    v14=ap13-ap14;      
    
    %旋转后向量
    n1=p2-p1;
    n2=p15-p2;
    n3=p2-p3;
    n4=p3-p4;
    n5=p4-p5;
    n6=p2-p6;
    n7=p6-p7;
    n8=p7-p8;
    n9=p15-p9;
    n10=p9-p10;
    n11=p10-p11;
    n12=p15-p12;
    n13=p12-p13;
    n14=p13-p14;
    
    %计算旋转轴 给定旋转轴为向量叉乘
    c1=cross(v1,n1);
    c2=cross(v2,n2);
    c3=cross(v3,n3);
    c4=cross(v4,n4);
    c5=cross(v5,n5);
    c6=cross(v6,n6);
    c7=cross(v7,n7);
    c8=cross(v8,n8);
    c9=cross(v9,n9);
    c10=cross(v10,n10);
    c11=cross(v11,v11);
    c12=cross(v12,n12);
    c13=cross(v13,n13);
    c14=cross(v14,n14);
    
    
    %旋转轴的单位向量
    K1=c1/norm(c1);
    K2=c2/norm(c2);
    K3=c3/norm(c3);
    K4=c4/norm(c4);
    K5=c5/norm(c5);
    K6=c6/norm(c6);
    K7=c7/norm(c7);
    K8=c8/norm(c8);
    K9=c9/norm(c9);
    K10=c10/norm(c10);
    K11=c11/norm(c11);
    K12=c12/norm(c12);
    K13=c13/norm(c13);
    K14=c14/norm(c14);
    
    %向量单位化
    V1=v1/norm(v1);
    V2=v2/norm(v2);
    V3=v3/norm(v3);
    V4=v4/norm(v4);
    V5=v5/norm(v5);
    V6=v6/norm(v6);
    V7=v7/norm(v7);
    V8=v8/norm(v8);
    V9=v9/norm(v9);
    V10=v10/norm(v10);
    V11=v11/norm(v11);
    V12=v12/norm(v12);
    V13=v13/norm(v13);
    V14=v14/norm(v14);
    
%     display(c1);
    
    N1=n1/norm(n1);
    N2=n2/norm(n2);
    N3=n3/norm(n3);
    N4=n4/norm(n4);
    N5=n5/norm(n5);
    N6=n6/norm(n6);
    N7=n7/norm(n7);
    N8=n8/norm(n8);
    N9=n9/norm(n9);
    N10=n10/norm(n10);
    N11=n11/norm(n11);
    N12=n12/norm(n12);
    N13=n13/norm(n13);
    N14=n14/norm(n14);
    
    %求旋转角度    
    angle1=acos(dot(v1,n1)/(norm(v1)*norm(n1)));
    angle2=acos(dot(v2,n2)/(norm(v2)*norm(n2)));
    angle3=acos(dot(v3,n3)/(norm(v3)*norm(n3)));
    angle4=acos(dot(v4,n4)/(norm(v4)*norm(n4)));
    angle5=acos(dot(v5,n5)/(norm(v5)*norm(n5)));
    angle6=acos(dot(v6,n6)/(norm(v6)*norm(n6)));
    angle7=acos(dot(v7,n7)/(norm(v7)*norm(n7)));
    angle8=acos(dot(v8,n8)/(norm(v8)*norm(n8)));
    angle9=acos(dot(v9,n9)/(norm(v9)*norm(n9)));
    angle10=acos(dot(v10,n10)/(norm(v10)*norm(n10)));
    angle11=acos(dot(v11,n11)/(norm(v11)*norm(n11)));
    angle12=acos(dot(v12,n12)/(norm(v12)*norm(n12)));
    angle13=acos(dot(v13,n13)/(norm(v13)*norm(n13)));
    angle14=acos(dot(v14,n14)/(norm(v14)*norm(n14)));
       
    %旋转矩阵
    angle=[angle1 angle2 angle3 angle4 angle5 angle6 angle7 angle8 angle9 angle10 angle11 angle12 angle13 angle14];   
    G=[K1(1),K1(2),K1(3);
        K2(1),K2(2),K2(3);
        K3(1),K3(2),K3(3);
        K4(1),K4(2),K4(3);
        K5(1),K5(2),K5(3);
        K6(1),K6(2),K6(3);
        K7(1),K7(2),K7(3);
        K8(1),K8(2),K8(3);
        K9(1),K9(2),K9(3);
        K10(1),K10(2),K10(3);
        K11(1),K11(2),K11(3);
        K12(1),K12(2),K12(3);
        K13(1),K13(2),K13(3);
        K14(1),K14(2),K14(3)];
    
%     display(cross(K1,v1));
%     Vrot=cos(angle1)*v1+(1-cos(angle1))*dot(v1,K1)*K1+sin(angle1)*cross(K1,v1);
%     display(Vrot); 
    

    fprintf(fid,'%f\t%f\t%f\t',Fdata(15,1,m-1),Fdata(15,2,m-1),Fdata(15,3,m-1));
%   计算旋转矩阵
    for i=1:2
       WIKI=[0,-G(i,3),G(i,2);G(i,3),0,-G(i,1);-G(i,2),G(i,1),0];
%        R{m-1,i}=eye(3)*cos(angle(i))+(1-cos(angle(i)))*[G(i,1);G(i,2);G(i,3)]*[G(i,1),G(i,2),G(i,3)]+sin(angle(i))*[0,-G(i,3),G(i,2);G(i,3),0,-G(i,1);-G(i,2),G(i,1),0];
        R{m-1,i}=eye(3)+(1-cos(angle(i)))*(WIKI*WIKI)+sin(angle(i))*WIKI;
              
% ****************************%四元数*************************************
%         M=R{m-1,i};
%         tr=M(1,1)+M(2,2)+M(3,3);
%         
%         if tr>0
%             S=sqrt(tr+1)*2;
%             qw=0.25*S;
%             qx=(M(3,2)-M(2,3))/S;
%             qy=(M(1,3)-M(3,1))/S;
%             qz=(M(2,1)-M(1,2))/S;
%         elseif ((M(1,1)>M(2,2))&&(M(1,1)>M(3,3)))
%             S=sqrt(1+M(1,1)-M(2,2)-M(3,3))*2;
%             qw=(m(3,2)-m(2,3))/S;
%             qx=0.25*S;
%             qy=(M(1,2)+M(2,1))/S;
%             qz=(M(1,3)+M(3,1))/S;
%         elseif (M(2,2)>M(3,3))
%             S=sqrt(1+M(2,2)-M(1,1)-M(3,3))*2;
%             qw=(M(1,3)-M(3,1))/S;
%             qx=(M(1,2)+M(2,1))/S;
%             qy=0.25*S;
%             qz=(M(2,3)+M(3,2))/S;
%         else
%             S=sqrt(1+M(3,3)-M(1,1)-M(2,2))*2;
%             qw=(M(2,1)+M(1,2))/S;
%             qx=(M(1,3)+M(3,1))/S;
%             qy=(M(2,3)+M(3,2))/S;
%             qz=0.25*S;
%         end
%         
%        %构建四元数
%        Rdata(i,1,m-1)=qw;
%        Rdata(i,2,m-1)=qx;
%        Rdata(i,3,m-1)=qy;
%        Rdata(i,4,m-1)=qz;
    end
%     
%     R{m-1,2}=R{m-1,2};
%     R{m-1,1}=R{m-1,1}/R{m-1,2};
%         
%     R{m-1,3}=R{m-1,3}/R{m-1,2};
%     R{m-1,4}=R{m-1,4}/(R{m-1,2}*R{m-1,3});
%     R{m-1,5}=R{m-1,5}/(R{m-1,2}*R{m-1,3}*R{m-1,4});
%         
%     R{m-1,6}=R{m-1,6}/R{m-1,2};
%     R{m-1,7}=R{m-1,7}/(R{m-1,2}*R{m-1,6});
%     R{m-1,8}=R{m-1,8}/(R{m-1,2}*R{m-1,6}*R{m-1,7});
%         
%     R{m-1,9}=R{m-1,9};
%     R{m-1,10}=R{m-1,10}/R{m-1,9};
%     R{m-1,11}=R{m-1,11}/(R{m-1,9}*R{m-1,10});
%         
%     R{m-1,12}=R{m-1,12};
%     R{m-1,13}=R{m-1,13}/R{m-1,12};
%     R{m-1,14}=R{m-1,14}/(R{m-1,12}*R{m-1,13});
            
%************************bvh******************************************
%     for i=1:14
%         M=R{m-1,i};
%         Rz=atan2(-M(1,2),M(2,2))*180/pi;
%         Rx=atan2((M(3,2)),sqrt((M(2,2))^2+(M(1,2))^2))*180/pi;
%         Ry=atan2(-M(3,1),M(3,3))*180/pi;
%         fprintf(fid,'%f\t%f\t%f\t',Rz,Rx,Ry);
%     
%     end   
    fprintf(fid,'\n');
end

%计算单位化比例
l1=v1(1)/V1(1);

l2=n1(1)/N1(1);

l3=v2(1)/V2(1);
l4=n2(1)/N2(1);
%显示旋转矩阵
display(R{1,1})
%单位化后的初始向量
display(V1)
%初始向量
display(v1);
%单位化后的旋转后的向量
display(N1);
%旋转后的向量
display(n1);

%比例
display(l1);

display(l2);

%验证是否y1=N1
y1=R{1,1}*V1;
display(y1);
%验证是否Y1=N1
Y1=l2*y1;
display(Y1);

%更新旋转矩阵
Q1=(l2/l1)*R{1,1}*v1;
display(Q1);

% %******************************************************
%当前帧 三个节点 p_1为head p_2 为neck p_15为hip（root）
p_1=[Fdata(1,1,2);Fdata(1,2,2);Fdata(1,3,2)];
p_15=[Fdata(15,1,2);Fdata(15,2,2);Fdata(15,3,2)];

%上一帧
p1=[Fdata(1,1,1);Fdata(1,2,1);Fdata(1,3,1)];
p2=[Fdata(2,1,1);Fdata(2,2,1);Fdata(2,3,1)];
p15=[Fdata(15,1,1);Fdata(15,2,1);Fdata(15,3,1)];

%向量
v2=p2-p15;
v1=p1-p2;

%p_1=p_15 + R2*v2 + R1*v1     p_15=Mt+p15   为根节点位移

 Mt=p_15-p15;
 display(Mt);
 display(p15)
 display(p_15);
PQ=p_15+(l2/l1)*R{1,1}*v1+(l4/l3)*R{1,2}*v2;

display(R{1,1})
display(R{1,2}/R{1,1})

display(p_1);
display(PQ);


resultname=('result/Rdata.mat');
save(resultname,'Rdata');

function [] = alternative()
    
    trainFeatures = test();
    % K-means clustering
    [idx,C] = kmeans(trainFeatures,3);
    % separating the clusters in 3 matrices Z1-3 - classes
    Z1 = trainFeatures(idx==1,:);
    Z2 = trainFeatures(idx==2,:);
    Z3 = trainFeatures(idx==3,:);
    % plotting the matrices Z1-3
    figure
    hold on
    trainLegT = scatter(Z1(:,1),Z1(:,2), 'magenta', 'c');
    trainLegV = scatter(Z2(:,1),Z2(:,2), 'cyan', 'c');
    trainLegS = scatter(Z3(:,1),Z3(:,2), 'green', 'c');
    % find the centroids of the three clusters
    u1 = mean(Z1);
    u2 = mean(Z2);
    u3 = mean(Z3);
    % plotting the decision boundaries using
    % the voronoi and the centroids
    centrLeg = voronoi(C(:,1),C(:,2), 'x-k');
    
    %obtaining test data sets
    testVectorT = features('t');
    testVectorV = features('v');
    testVectorS = features('s');
    testVectorA = features('A');
    testVectorB = features('B');
    
    % finding nearest neighbour for T
    d = min(min(pdist2(testVectorT,u1),pdist2(testVectorT,u2)),pdist2(testVectorT,u3));
    for j=1:10
        if d(j,1)==pdist2(testVectorT(j,:),u1)
            V(j,1)=1;
        elseif d(j,1)==pdist2(testVectorT(j,:),u2)
            V(j,1)=2;
        else
            V(j,1)=3;
        end
    end
    % separating the test data in 3 matrices - classes
    i1=1;
    i2=1;
    i3=1;
    Zm1 = zeros(10,2);
    Zm2 = zeros(10,2);
    Zm3 = zeros(10,2);
    for j=1:10
        if V(j,1)==1
            Zm1(i1,:)=testVectorT(j,:);
            i1=i1+1;
        elseif V(j,1)==2
            Zm2(i2,:)=testVectorT(j,:);
            i2=i2+1;
        else
            Zm3(i3,:)=testVectorT(j,:);
            i3=i3+1;
        end
    end
    % plotting the new matrices on the clusters
    legTestT = scatter(Zm1(:,1),Zm1(:,2), 'dm', 'full');
    scatter(Zm2(:,1),Zm2(:,2), 'dm', 'full');
    scatter(Zm3(:,1),Zm3(:,2), 'dm', 'full');
    
    % finding nearest neighbour for V
    d = min(min(pdist2(testVectorV,u1),pdist2(testVectorV,u2)),pdist2(testVectorV,u3));
    for j=1:10
        if d(j,1)==pdist2(testVectorV(j,:),u1)
            V(j,1)=1;
        elseif d(j,1)==pdist2(testVectorV(j,:),u2)
            V(j,1)=2;
        else
            V(j,1)=3;
        end
    end
    % separating the test data in 3 matrices - classes
    i1=1;
    i2=1;
    i3=1;
    Zm1 = zeros(10,2);
    Zm2 = zeros(10,2);
    Zm3 = zeros(10,2);
    for j=1:10
        if V(j,1)==1
            Zm1(i1,:)=testVectorV(j,:);
            i1=i1+1;
        elseif V(j,1)==2
            Zm2(i2,:)=testVectorV(j,:);
            i2=i2+1;
        else
            Zm3(i3,:)=testVectorV(j,:);
            i3=i3+1;
        end
    end
    % plotting the new matrices on the clusters
    legTestV = scatter(Zm1(:,1),Zm1(:,2), 'dc', 'full');
    scatter(Zm2(:,1),Zm2(:,2), 'dc', 'full');
    scatter(Zm3(:,1),Zm3(:,2), 'dc', 'full');
    
        % finding nearest neighbour for V
    d = min(min(pdist2(testVectorS,u1),pdist2(testVectorS,u2)),pdist2(testVectorS,u3));
    for j=1:10
        if d(j,1)==pdist2(testVectorS(j,:),u1)
            V(j,1)=1;
        elseif d(j,1)==pdist2(testVectorS(j,:),u2)
            V(j,1)=2;
        else
            V(j,1)=3;
        end
    end
    % separating the test data in 3 matrices - classes
    i1=1;
    i2=1;
    i3=1;
    Zm1 = zeros(10,2);
    Zm2 = zeros(10,2);
    Zm3 = zeros(10,2);
    for j=1:10
        if V(j,1)==1
            Zm1(i1,:)=testVectorS(j,:);
            i1=i1+1;
        elseif V(j,1)==2
            Zm2(i2,:)=testVectorS(j,:);
            i2=i2+1;
        else
            Zm3(i3,:)=testVectorS(j,:);
            i3=i3+1;
        end
    end
    % plotting the new matrices on the clusters
    legTestS = scatter(Zm1(:,1),Zm1(:,2), 'dg', 'full');
    scatter(Zm2(:,1),Zm2(:,2), 'dg', 'full');
    scatter(Zm3(:,1),Zm3(:,2), 'dg', 'full');
    
    % finding nearest neighbour for A
    d = min(min(pdist2(testVectorA,u1),pdist2(testVectorA,u2)),pdist2(testVectorA,u3));
    if d(1,1)==pdist2(testVectorA(1,:),u1)
        V(1,1)=1;
    elseif d(1,1)==pdist2(testVectorA(1,:),u2)
        V(1,1)=2;
    else
        V(1,1)=3;
    end
    Zm1 = zeros(1,2);
    Zm2 = zeros(1,2);
    Zm3 = zeros(1,2);
    if V(1,1)==1
        Zm1(1,:)=testVectorA(1,:);
    elseif V(1,1)==2
        Zm2(1,:)=testVectorA(1,:);
    else
        Zm3(1,:)=testVectorA(1,:);
    end
    legA = scatter(Zm1(1,1),Zm1(1,2), '*r');
    scatter(Zm2(1,1),Zm2(1,2), '*r');
    scatter(Zm3(1,1),Zm3(1,2), '*r');
    
     % finding nearest neighbour for B
    d = min(min(pdist2(testVectorB,u1),pdist2(testVectorB,u2)),pdist2(testVectorB,u3));
    if d(1,1)==pdist2(testVectorB(1,:),u1)
        V(1,1)=1;
    elseif d(1,1)==pdist2(testVectorB(1,:),u2)
        V(1,1)=2;
    else
        V(1,1)=3;
    end
    Zm1 = zeros(1,2);
    Zm2 = zeros(1,2);
    Zm3 = zeros(1,2);
    if V(1,1)==1
        Zm1(1,:)=testVectorB(1,:);
    elseif V(1,1)==2
        Zm2(1,:)=testVectorB(1,:);
    else
        Zm3(1,:)=testVectorB(1,:);
    end
    legB = scatter(Zm1(1,1),Zm1(1,2), '*b');
    scatter(Zm2(1,1),Zm2(1,2), '*b');
    scatter(Zm3(1,1),Zm3(1,2), '*b');
    
    xlabel('First Feature');
    ylabel('Second Feature');
    %legend([trainLegT, trainLegV, trainLegS, centrLeg, legTestT, legTestV, legTestS, legA, legB] , 'train T', 'train V', 'train S', 'centroids', 'test T', 'test V', 'test S', 'A', 'B');
end

function [trainFeatures] = test()
    x = 0:10:300;
    y = 0:10:600;
    [X,Y] = meshgrid(x,y);
    x = X(:);
    y = Y(:);
    testVectorGeneric = [x,y];
    
    classes=[];
    for k = 1:10
        classes = [classes;'T'];
    end
    for k = 1:10
        classes = [classes;'V'];
    end
    for k = 1:10
        classes = [classes;'S'];
    end
    trainFeatures = clusters(); 
    
    classifyGeneric = knnclassify(testVectorGeneric,trainFeatures,classes);
    classGridT = testVectorGeneric(classifyGeneric=='T',:);
    classGridV = testVectorGeneric(classifyGeneric=='V',:);
    classGridS = testVectorGeneric(classifyGeneric=='S',:);
    scatter(classGridT(:,1),classGridT(:,2), 'magenta', '+' );
    scatter(classGridV(:,1),classGridV(:,2), 'cyan', '+' );
    scatter(classGridS(:,1),classGridS(:,2), 'green', '+' );
    
    testVectorT = features('t');
    testVectorV = features('v');
    testVectorS = features('s');   
    scatter(testVectorT(:,1),testVectorT(:,2), 'magenta', 'd', 'full' );
    scatter(testVectorV(:,1),testVectorV(:,2), 'cyan', 'd', 'full' );
    scatter(testVectorS(:,1),testVectorS(:,2), 'green', 'd', 'full' );
    classifyT = knnclassify(testVectorT,trainFeatures,classes)
    classifyV = knnclassify(testVectorV,trainFeatures,classes)
    classifyS = knnclassify(testVectorS,trainFeatures,classes)
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    testVectorA = features('A');
    testVectorB = features('B');
    scatter(testVectorA(:,1),testVectorA(:,2), '*red');
    scatter(testVectorB(:,1),testVectorB(:,2), '*blue');
    classifyA = knnclassify(testVectorA,trainFeatures,classes)
    classifyB = knnclassify(testVectorB,trainFeatures,classes)
    
    legend('train T', 'train V', 'train S', 'class T', 'class V','class S','test T', 'test V', 'test S', 'A', 'B');
    xlabel('First Feature');
    ylabel('Second Feature');
    hold off
end

function [trainFeatures] = clusters()
    featureVectorT = features('T');
    featureVectorV = features('V');
    featureVectorS = features('S');
    figure
    hold on
    scatter(featureVectorT(:,1),featureVectorT(:,2), 'magenta', 'c');
    scatter(featureVectorV(:,1),featureVectorV(:,2), 'cyan', 'c');
    scatter(featureVectorS(:,1),featureVectorS(:,2), 'green', 'c' );
    trainFeatures = [featureVectorT;featureVectorV;featureVectorS];
end

function [sectionMean] = features(char)
   Letters = dir(strcat(char, '*.GIF'));
   n = length(Letters);
   result = {};
   sectionMean1 =[];
   sectionMean2 =[];
   letterSum = zeros(400,640);
   for k=1:n
       filename = Letters(k).name;
       result{k} = transform (imread (filename));
       letterSum = letterSum + result{k};
       section1 = result{k}(155:185,310:330);
       sectionMean1 = [sectionMean1;mean2(section1)];
       section2 = result{k}(170:195,325:345);
       sectionMean2 = [sectionMean2;mean2(section2)];
   end
%    figure
%    imagesc(log(abs(letterSum)+1));
%    line([310 310],[155 185],'Color','r','LineWidth',2);
%    line([310 330],[155 155],'Color','r','LineWidth',2);
%    line([310 330],[185 185],'Color','r','LineWidth',2);
%    line([330 330],[155 185],'Color','r','LineWidth',2);
%    line([325 325],[170 195],'Color','m','LineWidth',2);
%    line([325 345],[170 170],'Color','m','LineWidth',2);
%    line([325 345],[195 195],'Color','m','LineWidth',2);
%    line([345 345],[170 195],'Color','m','LineWidth',2);
   sectionMean = horzcat(sectionMean1,sectionMean2);
end

function [ffmag,ff] = transform(imdata)
    f = fft2(double(imdata));
    ff = fftshift(f);
    ffmag = abs(ff);
%     figure
%     imagesc(log(abs(ff)+1));
%     colorbar;  
end
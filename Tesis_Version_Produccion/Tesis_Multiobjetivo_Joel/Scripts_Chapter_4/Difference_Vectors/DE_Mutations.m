figure

%plot([0, 1],[1, 0],'-r')

NVectors =50;
k = combntns(1:NVectors,2);
k = [k; [k(:,2) k(:,1)]];
sizek = size(k,1)
z = zeros(size(k,1), 2);
rand('seed', 40);

A = rand(NVectors,2);

[X, Y, D] = GetPointsRandom(NVectors, 1, 1, 0.125);
%[X, Y, D] = GetPointsRandom(NVectors, 1, 1, 0.001);
%[X Y] = meshgrid(0:1/sqrt(NVectors*(NVectors-1)+2) :1, 0:1/sqrt(NVectors*(NVectors-1)+2):1);

A = [X(:), Y(:)];

F=1
diff = F*(A(k(:,1),:)-A(k(:,2),:))

%%f2 = F*( min( sum(sqrt(A(k(:,1) - repmat([0 0], sizek )).^2),2),sum(sqrt( repmat([1 1], sizek ) - A(k(:,1)))).^2) );

%norm1 = sqrt(sum(  (  repmat([0.5 0.5], sizek )   ).^2,2 ));
%norm22 = sqrt(sum(  (  repmat([0.5 0.5], sizek )  ).^2,2 ));

%f2 = F*( min(norm1, norm22) );

%f2 = bsxfun(@rdivide,f2,sqrt(sum(  (  diff ).^2,2 ) ));
%f2 = min(f2, F)

%DF2=bsxfun(@times,f2,A(k(:,1),:)-A(k(:,2),:));

%plot(DF2(:,1)+repmat([0.5 0.5], sizek ), DF2(:,2)+repmat([0.5 0.5], sizek ), '.')

plot(diff(:,1), diff(:,2), '.')
title('Distribución de los vectores conformados por las diferencias')

%pause(100)

quiver(z(:,1), z(:,2), diff(:,1), diff(:,2) )
title('Distribución de los vectores conformados por las diferencias')
pause(10)


a = [1:NVectors]'; b = num2str(a-1); c = cellstr(b);
k = combntns(1:NVectors,2);
z = zeros(2*size(k,1), 2)
z(1:2:end,:) = A(k(:,1),:)
z(2:2:end,:) = A(k(:,2),:)
plot( z(:,1), z(:,2), '-')
hold on
plot(z(:,1), z(:,2),  '.black', 'MarkerSize',20)
text( A(:,1)+0.02, A(:,2), strcat(strcat('X_{',c),'}'));
title('Vectores conformados por las diferencias')
%plot( z(:,1), z(:,2), '.-')

%plot( diff(:,1), diff(:,2), '.black')

% 
% text( 1.2*cos(pi/4), 1.2*sin(pi/4)-0.3, 'X_4')
% plot(1.2*cos(pi/4), 1.2*sin(pi/4)-0.2,  '.black', 'MarkerSize',20)
%xlabel('x_1')
%ylabel('x_2')

%plot(t,sin(t),'-.r*')

%plot(t,sin(t-pi/2),'--mo')
%plot(t,sin(t-pi),':bs')
%hold off
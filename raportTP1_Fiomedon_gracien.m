%RAPORT DE  TP1

%NOM PRENOMS : FIOMEDON KOFFI A H GRACIEN

%GENIE INFORMATIQUE



%%

                                %DEINITION D'UNE IMAGE

I = repmat([1:256],256,1);

figure,image(I),title('image');

figure,imagesc(I),title('imagesc');

%l'affichage de l'image avec imagesc affiche plus de nuance que celle avec
%image


%%

                                %AFFICHAGE DE L'IMAGE AVEC DES PALETTES

%affichage avec la pallete de gris
figure,imagesc(I),colormap('gray'),title('palette de gris');
%affichage avec la pallete de de bleu
figure;imagesc(I);colormap('cool');title('bleu ciel au violet');
%palette personnelle de couleur 

    %pallette de gris de niveau 256
E = linspace(0,1,256);
palette256=repmat(E',1,3);

gris256=colormap(palette256);

figure,imagesc(I),colormap(gris256),title('ma palette de gris 256');



%une palette de couleurs est un nuancier de différentes teintes
%elle permet de repérer les variations de teinte sur une image 
%au format numerique les coleurs sont representés sur 3 valeurs (RGB)
%Avec MATLAB, une couleur peut être exprimée soit en spécifiant explicitement 
%les trois valeurs R, G et B, soit par l'intermédiaire d'un indice dans une table
%contenant elle-même des couleurs RGB. Dans le premier cas, on parle de couleurs vraies
%(true color en anglais) alors que dans le second, on parle de couleur indexée


%%

                            %MANIPULATION D'UNE IMAGE

cmrtif=imfinfo('cameraman.tif');
% 1->cameraman.tif fait une dimension de 256*256 avec un colortype de grayscale
%sans aucune info sur le colormap,PhotometricInterpretation on est sur du
%blackIsZero

  lenatif=imfinfo('lena.tif');
% 1-> lena.tif fait une dimension de 512*512 avec un colortype de truecolor
%,PhotometricInterpretation on est sur du RGB

lenabmp=imfinfo('lena.bmp');


% 1-> lena.bmp fait une dimension de 512*512 avec un colortype de indexed
%un colormap sur du 256*3 gris


%2-> un fichier bitmap ou encore un fichier BMP est un format de fichier d’image
%pixellisé de trés grande qualité Ce format de fichier contient beaucoup d’informations
%et aura donc tendance à être assez lourd mais beaucoup plus adapté pour les retouches
%L’affichage au format BMP est généralement de meilleure qualité. Dans une image BMP, chaque pixel possède sa propre couleur.
%Ce type de fichier peut aussi contenir des informations telles que l'intensité des couleurs, des profils colorimétriques
%ou des couches alpha, ce qui confère aux images une résolution plus élevée . 
%Du fait de leur meilleure qualité et de leur plus haute résolution, les fichiers BMP 
%sont plus faciles à retoucher car le nombre de pixels à manipuler est plus important. 


% 2 -> L’abréviation TIFF, ou plus rarement TIF, signifie « Tagged Image File Format ».
%Cette désignation indique la structure d’un fichier TIFF : le fichier se compose essentiellement
%de champs de données qui contiennent desmétadonnées étendues au moyen de balises.
%Un fichier TIFF prend en charge les niveaux de gris ainsi que les espaces colorimétriquesRVB, 
%CMJN et CIELAB. Le format permet une profondeur de couleur allant jusqu’à 16 bits par canal 
%de couleur et convient donc parfaitement à l’échange de données lors d’une conversion RAW.



%2 -> les formats d'images supporte par matlab
%BMP ; CUR ; EMF ; EPS ; GIF ; HDF ; ICO ; ILL ; JPEG/JPEG2000 ; PBM ; PCX 
%PGM ; PNG ; PNM ; PPM ; RAS ; TIFF ; XWD


%3 -> les commandes matlab pour :

%3 ->lire une ligne d'une image
% img=imread('nomimg');
%imshow(img(ligne,:));

%3 -> lire une image en entier
    %nous avons  imread pour lire image imagesc et imshow pour afficher
%3 -> ecrire une image entiere nous avons imwrite


%4 ->lecture et affichage
Cameraman=imread('cameraman.tif');
figure;
subplot(1,3,1);imshow(Cameraman);title('image complete');
subplot(1,3,2);imshow(Cameraman(35,:));title('ligne 35');
subplot(1,3,3);imshow(Cameraman(:,185));title('colonne 185');
%% 
                         %TRANSFORMATION GEOMETRIQUE

%imrotate
Camerabmp=imread('cameraman.tif');

rot1=imrotate(Camerabmp,-45);
rot2=imrotate(Camerabmp,-90);
rot3=imrotate(Camerabmp,45);
rot4=imrotate(Camerabmp,90);

figure;subplot(1,4,1);imshow(rot1);title('rotate -45 ');
subplot(1,4,2);imshow(rot2);title('rotate -90 ');
subplot(1,4,3);imshow(rot3);title('rotate 45 ');
subplot(1,4,4);imshow(rot4);title('rotate 90 ');

%imresize
[Cameraris,map] =imread('cameraman.bmp');

resiz1=imresize(Cameraris,0.5);
resiz2=imresize(Cameraris,0.1);
resiz3=imresize(Cameraris,1.5);
resiz4=imresize(Cameraris,2.5);


figure(2);subplot(1,4,1);imshow(resiz1);title('resize 0.5');
subplot(1,4,2);imshow(resiz2);title('resize 0.1');
subplot(1,4,3);imshow(resiz3);title('resize 1.5');
subplot(1,4,4);imshow(resiz4);title('resize 2.5');

%%

                %SEPARATION DES COULEURS
 chat1=imread('chat1.jpg');
 chat1R=chat1(:,:,1);
 chat1G=chat1(:,:,2);
 chat1B=chat1(:,:,3);
 figure;
 subplot(2,2,1);imshow(chat1);title('original');
 subplot(2,2,2);imshow(chat1R);title('Red');
 subplot(2,2,3);imshow(chat1G);title('Green');
 subplot(2,2,4);imshow(chat1B);title('Blue')
  
 
 
 
 chat2=imread('chat2.jpg');
 chat2R=chat2(:,:,1);
 chat2G=chat2(:,:,2);
 chat2B=chat2(:,:,3);
 figure(2);
 subplot(2,2,1);imshow(chat2);title('original');
 subplot(2,2,2);imshow(chat2R);title('Red');
 subplot(2,2,3);imshow(chat2G);title('Green');
 subplot(2,2,4);imshow(chat2B);title('Blue');
 
 %conversion image rgb en une image de niveau de gris
 
chat1ng=rgb2gray(chat1);
chat2ng=rgb2gray(chat2);

figure(3);subplot(2,2,1);imshow(chat1);title('original chat 1 ');
subplot(2,2,2);imshow(chat1ng);title('rgb2gray chat1');
subplot(2,2,3);imshow(chat2);title('original chat 2');
subplot(2,2,4);imshow(chat2ng);title('rgb2gray chat2');
%%

%Quantification 


Qcmr = imread('cameraman.tif');

[X1, map1] = gray2ind(Qcmr, 128);
[X2, map2] = gray2ind(Qcmr, 64);
[X3, map3] = gray2ind(Qcmr, 32);
[X4, map4] = gray2ind(Qcmr, 16);
[X5, map5] = gray2ind(Qcmr, 8);
[X6, map6] = gray2ind(Qcmr, 4);
[X7, map7] = gray2ind(Qcmr, 2);


figure(1);subplot(3,3,1);imshow(X1, map1);title('128');
subplot(3,3,2);imshow(X2, map2);title('64');
subplot(3,3,3);imshow(X3, map3);title('32');
subplot(3,3,4);imshow(X4, map4);title('16');
subplot(3,3,5);imshow(X5, map5);title('8');
subplot(3,3,6);imshow(X6, map6);title('4');
subplot(3,3,7);imshow(X7, map7);title('2');






%PCA code
data=SimilaritydataS2;%
a=table2array(data);
b=normalize(a,"range");
r=corrcoef(b);%calculate the correlation coefficient matrix
[vec1,lamda,rate]=pcacov(r);%vec1 is the eigenvector
contr=cumsum(rate);
f=repmat(sign(sum(vec1)),size(vec1,1),1);
vec2=vec1.*f;
num=4;%The number of components we choose
df=b*vec2(:,1:num);
tf=df*rate(1:num)/100;
[stf,ind]=sort(tf,'descend');%sort the vector
stf=stf';
ind=ind';
xvar={"Avant-Garde","Blues","Children's","Classical","Comedy/Spoken","Country","Easy Listening","Electronic", "Folk", "International","Jazz", "Latin","New Age","Pop/Rock","R&B","Reggae","Religious","Stage & Screen","Unknown","Vocal"};
yvar = {"danceability","energy","valence","tempo","loudness","mode","key","acousticness","instrumentalness","liveness","speechiness","explicit","duration_ms","popularity"};
h=heatmap(xvar,yvar,r);%draw the heatmap
h.title("CORRELATION HEATMAP");

%Similarity(cosine distance)
a=zscore(a);%Standardize the data
cos=[];%initialize the cos matrix
%cosine similarity
for i=1:20
    for j=1:20
        x1=a(i,:);
        x2=a(j,:);
        cos(i,j)=x1*x2'./sqrt(sum(x1.^2).*sum(x2.^2));
    end
end
x=cos;
xvar ={"Avant-Garde","Blues","Children","Classical","Comedy/Spoken","Country","Easy Listening","Electronic","Folk","International","Jazz","Latin","New Age","Pop/Rock","R&B","Reggae","Religious","Stage&Screen","Unknown","Vocal"};
h=heatmap(xvar,xvar,x);
h.title("MUSIC GENRES SIMILARITY");




   
   
   
   